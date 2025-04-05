CREATE TRIGGER tr_tcv ON CONG_VIEC
 AFTER INSERT, UPDATE
 AS DECLARE @tencv NVARCHAR(10);
 SELECT @tencv = tencv FROM INSERTED
 IF EXISTS (SELECT 1 FROM INSERTED
 WHERE tencv NOT IN (N'An ninh', N'Xuất kho', N'Nhập kho', N'Quản lí',  N'Kĩ thuật', N'Dịch vụ')
 BEGIN
	PRINT(N'Tên công việc không hợp lệ');
	ROLLBACK TRANSACTION;
 END