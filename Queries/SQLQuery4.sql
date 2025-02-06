SELECT HH.tenhh, PX.ngayxuat, SUM(solgxuat) as tongslgxuat FROM HANG_HOA HH JOIN CTPHIEU_XUAT CTPX ON HH.mahh = CTPX.mahh
JOIN PHIEU_XUAT PX ON PX.maphieu = CTPX.maphieu
Where PX.ngayxuat between '2024-01-01' and '2024-06-30'
AND HH.tenhh = N'đĩa DVD'
Group by HH.tenhh, PX.ngayxuat