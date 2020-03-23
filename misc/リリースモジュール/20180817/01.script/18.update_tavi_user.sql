-- 調査対象指定フラグへのデータ設定
BEGIN;

UPDATE tavi症例データ管理
SET 調査対象指定フラグ  = true
WHERE 調査対象フラグ = true

COMMIT;
