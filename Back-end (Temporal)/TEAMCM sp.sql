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

IF EXISTS (SELECT 1 FROM dbo.cew_menu where me_url = @new_url AND me_name = @new_menuName)
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
declare @nombre_rol varchar(100)
declare @new_rol_id int
set @nombre_rol = 'CAPACITACION'
set @new_rol_id = (isnull((SELECT max(ro_rol) from dbo.ad_rol),0)+1)
IF EXISTS (SELECT 1 FROM dbo.ad_rol where ro_descripcion = @nombre_rol)
begin
	delete from dbo.ad_rol
	where ro_descripcion = @nombre_rol
end
	insert into dbo.ad_rol
	(
	ro_rol
	, ro_filial
	, ro_descripcion
	, ro_fecha_crea
	, ro_creador
	, ro_estado
	, ro_fecha_ult_mod
	, ro_time_out
	, ro_admin_seg
	, ro_departamento
	, ro_oficina
	)
values
	(
	@new_rol_id -- ultimo +1
	, 1
	, 'CAPACITACION SEMILLERO'
	, getdate()
	, 3
	, 'V'
	, getdate()
	, 900
	, NULL
	, NULL
	, NULL
	)
   --	select * from ad_rol
go
--Crear Menus
   -- Crear Menu Principal
   declare @url varchar(100)
   declare @menu_principal_name varchar(100)
 
   set @url = null
   set @menu_principal_name = 'Fase 4 TCM'
   exec sp_crearMenu 	@new_url = @url,  @new_id_parent = 2739,
			@new_menuName = @menu_principal_name,
			@new_role = (SELECT ro_rol FROM dbo.ad_rol where ro_descripcion = @nombre_rol), --Rol capacitacion
			@new_id_cobi_product = 100,
			@new_description = 'Menu fase 4 capacitacion',
			@new_order = 1  
		
   		--Crear menu Estudiantes
   		-- Menu DJVG: Daniel Vasquez Form: 'EstudianteDJVGFORM'
			set @url = 'views/DJVGB/FRMLR/T_DJVGBBWKLRWXY_449/1.0.0/VC_NOTASEJJRR_456449_TASK.html'
			exec sp_crearMenu 	@new_url = @url,  @new_id_parent = (SELECT me_id FROM dbo.cew_menu where me_url = @new_url AND me_name = @menu_principal_name), -- Menu anterior
			@new_menuName = 'Estudiante DJVG',
			@new_role = (SELECT ro_rol FROM dbo.ad_rol where ro_descripcion = @nombre_rol), --Rol capacitacion
			@new_id_cobi_product = 100,
			@new_description = 'Estudiante Daniel Vasquez DJVG',
			@new_order = 1  
	   		
   		
   		