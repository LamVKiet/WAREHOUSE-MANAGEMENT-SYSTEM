DELETE FROM CTPHIEU_XUAT
WHERE maphieu IN (
    SELECT px.maphieu
    FROM PHIEU_XUAT px
    JOIN NHAN_VIEN nv ON px.manv = nv.manv
    JOIN CONG_VIEC cv ON nv.macv = cv.macv
    WHERE cv.tencv <> N'Xuất kho'
)
DELETE FROM PHIEU_XUAT
WHERE manv IN (
    SELECT px.manv
    FROM PHIEU_XUAT px
    JOIN NHAN_VIEN nv ON px.manv = nv.manv
    JOIN CONG_VIEC cv ON nv.macv = cv.macv
    WHERE cv.tencv <> N'Xuất kho'
)