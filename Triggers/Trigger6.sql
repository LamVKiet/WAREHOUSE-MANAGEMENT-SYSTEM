CREATE TRIGGER nv_xuat ON PHIEU_XUAT
AFTER INSERT, UPDATE
AS
DECLARE @manvx CHAR(5);
SELECT @manvx = manv from inserted
IF NOT EXISTS(SELECT * FROM CONG_VIEC CV join NHAN_VIEN NV 
 ON CV.MACV = NV.MACV and CV.TENCV = N'Xuất kho' Join PHIEU_XUAT PX ON NV.manv = PX.manv where @manvx = NV.MANV)
BEGIN
	PRINT(N'Phải là nhân viên xuất kho')
	ROLLBACK TRANSACTION
END