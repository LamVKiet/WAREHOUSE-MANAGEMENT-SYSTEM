SELECT NV.tennv, PN.ngaynhap FROM NHAN_VIEN NV JOIN PHIEU_NHAP PN ON NV.manv = PN.manv 
where PN.ngaynhap between '2024-07-01' and '2024-07-31'