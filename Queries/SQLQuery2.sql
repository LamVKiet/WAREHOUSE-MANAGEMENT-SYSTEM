Select NV.tennv from NHAN_VIEN NV where NV.manv not in (Select PX.manv FROM PHIEU_XUAT PX)
