EXEC MSDB.DBO.SP_SEND_DBMAIL     
    @PROFILE_NAME = 'Automat',     
    @RECIPIENTS = @REC,
    @blind_copy_recipients = 'ControllingProgramisci-DL@selgros.pl',
    @SUBJECT = @SUB,  
    @BODY = @bdy,  
    @importance = 'Normal',  
    @BODY_FORMAT = 'HTML';

/*
@PROFILE_NAME = 'Automat' – nazwa profilu poczty skonfigurowanego w SQL Server. Musi być wcześniej utworzony i poprawnie skonfigurowany w Database Mail Configuration.
@RECIPIENTS = @REC – adres e-mail odbiorcy (lub odbiorców). Może zawierać wiele adresów oddzielonych średnikiem, np. 'user1@example.com; user2@example.com'.
@blind_copy_recipients = 'ControllingProgramisci-DL@selgros.pl' – UKRYTA KOPIA (BCC) – odbiorcy, którzy otrzymają e-mail bez widoczności na liście adresatów.
@SUBJECT = @SUB – temat wiadomości.
@BODY = @bdy – treść wiadomości. Może zawierać HTML, jeśli @BODY_FORMAT = 'HTML'.
@importance = 'Normal' – priorytet wiadomości (opcje: Low, Normal, High).
@BODY_FORMAT = 'HTML' – format treści e-maila (TEXT lub HTML).
*/


--Database Mail musi być włączony:

EXEC SP_CONFIGURE 'show advanced options', 1;
RECONFIGURE;
EXEC SP_CONFIGURE 'Database Mail XPs', 1;
RECONFIGURE;

/*
Profil poczty (Automat) musi być skonfigurowany w SQL Server Management Studio:
Przejdź do Management → Database Mail.
Skonfiguruj Account z poprawnym serwerem SMTP, adresami nadawcy i uwierzytelnieniem.
Utwórz Profil poczty i przypisz mu konto.
Upewnij się, że użytkownik uruchamiający sp_send_dbmail ma do niego dostęp.
*/
-- Wyświetlanie informacji o wysyłce
SELECT * FROM MSDB.DBO.SYSMAIL_ALLITEMS;
SELECT * FROM MSDB.DBO.SYSMAIL_EVENT_LOG;