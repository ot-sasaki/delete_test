ALTER TABLE tavi症例データ管理 ADD COLUMN 調査対象指定フラグ BOOLEAN NOT NULL DEFAULT(false);
ALTER TABLE 術前情報 ADD COLUMN clinicalFrailtyScale int2;

ALTER TABLE 患者背景 ADD COLUMN 外科的に留置した大動脈生体弁SAVの種類 int2;
ALTER TABLE 患者背景 ADD COLUMN ステント付き生体弁の製品種別 int2;
ALTER TABLE 患者背景 ADD COLUMN ステントレス同種移植ホモグラフトの別 int2;
ALTER TABLE 患者背景 ADD COLUMN ステントレス生体弁の製品種別 int2;

ALTER TABLE 患者背景 ADD COLUMN ステント付き生体弁の製品名その他 TEXT;
ALTER TABLE 患者背景 ADD COLUMN ステントレス生体弁の製品名その他 TEXT;

ALTER TABLE 術中情報 ADD COLUMN 製品_後拡張用バルーンカテーテル_製品名 TEXT;
ALTER TABLE 術中情報 ADD COLUMN 製品_後拡張用バルーンカテーテル_サイズ int2;

ALTER TABLE 施設調査契約マスタ
    ADD 調査7契約有りフラグ BOOLEAN DEFAULT false NOT NULL,
    ADD 調査7登録症例件数 INTEGER;


-- View: 調査4調査対象症例_view
CREATE OR REPLACE VIEW 調査4調査対象症例_view AS
 SELECT rank_summary.tavi症例データ管理レコードid,
    rank_summary.手術日,
    rank_summary.施設診療科マスタレコードid,
    rank_summary.施設調査契約マスタレコードid,
    rank_summary.契約件数,
    rank_summary.rank
   FROM ( SELECT tavi症例データサマリ.tavi症例データ管理レコードid,
            tavi症例データサマリ.手術日,
            施設診療科マスタ.id AS 施設診療科マスタレコードid,
            施設調査契約マスタ.id AS 施設調査契約マスタレコードid,
            施設調査契約マスタ.調査4登録症例件数 AS 契約件数,
            row_number() OVER (PARTITION BY 施設調査契約マスタ.id ORDER BY tavi症例データサマリ.手術日, tavi症例データサマリ.tavi症例データ管理レコードid) AS rank
           FROM tavi症例データサマリ
             JOIN 施設診療科マスタ ON tavi症例データサマリ.ncd施設診療科id = 施設診療科マスタ.ncd施設診療科id
             JOIN 施設調査契約マスタ ON 施設診療科マスタ.施設マスタレコードid = 施設調査契約マスタ.id
             JOIN tavi症例データ管理 ON tavi症例データ管理.id = tavi症例データサマリ.tavi症例データ管理レコードid
          WHERE (tavi症例データサマリ.tavi弁コード = ANY (ARRAY[111, 114, 119]))
          AND 施設診療科マスタ.削除フラグ = false
          AND 施設調査契約マスタ.調査4契約有りフラグ = true
          AND tavi症例データサマリ.手術日 IS NOT NULL
          AND NOT tavi症例データ管理.調査完了日経過フラグ
        ) rank_summary
  WHERE rank_summary.契約件数 IS NULL OR rank_summary.rank <= rank_summary.契約件数;

ALTER TABLE 調査4調査対象症例_view
  OWNER TO tavi_db_user;

-- View: 調査5調査対象症例_view
CREATE OR REPLACE VIEW 調査5調査対象症例_view AS
 SELECT rank_summary.tavi症例データ管理レコードid,
    rank_summary.手術日,
    rank_summary.施設診療科マスタレコードid,
    rank_summary.施設調査契約マスタレコードid,
    rank_summary.契約件数,
    rank_summary.rank
   FROM ( SELECT tavi症例データサマリ.tavi症例データ管理レコードid,
            tavi症例データサマリ.手術日,
            施設診療科マスタ.id AS 施設診療科マスタレコードid,
            施設調査契約マスタ.id AS 施設調査契約マスタレコードid,
            施設調査契約マスタ.調査5登録症例件数 AS 契約件数,
            row_number() OVER (PARTITION BY 施設調査契約マスタ.id ORDER BY tavi症例データサマリ.手術日, tavi症例データサマリ.tavi症例データ管理レコードid) AS rank
           FROM tavi症例データサマリ
             JOIN 施設診療科マスタ ON tavi症例データサマリ.ncd施設診療科id = 施設診療科マスタ.ncd施設診療科id
             JOIN 施設調査契約マスタ ON 施設診療科マスタ.施設マスタレコードid = 施設調査契約マスタ.id
             JOIN tavi症例データ管理 ON tavi症例データ管理.id = tavi症例データサマリ.tavi症例データ管理レコードid
          WHERE (tavi症例データサマリ.tavi弁コード = ANY (ARRAY[122, 123, 125, 126, 129]))
          AND 施設診療科マスタ.削除フラグ = false
          AND 施設調査契約マスタ.調査5契約有りフラグ = true
          AND tavi症例データサマリ.手術日 IS NOT NULL
          AND NOT tavi症例データ管理.調査完了日経過フラグ
        ) rank_summary
  WHERE rank_summary.契約件数 IS NULL OR rank_summary.rank <= rank_summary.契約件数;

ALTER TABLE 調査5調査対象症例_view
  OWNER TO tavi_db_user;


-- View: 調査6調査対象症例_view
CREATE OR REPLACE VIEW 調査6調査対象症例_view AS
 SELECT rank_summary.tavi症例データ管理レコードid,
    rank_summary.手術日,
    rank_summary.施設診療科マスタレコードid,
    rank_summary.施設調査契約マスタレコードid,
    rank_summary.契約件数,
    rank_summary.rank
   FROM ( SELECT tavi症例データサマリ.tavi症例データ管理レコードid,
            tavi症例データサマリ.手術日,
            施設診療科マスタ.id AS 施設診療科マスタレコードid,
            施設調査契約マスタ.id AS 施設調査契約マスタレコードid,
            施設調査契約マスタ.調査6登録症例件数 AS 契約件数,
            row_number() OVER (PARTITION BY 施設調査契約マスタ.id ORDER BY tavi症例データサマリ.手術日, tavi症例データサマリ.tavi症例データ管理レコードid) AS rank
           FROM tavi症例データサマリ
             JOIN 施設診療科マスタ ON tavi症例データサマリ.ncd施設診療科id = 施設診療科マスタ.ncd施設診療科id
             JOIN 施設調査契約マスタ ON 施設診療科マスタ.施設マスタレコードid = 施設調査契約マスタ.id
             JOIN tavi症例データ管理 ON tavi症例データ管理.id = tavi症例データサマリ.tavi症例データ管理レコードid
          WHERE (tavi症例データサマリ.tavi弁コード = ANY (ARRAY[132, 133, 134, 135, 136, 139]))
          AND 施設診療科マスタ.削除フラグ = false
          AND 施設調査契約マスタ.調査6契約有りフラグ = true
          AND tavi症例データサマリ.手術日 IS NOT NULL
          AND NOT tavi症例データ管理.調査完了日経過フラグ
        ) rank_summary
  WHERE rank_summary.契約件数 IS NULL OR rank_summary.rank <= rank_summary.契約件数;

ALTER TABLE 調査6調査対象症例_view
  OWNER TO tavi_db_user;

-- View: 調査7調査対象症例_view
CREATE OR REPLACE VIEW 調査7調査対象症例_view AS
 SELECT rank_summary.tavi症例データ管理レコードid,
    rank_summary.手術日,
    rank_summary.施設診療科マスタレコードid,
    rank_summary.施設調査契約マスタレコードid,
    rank_summary.契約件数,
    rank_summary.rank
   FROM ( SELECT tavi症例データサマリ.tavi症例データ管理レコードid,
            tavi症例データサマリ.手術日,
            施設診療科マスタ.id AS 施設診療科マスタレコードid,
            施設調査契約マスタ.id AS 施設調査契約マスタレコードid,
            施設調査契約マスタ.調査7登録症例件数 AS 契約件数,
            row_number() OVER (PARTITION BY 施設調査契約マスタ.id ORDER BY tavi症例データサマリ.手術日, tavi症例データサマリ.tavi症例データ管理レコードid) AS rank
           FROM tavi症例データサマリ
             JOIN 施設診療科マスタ ON tavi症例データサマリ.ncd施設診療科id = 施設診療科マスタ.ncd施設診療科id
             JOIN 施設調査契約マスタ ON 施設診療科マスタ.施設マスタレコードid = 施設調査契約マスタ.id
             JOIN tavi症例データ管理 ON tavi症例データ管理.id = tavi症例データサマリ.tavi症例データ管理レコードid
          WHERE (tavi症例データサマリ.tavi弁コード = ANY (ARRAY[141, 142, 143, 149]))
          AND 施設診療科マスタ.削除フラグ = false
          AND 施設調査契約マスタ.調査7契約有りフラグ = true
          AND tavi症例データサマリ.手術日 IS NOT NULL
          AND NOT tavi症例データ管理.調査完了日経過フラグ
        ) rank_summary
  WHERE rank_summary.契約件数 IS NULL OR rank_summary.rank <= rank_summary.契約件数;

ALTER TABLE 調査7調査対象症例_view
  OWNER TO tavi_db_user;
