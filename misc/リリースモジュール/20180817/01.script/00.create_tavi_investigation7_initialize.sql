
-- ------------------------------------------------------------------------------------------
-- データベース[tavi_investigation7](Medtronicサーバー)へ変更
-- ------------------------------------------------------------------------------------------

-- データを削除
TRUNCATE TABLE
    tavi症例承認時データ,
    tavi症例承認時データ差分,
    フォローアップ中有害事象,
    フォローアップ術後1年,
    フォローアップ術後2年,
    フォローアップ術後30日,
    フォローアップ術後3年,
    フォローアップ術後4年,
    フォローアップ術後5年,
    フォローアップ術後6ヶ月,
    フォローアップ退院_術後7日,
    患者背景,
    術中デバイス不具合,
    術中有害事象,
    術中情報,
    術前情報,
    術後情報,
    tavi症例データ管理
RESTART IDENTITY;


