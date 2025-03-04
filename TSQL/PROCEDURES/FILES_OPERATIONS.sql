--------------------------------------------------------------------
----- [W³¹czanie xp_cmdshell (jeœli jeszcze nie jest w³¹czone)]-----
--------------------------------------------------------------------
EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
EXEC sp_configure 'xp_cmdshell', 1;
RECONFIGURE;

------------------------------------------
----- [Sprawdzanie czy plik istnieje jesli istnieje zmieniamy nazwê]-----
------------------------------------------

DECLARE @FileExists INT;
DECLARE @FilePath NVARCHAR(255) = 'G:\WymianaDanych\SAP_WymianaDanych\SAP_Promocje\SAP_Promocje.xlsx';

EXEC xp_fileexist @FilePath, @FileExists OUTPUT;

IF @FileExists = 1
BEGIN
    PRINT 'Plik istnieje, mo¿na kontynuowaæ import!';
	EXEC xp_cmdshell 'ren "G:\WymianaDanych\SAP_WymianaDanych\SAP_Promocje\SAP_Promocje_old.xlsx" "SAP_Promocje.xlsx"';
    -- Tutaj umieœæ kod do importu danych
END
ELSE
BEGIN
    PRINT 'Plik NIE istnieje, koñczenie procedury!';
    -- Mo¿na dodaæ logowanie b³êdu lub wys³anie e-maila
END
