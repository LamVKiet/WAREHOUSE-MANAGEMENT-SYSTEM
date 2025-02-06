DELETE FROM CHITIET_PN
WHERE maphieu IN (
    SELECT pn.maphieu
    FROM PHIEU_NHAP pn
    JOIN NHAN_VIEN nv ON pn.manv = nv.manv
    JOIN CONG_VIEC cv ON nv.macv = cv.macv
    WHERE cv.tencv <> N'Nhập kho'
)
DELETE FROM PHIEU_NHAP
WHERE manv IN (
    SELECT pn.manv
    FROM PHIEU_NHAP pn
    JOIN NHAN_VIEN nv ON pn.manv = nv.manv
    JOIN CONG_VIEC cv ON nv.macv = cv.macv
    WHERE cv.tencv <> N'Nhập kho'