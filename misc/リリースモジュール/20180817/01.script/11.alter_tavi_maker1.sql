ALTER FOREIGN TABLE 調査1術前情報 ADD COLUMN clinicalFrailtyScale int2;
ALTER FOREIGN TABLE 調査2術前情報 ADD COLUMN clinicalFrailtyScale int2;

ALTER FOREIGN TABLE 調査1患者背景 ADD COLUMN 外科的に留置した大動脈生体弁SAVの種類 int2;
ALTER FOREIGN TABLE 調査1患者背景 ADD COLUMN ステント付き生体弁の製品種別 int2;
ALTER FOREIGN TABLE 調査1患者背景 ADD COLUMN ステントレス同種移植ホモグラフトの別 int2;
ALTER FOREIGN TABLE 調査1患者背景 ADD COLUMN ステントレス生体弁の製品種別 int2;
ALTER FOREIGN TABLE 調査1患者背景 ADD COLUMN ステント付き生体弁の製品名その他 TEXT;
ALTER FOREIGN TABLE 調査1患者背景 ADD COLUMN ステントレス生体弁の製品名その他 TEXT;

ALTER FOREIGN TABLE 調査2患者背景 ADD COLUMN 外科的に留置した大動脈生体弁SAVの種類 int2;
ALTER FOREIGN TABLE 調査2患者背景 ADD COLUMN ステント付き生体弁の製品種別 int2;
ALTER FOREIGN TABLE 調査2患者背景 ADD COLUMN ステントレス同種移植ホモグラフトの別 int2;
ALTER FOREIGN TABLE 調査2患者背景 ADD COLUMN ステントレス生体弁の製品種別 int2;
ALTER FOREIGN TABLE 調査2患者背景 ADD COLUMN ステント付き生体弁の製品名その他 TEXT;
ALTER FOREIGN TABLE 調査2患者背景 ADD COLUMN ステントレス生体弁の製品名その他 TEXT;

ALTER FOREIGN TABLE 調査1術中情報 ADD COLUMN 製品_後拡張用バルーンカテーテル_製品名 TEXT;
ALTER FOREIGN TABLE 調査1術中情報 ADD COLUMN 製品_後拡張用バルーンカテーテル_サイズ int2;
ALTER FOREIGN TABLE 調査2術中情報 ADD COLUMN 製品_後拡張用バルーンカテーテル_製品名 TEXT;
ALTER FOREIGN TABLE 調査2術中情報 ADD COLUMN 製品_後拡張用バルーンカテーテル_サイズ int2;

ALTER FOREIGN TABLE 施設調査契約マスタ
    ADD 調査7契約有りフラグ BOOLEAN DEFAULT false NOT NULL,
    ADD 調査7登録症例件数 INTEGER;

ALTER FOREIGN TABLE 調査1tavi症例データ管理 ADD COLUMN 調査対象指定フラグ BOOLEAN NOT NULL DEFAULT(false);
ALTER FOREIGN TABLE 調査2tavi症例データ管理 ADD COLUMN 調査対象指定フラグ BOOLEAN NOT NULL DEFAULT(false);
