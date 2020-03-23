
BEGIN;

UPDATE 症例入力選択値マスタ
   SET 選択項目名称 = '外科的に留置した大動脈生体弁（SAV）の弁輪内'
 WHERE 選択項目名称 = '自己の弁輪内'
   AND 調査区分 = '14'

COMMIT;
