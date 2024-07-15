SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE hoge2
AS
BEGIN
    BEGIN TRY
        PRINT 1/0;
    END TRY
    BEGIN CATCH
        --エラーメッセージを表示したい場合は、ERROR_MESSAGE()でエラー内容を取得可能
        --TRY CATCHで囲んでしまうとエラーメッセージが表示されなくなるので、メッセージ欄に表示したい場合は下をコメントアウトする
        --PRINT ERROR_MESSAGE()
        RETURN 1
    END CATCH
    RETURN 0
END