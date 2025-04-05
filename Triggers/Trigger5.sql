--Import receipt restriction
CREATE TRIGGER nv_nhap ON PHIEU_NHAP
AFTER INSERT, UPDATE
AS
DECLARE @manvn CHAR(5);
SELECT @manvn = manv from inserted
IF NOT EXISTS(SELECT * FROM CONG_VIEC CV join NHAN_VIEN NV 
 ON CV.MACV = NV.MACV and CV.TENCV = N'Nhập kho' Join PHIEU_NHAP PN ON NV.manv = PN.manv where nv.manv = @manvn)
BEGIN
	PRINT(N'Phải là nhân viên nhập kho')
	ROLLBACK TRANSACTION
END
--Export receipt restriction
 CREATE TRIGGER nv_xuat ON PHIEU_XUAT
 AFTER INSERT, UPDATE
 AS
 DECLARE @manv CHAR(5);
 SELECT @manv = manv from inserted
 IF NOT EXISTS (SELECT * FROM CONG_VIEC CV join NHAN_VIEN NV
 	ON CV.MACV = NV.MACV and CV.TENCV = N'Xuất kho' Join PHIEU_XUAT PX ON NV.manv = PX.manv where @manv = NV.MANV)
 BEGIN
 	PRINT(N'Phải là nhân viên xuất kho')
 	ROLLBACK TRANSACTION
 END
