CREATE TRIGGER mucluongql
ON CONG_VIEC
AFTER UPDATE, INSERT
AS
DECLARE @luongtheogio INT, @luongquanly INT, @tencv CHAR(4);
SELECT @luongtheogio = luongtheogio, @tencv = tencv FROM inserted;
IF @tencv <> N'Quản lý'
BEGIN
    SELECT @luongquanly = luongtheogio
    FROM CONG_VIEC
    WHERE tencv = N'Quản lý';
    IF @luongtheogio >= @luongquanly
    BEGIN
        PRINT(N'Lương theo giờ của công việc này phải nhỏ hơn lương của Quản lý!');
        ROLLBACK TRANSACTION; 
    END
END