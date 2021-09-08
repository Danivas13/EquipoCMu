use cobis
go

if OBJECT_ID('sp_crearMenu') is not null
begin
	drop procedure sp_crearMenu
end

go
create procedure sp_crearMenu
		@new_url 				varchar(255),
		@new_id_parent  		int = null,
		@new_menuName 			varchar(100),
		@new_role 				tinyint,
		@new_id_cobi_product 	smallint,
		@new_description 		varchar(255) = '',
		@new_order 				smallint = 1
as    
begin

IF EXISTS (SELECT 1 FROM dbo.cew_menu where me_url = @new_url)
begin
Print('Eliminando menu')
 Delete from cew_menu_role where mro_id_menu = (SELECT me_id FROM dbo.cew_menu where me_url = @new_url)
 Delete from cew_menu where me_url = @new_url
end
declare @new_id int
set @new_id = (isnull((SELECT max(me_id) from dbo.cew_menu),0)+1)



INSERT INTO cew_menu 
		(me_id,	  me_id_parent,   me_name, 		me_visible, me_url,   me_order,   me_id_cobis_product,  me_option, me_description,   me_version, me_container)
VALUES  (@new_id, @new_id_parent, @new_menuName,1, 			@new_url, @new_order, @new_id_cobi_product, 0, 		   @new_description, NULL, 		 'CWC')



INSERT INTO dbo.cew_menu_role (mro_id_menu, mro_id_role)
VALUES (@new_id, @new_role)
	
	
	select 
		'Codigo' 		= cl_codigo,
		'Cedula'		= cl_cedula,
		'Nombre' 		= cl_nombre,
		'Apellido'		= cl_apellido,
		'Direccion'		= cl_direccion,
		'Telefono'		= cl_telefono	  
		from eva_cliente
		
	select 
		'Codigo' 		= cl_codigo,
		'Cedula'		= cl_cedula,
		'Nombre' 		= cl_nombre,
		'Apellido'		= cl_apellido,
		'Direccion'		= cl_direccion,
		'Telefono'		= cl_telefono	  
		from eva_cliente

	select
		me_id as 'me_id',
		'me_id_parent'			= me_id_parent,
		'me_name'				= me_name,
		'me_visible'			= me_visible,
		'me_url'				= me_url,
		'me_order'				= me_order,
		'me_id_cobis_product'	= me_id_cobis_product,
		'me_option'				= me_option,
		'me_description'		= me_description,
		'me_version'			= me_version,
		'me_container'			= me_container
		from dbo.cew_menu
	 	where me_id = @new_id

return 0
end
go
--Crear Rol

--Crear Menus
   -- Crear Menu Principal
   		--Crear menu Estudiantes
   		-- Menu DJVG: Daniel Vasquez Form: 'EstudianteDJVGFORM'