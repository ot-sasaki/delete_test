-- EVOLUTPRO-23の調査変更に対応

BEGIN;

UPDATE 症例入力選択値マスタ SET 調査区分 = 12 WHERE 選択項目値 = '114' AND 選択項目識別子 = '製品・生体弁コード' AND 選択項目名称 = 'EVOLUTPRO-23';

INSERT INTO 症例入力選択値マスタ (選択項目識別子, 選択項目値, 選択項目名称, システム制御用1 , 調査区分)
    VALUES('製品・生体弁コード', '134', 'EVOLUTPRO-23', '4', '13');

COMMIT;