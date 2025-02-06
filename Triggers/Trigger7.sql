CREATE TRIGGER thuongOT on NHAN_VIEN
AFTER UPDATE, INSERT
AS DECLARE
 @sogiolam INT,
 @macv Char(4),
 @manv Char(5),
 @sogioOT INT,
 @luongtheogio INT;
SELECT @sogiolam = sogiolam,
		@macv = macv,
		@manv = manv
		from inserted;
SELECT @luongtheogio = luongtheogio
        FROM CONG_VIEC
        WHERE macv = @macv;
IF @macv <> 'CV06' AND @macv <> 'CV01'
BEGIN
	IF @sogiolam > 208
	BEGIN 
		SET @sogioOT = @sogiolam - 208;
		UPDATE NHAN_VIEN
				SET thuong = @luongtheogio * 1.5 * @sogioOT  
				WHERE manv = @manv and macv = @macv;
		PRINT(N'Thưởng đã được cập nhật')
	END
END
ELSE IF @macv = 'CV06'
BEGIN
	IF @sogiolam > 260
	BEGIN
		SET @sogioOT = @sogiolam - 260;
		UPDATE NHAN_VIEN
			SET thuong = @luongtheogio * 1.5 * @sogioOT  
			WHERE manv = @manv and macv = @macv ;
		PRINT(N'Thưởng đã được cập nhật')
	END
END