------------------------------
-- tavi_userで実施します
------------------------------
-- View: "調査1調査対象症例_view"

CREATE OR REPLACE VIEW "調査1調査対象症例_view" AS 
 SELECT rank_summary."tavi症例データ管理レコードid",
    rank_summary."手術日",
    rank_summary."施設診療科マスタレコードid",
    rank_summary."施設調査契約マスタレコードid",
    rank_summary."契約件数",
    rank_summary.rank
   FROM ( SELECT "tavi症例データサマリ"."tavi症例データ管理レコードid",
            "tavi症例データサマリ"."手術日",
            "施設診療科マスタ".id AS "施設診療科マスタレコードid",
            "施設調査契約マスタ".id AS "施設調査契約マスタレコードid",
            "施設調査契約マスタ"."調査1登録症例件数" AS "契約件数",
            row_number() OVER (PARTITION BY "施設調査契約マスタ".id ORDER BY "tavi症例データサマリ"."手術日", "tavi症例データサマリ"."tavi症例データ管理レコードid") AS rank
           FROM "tavi症例データサマリ"
             JOIN "施設診療科マスタ" ON "tavi症例データサマリ"."ncd施設診療科id" = "施設診療科マスタ"."ncd施設診療科id"
             JOIN "施設調査契約マスタ" ON "施設診療科マスタ"."施設マスタレコードid" = "施設調査契約マスタ".id
             JOIN tavi症例データ管理 ON tavi症例データ管理.id = tavi症例データサマリ.tavi症例データ管理レコードid
          WHERE ("tavi症例データサマリ"."tavi弁コード" = ANY (ARRAY[(-1), 1, 2])) AND "施設診療科マスタ"."削除フラグ" = false AND "施設調査契約マスタ"."調査1契約有りフラグ" = true AND "tavi症例データサマリ"."手術日" IS NOT NULL AND NOT tavi症例データ管理.調査完了日経過フラグ) rank_summary
  WHERE rank_summary."契約件数" IS NULL OR rank_summary.rank <= rank_summary."契約件数";

ALTER TABLE "調査1調査対象症例_view"
  OWNER TO tavi_db_user;

-- View: "調査2調査対象症例_view"

CREATE OR REPLACE VIEW "調査2調査対象症例_view" AS 
 SELECT rank_summary."tavi症例データ管理レコードid",
    rank_summary."手術日",
    rank_summary."施設診療科マスタレコードid",
    rank_summary."施設調査契約マスタレコードid",
    rank_summary."契約件数",
    rank_summary.rank
   FROM ( SELECT "tavi症例データサマリ"."tavi症例データ管理レコードid",
            "tavi症例データサマリ"."手術日",
            "施設診療科マスタ".id AS "施設診療科マスタレコードid",
            "施設調査契約マスタ".id AS "施設調査契約マスタレコードid",
            "施設調査契約マスタ"."調査2登録症例件数" AS "契約件数",
            row_number() OVER (PARTITION BY "施設調査契約マスタ".id ORDER BY "tavi症例データサマリ"."手術日", "tavi症例データサマリ"."tavi症例データ管理レコードid") AS rank
           FROM "tavi症例データサマリ"
             JOIN "施設診療科マスタ" ON "tavi症例データサマリ"."ncd施設診療科id" = "施設診療科マスタ"."ncd施設診療科id"
             JOIN "施設調査契約マスタ" ON "施設診療科マスタ"."施設マスタレコードid" = "施設調査契約マスタ".id
             JOIN tavi症例データ管理 ON tavi症例データ管理.id = tavi症例データサマリ.tavi症例データ管理レコードid
          WHERE ("tavi症例データサマリ"."tavi弁コード" = ANY (ARRAY[11, 12])) AND "施設診療科マスタ"."削除フラグ" = false AND "施設調査契約マスタ"."調査2契約有りフラグ" = true AND "tavi症例データサマリ"."手術日" IS NOT NULL AND NOT tavi症例データ管理.調査完了日経過フラグ) rank_summary
  WHERE rank_summary."契約件数" IS NULL OR rank_summary.rank <= rank_summary."契約件数";

ALTER TABLE "調査2調査対象症例_view"
  OWNER TO tavi_db_user;

-- View: "調査3調査対象症例_view"

CREATE OR REPLACE VIEW "調査3調査対象症例_view" AS 
 SELECT rank_summary."tavi症例データ管理レコードid",
    rank_summary."手術日",
    rank_summary."施設診療科マスタレコードid",
    rank_summary."施設調査契約マスタレコードid",
    rank_summary."契約件数",
    rank_summary.rank
   FROM ( SELECT "tavi症例データサマリ"."tavi症例データ管理レコードid",
            "tavi症例データサマリ"."手術日",
            "施設診療科マスタ".id AS "施設診療科マスタレコードid",
            "施設調査契約マスタ".id AS "施設調査契約マスタレコードid",
            "施設調査契約マスタ"."調査3登録症例件数" AS "契約件数",
            row_number() OVER (PARTITION BY "施設調査契約マスタ".id ORDER BY "tavi症例データサマリ"."手術日", "tavi症例データサマリ"."tavi症例データ管理レコードid") AS rank
           FROM "tavi症例データサマリ"
             JOIN "施設診療科マスタ" ON "tavi症例データサマリ"."ncd施設診療科id" = "施設診療科マスタ"."ncd施設診療科id"
             JOIN "施設調査契約マスタ" ON "施設診療科マスタ"."施設マスタレコードid" = "施設調査契約マスタ".id
             JOIN tavi症例データ管理 ON tavi症例データ管理.id = tavi症例データサマリ.tavi症例データ管理レコードid
          WHERE ("tavi症例データサマリ"."tavi弁コード" = ANY (ARRAY[101, 102])) AND "施設診療科マスタ"."削除フラグ" = false AND "施設調査契約マスタ"."調査3契約有りフラグ" = true AND "tavi症例データサマリ"."手術日" IS NOT NULL AND NOT tavi症例データ管理.調査完了日経過フラグ) rank_summary
  WHERE rank_summary."契約件数" IS NULL OR rank_summary.rank <= rank_summary."契約件数";

ALTER TABLE "調査3調査対象症例_view"
  OWNER TO tavi_db_user;


-- 調査4調査対象症例_view追加
CREATE OR REPLACE VIEW 調査4調査対象症例_view AS SELECT
    rank_summary.tavi症例データ管理レコードid,
    rank_summary.手術日,
    rank_summary.施設診療科マスタレコードid,
    rank_summary.施設調査契約マスタレコードid,
    rank_summary.契約件数,
    rank_summary.rank
    FROM (
        SELECT
            tavi症例データサマリ.tavi症例データ管理レコードid,
            tavi症例データサマリ.手術日,
            施設診療科マスタ.id                     AS 施設診療科マスタレコードid,
            施設調査契約マスタ.id                   AS 施設調査契約マスタレコードid,
            施設調査契約マスタ.調査4登録症例件数    AS 契約件数,
            row_number() OVER (
                PARTITION BY 施設調査契約マスタ.id ORDER BY tavi症例データサマリ.手術日, tavi症例データサマリ.tavi症例データ管理レコードid) AS rank
        FROM tavi症例データサマリ
            JOIN 施設診療科マスタ
                ON tavi症例データサマリ.ncd施設診療科id = 施設診療科マスタ.ncd施設診療科id
            JOIN 施設調査契約マスタ
                ON 施設診療科マスタ.施設マスタレコードid = 施設調査契約マスタ.id
            JOIN tavi症例データ管理 ON tavi症例データ管理.id = tavi症例データサマリ.tavi症例データ管理レコードid
        WHERE (tavi症例データサマリ.tavi弁コード = ANY (ARRAY[111, 112, 113]))
            AND 施設診療科マスタ.削除フラグ = false
            AND 施設調査契約マスタ.調査4契約有りフラグ = true AND tavi症例データサマリ.手術日 IS NOT NULL
            AND NOT tavi症例データ管理.調査完了日経過フラグ) rank_summary
    WHERE rank_summary.契約件数 IS NULL OR rank_summary.rank <= rank_summary.契約件数;
ALTER TABLE 調査4調査対象症例_view OWNER TO tavi_db_user;

