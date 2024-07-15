SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE hoge
--AS以降に処理内容を記述する
AS
--BEGIN,ENDは中かっこ{}に該当する。IFとかWHILEで、TRUE,FALSEの時に実施したい処理をBEGIN,ENDで囲む
BEGIN
    --PRINTデバッグも可能。実行後、メッセージ欄に表示される
    --PRINT N'デバッグ文字列'

    --変数定義
    DECLARE @hensuu INT;
    SET @hensuu = 10;
    --PRINT @hensuu;

    --カーソル
    DECLARE @StudentID int, @LastName VARCHAR(50);
    --カーソルはLOCALを設定しておいた方が良さそう。設定なしだとグローバル扱い？
    --宣言だけしておいて、後でsetすることも可能。その場合は変数名の先頭に@をつける必要あり
    DECLARE cursor_student CURSOR LOCAL FOR SELECT StudentID, LastName FROM Student;
    OPEN cursor_student;
    FETCH NEXT FROM cursor_student INTO @StudentID, @LastName;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT CAST(@StudentID AS VARCHAR(30)) + ':' + @LastName;
        INSERT INTO StudentCopy (StudentID, LastName) VALUES (@StudentID, @LastName);
        FETCH NEXT FROM cursor_student INTO @StudentID, @LastName;
    END;
    CLOSE cursor_student;
    --SQL Serverの場合、CLOSEに加えて、DEALLOCATEが必要。割り当てを解除しないと次回実行時に定義が残ったままになる。
    --カーソルをLOCAL設定にしていない場合？
    DEALLOCATE cursor_student;

    --戻り値設定可能
    RETURN 0;
END;
