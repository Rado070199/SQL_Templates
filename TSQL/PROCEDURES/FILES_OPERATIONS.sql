--------------------------------------------------------------------
----- [W��czanie xp_cmdshell (je�li jeszcze nie jest w��czone)]-----
--------------------------------------------------------------------
EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
EXEC sp_configure 'xp_cmdshell', 1;
RECONFIGURE;

------------------------------------------
----- [Sprawdzanie czy plik istnieje jesli istnieje zmieniamy nazw�]-----
------------------------------------------

DECLARE @FileExists INT;
DECLARE @FilePath NVARCHAR(255) = 'G:\WymianaDanych\SAP_WymianaDanych\SAP_Promocje\SAP_Promocje.xlsx';

EXEC xp_fileexist @FilePath, @FileExists OUTPUT;

IF @FileExists = 1
BEGIN
    PRINT 'Plik istnieje, mo�na kontynuowa� import!';
	EXEC xp_cmdshell 'ren "G:\WymianaDanych\SAP_WymianaDanych\SAP_Promocje\SAP_Promocje_old.xlsx" "SAP_Promocje.xlsx"';
    -- Tutaj umie�� kod do importu danych
END
ELSE
BEGIN
    PRINT 'Plik NIE istnieje, ko�czenie procedury!';
    -- Mo�na doda� logowanie b��du lub wys�anie e-maila
END
