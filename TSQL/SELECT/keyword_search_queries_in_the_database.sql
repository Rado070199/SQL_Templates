--------------------------------------------------------------
---------------------Search in jobs---------------------------
--------------------------------------------------------------

SELECT j.name 
  FROM msdb.dbo.sysjobs AS j
  WHERE EXISTS 
  (
    SELECT 1 FROM msdb.dbo.sysjobsteps AS s
      WHERE s.job_id = j.job_id
      AND s.command LIKE '%db_WysylkaDziennegoLogu%'
  );

------------------------------------------------------------------
----Searching for table names and other keywords in procedures----
------------------------------------------------------------------

SELECT name, count(*) as Liczba_wystapien FROM sys.syscomments SC
JOIN sys.objects SO ON SC.id=SO.[object_id]
WHERE [text] LIKE '%tmp_TG_SAP_Fakturabuch%' --AND [type]='P' 
group by name order by 2

-----------------------------------------------------------------------
--------------------Procedure statistics-------------------------------
-----------------------------------------------------------------------


SELECT TOP 10 d.object_id, d.database_id, OBJECT_NAME(object_id, database_id) 'proc name',   
    d.cached_time, d.last_execution_time, 
    (d.total_elapsed_time/d.execution_count)/1000000 AS [avg_elapsed_time SEK], d.execution_count  
FROM sys.dm_exec_procedure_stats AS d  
where OBJECT_NAME(object_id, database_id) like '%KZ_PAY_ON_SCAN_STATUS%'
ORDER BY d.execution_count DESC;  

select top 10 * from sys.dm_exec_functions_stats

SELECT qs.execution_count,  
    SUBSTRING(qt.text,qs.statement_start_offset/2 +1,   
                 (CASE WHEN qs.statement_end_offset = -1   
                       THEN LEN(CONVERT(nvarchar(max), qt.text)) * 2   
                       ELSE qs.statement_end_offset end -  
                            qs.statement_start_offset  
                 )/2  
             ) AS query_text,   
     qt.dbid, dbname= DB_NAME (qt.dbid), qt.objectid,   
     qs.total_rows, qs.last_rows, qs.min_rows, qs.max_rows  
FROM sys.dm_exec_query_stats AS qs   
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS qt   
WHERE qt.text like '%KZ_PAY_ON_SCAN_STATUS%'   
ORDER BY qs.execution_count DESC;  

---------------------------------------------------------------------------
--------------------------Column search------------------------------------
---------------------------------------------------------------------------

SELECT distinct QUOTENAME(OBJECT_SCHEMA_NAME([object_id])) + '.' + QUOTENAME(OBJECT_NAME([object_id]))
FROM sys.all_columns
WHERE name like  '%GV1%'


select top 1000 * from sysmail_sentitems
--where subject like '%ostatni%'
--recipients like '%Br410-DL@gmail.com%'
where mailitem_id=220496
order by send_request_date desc

--	mail@gmail.com
--	exec dbo.sp_aplication_ImportAndEmails 'mail_automaty'

--------------------------------------------------------------------------------------------
--------------------------------------Table contents----------------------------------------
--------------------------------------------------------------------------------------------

SELECT DISTINCT 
	Y.NAME AS TABELA, 
	ISNULL(Q.WIERSZE,0) AS WIERSZE
FROM SYS.INDEXES X 
	JOIN SYS.OBJECTS Y ON X.OBJECT_ID = Y.OBJECT_ID
	JOIN SYS.DATA_SPACES Z ON X.DATA_SPACE_ID = Z.DATA_SPACE_ID
	LEFT JOIN 
		(SELECT X.ID, Y.NAME, X.ROWCNT AS WIERSZE 
		 FROM SYS.SYSINDEXES X JOIN SYS.OBJECTS Y ON X.ID = Y.OBJECT_ID
		 WHERE Y.TYPE = 'U' AND X.ROWCNT <> 0) Q ON X.OBJECT_ID = Q.ID
WHERE Y.TYPE = 'U' AND Y.NAME LIKE '%wysylkagazetki%'
ORDER BY 2 DESC

---------------------------------------------------------------------------------------------
-------------------------------------Search in Synonims--------------------------------------
---------------------------------------------------------------------------------------------

SELECT 
    name AS NazwaSynonimu,
    base_object_name AS PrawdziwaNazwaObiektu
FROM sys.synonyms
WHERE name = 'TBL_DWH_OBROTY_BR';
