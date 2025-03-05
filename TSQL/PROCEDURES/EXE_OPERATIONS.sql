-- Uruchamianie pliku .exe

DECLARE @CMD VARCHAR(1000)

SET @CMD = 'G:/WymianaDanych/SAP_WymianaDanych/SAP_Promocje/nowe_promocje_scalanie/ExcelMerger.exe'
EXEC MASTER..XP_CMDSHELL @CMD