--Update Tồn kho
CREATE TRIGGER update_tonkho_nhap
ON CHITIET_PN
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE HH
    SET HH.tonkho = HH.tonkho + CTPN.solghhn
    FROM HANG_HOA HH
    JOIN inserted CTPN ON CTPN.mahh = HH.mahh;

    PRINT(N'Đã cập nhật tồn kho của hàng hóa');
END;

--Update Xuất kho
CREATE TRIGGER check_phieu_xuat
ON CTPHIEU_XUAT
AFTER INSERT
AS
BEGIN
    DECLARE @mahh CHAR(10);
    DECLARE @solgxuat INT;
    DECLARE @ngayxuat DATE;
    DECLARE @ngaynhap DATE;
    DECLARE @tonkho INT;

    SELECT 
        @mahh = CTPX.mahh, 
        @solgxuat = CTPX.solgxuat
    FROM inserted CTPX;

    SELECT @ngayxuat = PX.ngayxuat
    FROM PHIEU_XUAT PX
    JOIN inserted CTPX ON CTPX.maphieu = PX.maphieu
    WHERE CTPX.mahh = @mahh;
	--Lấy ra ngày nhập đầu tiên để khúc sau kiểm tra ngày nhập > ngày xuất
    SELECT @ngaynhap = p.ngaynhap
    FROM PHIEU_NHAP p
    JOIN CHITIET_PN ctpn ON ctpn.maphieu = p.maphieu
    WHERE ctpn.mahh = @mahh
    ORDER BY p.ngaynhap
    OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;
	--Check đã từng nhập chưa
    IF @ngaynhap IS NULL
    BEGIN
        PRINT(N'Lỗi: Chưa có phiếu nhập cho hàng hóa này, mã hàng: ' + @mahh);
        ROLLBACK TRANSACTION;
        RETURN;
    END
	--Check ngày xuất phải có trước ngày nhập đầu tiên
    IF @ngayxuat < @ngaynhap
    BEGIN
        PRINT(N'Lỗi: Ngày xuất phải sau ngày nhập. Mã hàng: ' + @mahh + N', Ngày xuất: ' + CONVERT(VARCHAR, @ngayxuat) + N', Ngày nhập: ' + CONVERT(VARCHAR, @ngaynhap));
        ROLLBACK TRANSACTION;
        RETURN;
    END
	-- Check số lượng xuất > tồn kho
    SELECT @tonkho = tonkho
    FROM HANG_HOA
    WHERE mahh = @mahh;

    IF @solgxuat > @tonkho
    BEGIN
        PRINT(N'Lỗi: Số lượng xuất không thể lớn hơn tồn kho. Mã hàng: ' + @mahh + ', Số lượng xuất: ' + CONVERT(VARCHAR, @solgxuat) + ', Tồn kho: ' + CONVERT(VARCHAR, @tonkho));
        ROLLBACK TRANSACTION;
        RETURN;
    END

    UPDATE HH
    SET HH.tonkho = HH.tonkho - CTPX.solgxuat
    FROM HANG_HOA HH
    JOIN inserted CTPX ON CTPX.mahh = HH.mahh;

    PRINT(N'Đã cập nhật tồn kho sau khi xuất hàng');
END;