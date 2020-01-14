USE [sqlmes]
GO
/****** Object:  StoredProcedure [dbo].[ssis_demo]    Script Date: 11.12.2019 15:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- agk_udv.u_postavki_sql
ALTER PROCEDURE [dbo].[ssis_demo] @sourcetablesql nvarchar(50)
AS
BEGIN

	delete mes from agk_mes.U_POSTAVKI mes
	where systemcode like '%' + @sourcetablesql + '%';

	Declare @execution_id bigint  
	EXEC [SSISDB].[catalog].[create_execution] 
	@package_name=N'sqlora2sql.dtsx',
	@execution_id=@execution_id OUTPUT, 
	@folder_name=N'Rusalka', 
	@project_name=N'Rusalka', 
	@use32bitruntime=False, 
	@reference_id=Null
	
    EXEC [SSISDB].[catalog].[set_execution_parameter_value]
    @Execution_id, 
    @object_type=50,
    @parameter_name=N'SYNCHRONIZED',
    @parameter_value=1; -- true

    EXEC [SSISDB].[catalog].[set_execution_parameter_value]
    @Execution_id, 
    @object_type=20,
    @parameter_name=N'sourcetablesql',
    @parameter_value=@sourcetablesql;

	EXEC [SSISDB].[catalog].[start_execution] @execution_id;

	--delete mes from agk_mes.U_POSTAVKI mes
	--where not exists (select id from agk_udv.U_POSTAVKI udv where udv.id = ltrim(rtrim(mes.id)));
END
