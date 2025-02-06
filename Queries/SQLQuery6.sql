SELECT PX.maphieu, KH.tenkh, PX.ngayxuat from KHACH_HANG KH join PHIEU_XUAT PX ON KH.makh = PX.makh 
where ngayxuat between '2024-03-01' and '2024-03-31'