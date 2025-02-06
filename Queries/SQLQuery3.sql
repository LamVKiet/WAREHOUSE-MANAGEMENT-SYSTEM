SELECT p.maphieu, YEAR(p.ngaynhap) AS nam, MONTH(p.ngaynhap) AS thang,  SUM(ct.thanhtien) AS tong_tien
FROM CHITIET_PN ct
JOIN PHIEU_NHAP p ON ct.maphieu = p.maphieu
GROUP BY YEAR(p.ngaynhap), MONTH(p.ngaynhap), p.maphieu
ORDER BY nam, thang;