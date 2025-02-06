CREATE TRIGGER mucluongql1
ON CONG_VIEC
AFTER UPDATE, INSERT
AS
DECLARE @luongtheogio INT, @macv CHAR(4);
SELECT @luongtheogio = luongtheogio, @macv = macv FROM inserted;
IF @macv =  'CV06'
BEGIN
    IF EXISTS(SELECT 1 FROM CONG_VIEC where macv <> @macv and  luongtheogio >= @luongtheogio)
    BEGIN
        PRINT(N'Lương của quản lý phải cao hơn lương nhân viên khác!');
        ROLLBACK TRANSACTION; 
    END
END