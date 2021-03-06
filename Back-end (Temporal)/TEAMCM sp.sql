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

IF EXISTS (SELECT 1 FROM dbo.cew_menu where me_name = @new_menuName)
begin
print ('Ya existe')
 Delete from cew_menu_role where mro_id_menu = (SELECT me_id FROM dbo.cew_menu where me_name = @new_menuName)
 
Delete from cew_menu_role where mro_id_menu in (SELECT me_id FROM dbo.cew_menu where me_id_parent = (SELECT me_id FROM dbo.cew_menu where me_name = @new_menuName)) 
delete from dbo.cew_menu where me_id_parent = (SELECT me_id FROM dbo.cew_menu where me_name = @new_menuName)
Print('Eliminando menu '+ 'Fase 4 TCM')
delete from dbo.cew_menu where me_id in (SELECT me_id FROM dbo.cew_menu where me_id_parent = (SELECT me_id FROM dbo.cew_menu where me_name = @new_menuName))
Delete from cew_menu where me_name = @new_menuName
print ('Eliminando '+@new_menuName)
end
declare @new_id int
set @new_id = (isnull((SELECT max(me_id) from dbo.cew_menu),0)+1)



INSERT INTO cew_menu 
		(me_id,	  me_id_parent,   me_name, 		me_visible, me_url,   me_order,   me_id_cobis_product,  me_option, me_description,   me_version, me_container)
VALUES  (@new_id, @new_id_parent, @new_menuName,1, 			@new_url, @new_order, @new_id_cobi_product, 0, 		   @new_description, NULL, 		 'CWC')

 print ('Creando '+@new_menuName+' Con me_id = '+ CONVERT(varchar(10), @new_id) )

INSERT INTO dbo.cew_menu_role (mro_id_menu, mro_id_role)
VALUES (@new_id, @new_role)


return 0
end
go




-- Crear Rol
declare @nombre_rol varchar(100)
declare @new_rol_id int
set @nombre_rol = 'CAPACITACION SEMILLERO'

select * from cl_catalogo where valor = 'SEMILLERO'
set @new_rol_id = 227

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
	, @nombre_rol
	, getdate()
	, 3
	, 'V'
	, getdate()
	, 900
	, NULL
	, NULL
	, NULL
	)
  SELECT * FROM dbo.ad_rol where ro_descripcion = 'CAPACITACION SEMILLERO'
   
   --	select * from ad_rol
--Crear Menus
   -- Crear Menu Principal
   declare @url varchar(100)
   declare @menu_principal_name varchar(160)
   declare @parent_id int
   
   set @url = null
   set @menu_principal_name = 'Fase 4 TCM'
  select * from cew_menu where me_name = 'Fase 4 TCM'
   exec sp_crearMenu 	@new_url = null,  @new_id_parent = null,
			@new_menuName = @menu_principal_name,
			@new_role = @new_rol_id, --Rol capacitacion
			@new_id_cobi_product = 100,
			@new_description = 'Menu fase 4 capacitacion',
			@new_order = 1  
			

	select me_id FROM dbo.cew_menu where me_name = 'Fase 4 TCM'
	SELECT @parent_id = me_id FROM dbo.cew_menu where me_name = 'Fase 4 TCM'
   		--Crear menu Estudiantes
   		-- REPETIR PARA  CADA UNO
	   		-- Menu DJVG: Daniel Vasquez Form: 'EstudianteDJVGFORM'
				set @url = 'views/MMUNS/SSMMM/T_MMUNSZCFGOGHZ_136/1.0.0/VC_ESTUDIANJG_749136_TASK.html'
				exec sp_crearMenu 	@new_url = @url,  @new_id_parent = @parent_id, -- Menu anterior
				@new_menuName = 'Estudiante DJVG',
			  	@new_role = @new_rol_id, --Rol capacitacion
				@new_id_cobi_product = 100,
				@new_description = 'Estudiante Daniel Vasquez DJVG',
				@new_order = 1    
		
				set @url = 'views/MMUNS/SSMMM/T_MMUNSHNCIBHEI_238/1.0.0/VC_ESTUDIANJT_343238_TASK.html'
				exec sp_crearMenu 	@new_url = @url,  @new_id_parent = @parent_id, -- Menu anterior
				@new_menuName = 'Estudiante_JPMC',
				@new_role = @new_rol_id, --Rol capacitacion
				@new_id_cobi_product = 100,
				@new_description = 'Estudiante Juan Pablo Macias JPMC',
				@new_order = 2 
				
				set @url = 'views/MMUNS/SSMMM/T_MMUNSTDHCDWWU_517/1.0.0/VC_ESTUDIANET_490517_TASK.html'
				exec sp_crearMenu 	@new_url = @url,  @new_id_parent = @parent_id, -- Menu anterior
				@new_menuName = 'Estudiante_ESBM',
				@new_role = @new_rol_id, --Rol capacitacion
				@new_id_cobi_product = 100,
				@new_description = 'Estudiante_Erick_Santos_ESBM',
				@new_order = 3
				
				set @url = 'views/MMUNS/SSMMM/T_MMUNSFVHMRFSG_308/1.0.0/VC_ESTUDIANTE_547308_TASK.html'
				exec sp_crearMenu 	@new_url = @url,  @new_id_parent = @parent_id, -- Menu anterior
				@new_menuName = 'Estudiante_BDDL',
				@new_role = @new_rol_id, --Rol capacitacion
				@new_id_cobi_product = 100,
				@new_description = 'Estudiante_Byron_Delgado_BDDL',
				@new_order = 3
				
				set @url = 'views/MMUNS/SSMMM/T_MMUNSNHFJGGEJ_793/1.0.0/VC_ESTUDIANNT_221793_TASK.html'
				exec sp_crearMenu 	@new_url = @url,  @new_id_parent = @parent_id, -- Menu anterior
				@new_menuName = 'Estudiante_JN',
				@new_role = @new_rol_id, --Rol capacitacion
				@new_id_cobi_product = 100,
				@new_description = 'Estudiante_Jefferson_Norona_JN',
				@new_order = 3