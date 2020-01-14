drop table [stg].stage_files;
GO

create table [stg].stage_files (RecID int not null identity (1,1)
							, load_date datetime default getdate ()	
							, [filename]    nvarchar (100)
							, [systemcode]  nvarchar (50)
							, [filetype]    nvarchar (20)
							, [filedata]	varbinary (max)
								);

drop table [stg].rusal_logs;
GO

create table stg.rusal_logs (RecID int not null identity (1,1)
							, load_date datetime default getdate ()	
							, packagename nvarchar (100)
							, taskname nvarchar (100)
							, [rowcount] int
							);