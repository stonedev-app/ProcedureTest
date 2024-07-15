SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE hoge3
AS
BEGIN
    BEGIN TRY
        BEGIN
            BEGIN TRANSACTION;
            INSERT INTO StudentCopy
                (StudentID)
            VALUES
                (1);
            COMMIT TRANSACTION;
            RETURN 0;
        END;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            BEGIN TRY
                ROLLBACK TRANSACTION;
            END TRY
            BEGIN CATCH
                --ロールバックに失敗した場合は何もしない
            END CATCH;
        END;
        RETURN 1;
    END CATCH;
END;