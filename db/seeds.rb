groups = [
  "group one", 
  "group two", 
  "group three", 
  "group four"
]

groups.each do |name| 
  Group.create(name: name)
end


users = [
  ["testform@gmail.com", 1, "testform", true, true], 
  ["testform2@gmail.com", 2, "testform2", false, true], 
  ["testform3@gmail.com", 3, "testform3", false, false],
  ["admin@gmail.com", 1, "adminpass", true, false], 
]

users.each do |email, group_id, password, admin, business| 
  User.create(email: email, group_id: group_id, password: password, 
  admin: admin, business: business)
end

User.find(4).update(group_id: 1)


profiles = [
  [1,"testform", "testy", 1, ""], 
  [2,"testform2", "testy2", 2, "Yamanashi-ken"], 
  [3,"testform3", "testy3", 3, "Tokyo-to"],
  [4,"admin", "admy", "admin", "", ""] 
]

profiles.each do |user_id,name,nickname,roommate_number,prefecture| 
  Profile.create(user_id: user_id,name: name,nickname: nickname,
    roommate_number: roommate_number,prefecture: prefecture)
end


# items = [
#   ["Senzai", 100],
#   ["Haburashi", 200],
#   ["Shampoo", 300],
#   ["Egg", 7],
#   ["Milk", 8],
#   ["Beef", 4],
#   ["Pork", 3],
# ]

items = [
  # 食料品　 id:1〜40
  ["にんじん" ,14],
  ["玉ねぎ" , 60],
  ["キャベツ" , 20],
  ["りんご" , 30],
  ["バナナ" , 7],
  ["オレンジ" , 10],
  ["牛肉" , 5],
  ["豚肉" , 3],
  ["鶏肉" , 3],
  ["さば" , 2],
  ["えび" , 3],
  ["あさり" , 2],
  ["サラダチキン" , 14],
  ["ウインナー" , 20],
  ["さばの味噌煮" , 10],
  ["コシヒカリ" , 60],
  ["パスタ" , 900],
  ["そば" , 7],
  ["雑穀米" , 360],
  ["食パン" , 5],
  ["クロワッサン" , 3],
  ["生卵" , 7],
  ["さけるチーズ" , 100],
  ["カマンベールチーズ" , 180],
  ["牛乳" , 5],
  ["ポテトチップス" , 180],
  ["いちご大福" , 2],
  ["ケーキ" , 2],
  ["ビール" , 240],
  ["オレンジジュース" , 120],
  ["コーラ" , 200],
  ["伊右衛門" , 200],
  ["富士山 蒼天の水" , 360],
  ["醤油" , 360],
  ["味噌" , 360],
  ["生クリーム" , 7],
  ["納豆" , 10],
  ["豆腐" , 10],
  ["さつま揚げ" , 20],
  ["チルドピザ" , 10],
  # 日用品　 1d:41〜100
  ["NANAX" , 60],
  ["ホミング" , 30],
  ["ワイルドハイター" , 40],
  ["洗濯ののり" , 60],
  ["キュキュキュット" , 60],
  ["食洗機用洗剤" , 150],
  ["オレ 泡ハンドソープ" , 60],
  ["ファフリーズ" , 60],
  ["サフランラップ" , 180],
  ["お料理シート" , 360],
  ["アルミのホイル" , 200],
  ["ゴミ袋 50L" , 150],
  ["アインラップ" , 60],
  ["水切りごみ袋" , 150],
  ["キッチンペーパー" , 90],
  ["紙コップ" , 60],
  ["金たわし" , 100],
  ["スポンジ" , 120],
  ["使い捨て手袋" , 200],
  ["トイレットペーパー" , 30],
  ["ゴム手袋" , 270],
  ["スクラビビンバブル 流せるトイレブラシ" , 70],
  ["スタンプー" , 70],
  ["洗浄力トイレのクリーナー" , 50],
  ["トイレ用ファフリーズ" , 90],
  ["ディープロモイスト ヘアトリートメント" , 80],
  ["ディープロモイスト シャンプー" , 60],
  ["バスマジックリンリン" , 60],
  ["ロック防カビ煙剤" , 60],
  ["バブルン" , 20],
  ["デンターシステム" , 60],
  ["デンタルフロスン" , 50],
  ["シュミテクトン" , 60],
  ["ブレスケア 強ミント" , 30],
  ["Nanaoマウスウォッシュ" , 60],
  ["ムースーウォッシュ" , 45],
  ["お肌撫子 引き締め化粧水" , 60],
  ["バルクオムニ" , 60],
  ["メイク落としシート" , 50],
  ["パーフェクトUVスキンケア" , 60],
  ["グッスミン 酵母の力" , 31],
  ["マルチビタミンさらにミネラル" , 100],
  ["綿棒" , 360],
  ["超絶快適普通サイズ" , 50],
  ["ジレッポ 5枚刃 髭剃り" , 180],
  ["ピィニィ 眉毛剃り" , 180],
  ["ドギレイ 除菌シート" , 60],
  ["ナイガード" , 40],
  ["バンドエイド" , 180],
  ["マネキロン" , 360],
  ["スコティッシュ" , 1500],
  ["エボタン 単三電池" , 360],
  ["LED電球" , 1500],
  ["雑巾" , 120],
  ["ウェーブン" , 60],
  ["激落ち様" , 120],
  ["ビニール紐" , 360],
  ["輪ゴム" , 720],
  ["軍手" , 360],
  ["ガムテープ" , 360]
]

items.each do |name, criteria| 
  Item.create(name: name, criteria: criteria)
end


makers = [
  "LINO",
  "花玉",
  "カネヨ",
  "ピクス",
  "ファフリーズ",
  "旭火星",
  "Kusaru",
  "ケミカル日本",
  "イワタノマテリアル",
  "有印粗悪品",
  "スコティッシュ",
  "日本デキシール",
  "オーエーン",
  "川西中本工業",
  "エリエーリ",
  "ジョージ",
  "エステースー",
  "P&R&G",
  "アンドハニートースト",
  "REACHER",
  "ggrks",
  "中森製薬",
  "SOFIN",
  "石川研究所",
  "バルクオムニ",
  "ソフティモン",
  "バネッサ",
  "小坂製薬",
  "CARELAGER",
  "マルチチャーム",
  "ジレッポ",
  "FATHER",
  "ロース製薬",
  "ジョージ・エンド・ジョージ",
  "第一二三共ケア",
  "エボタン",
  "アイリッシュコヤマ",
  "REC",
  "セキセキ",
  "ノーハンド",
  "モノクロウ",
  "ニトロズ"
]

makers.each do |name| 
  Maker.create(name: name)
end


# category_groceries = [
#   "meet", "fish", "bevarage", "vegetable"
# ]

category_groceries = [
  "野菜・果物", "肉・魚", "主食", "乳製品・卵","お菓子・スナック","飲料","調味料","その他"
]

category_groceries.each do |name| 
  CategoryGrocery.create(name: name)
end



# category_ptoducts = [
#   "kitchen", "bathroom", "rooms", "outdoor"
# ]

category_ptoducts = [
  "衣服・食器洗濯",
  "キッチン用品",
  "トイレ用品",
  "お風呂用品",
  "オーラルケア・スキンケア",
  "ヘルスケア",
  "家庭用品",
]

category_ptoducts.each do |name| 
  CategoryProduct.create(name: name)
end


# sub_category_products = [
#   ["senzai",1], 
#   ["suponzi",1], 
#   ["Shampoo",2],
#   ["Fragrance",3] 
# ]

sub_category_products = [
  ["洗濯洗剤", 1],
  ["柔軟剤", 1],
  ["漂白剤", 1],
  ["その他", 1],
  ["食器用洗剤", 1],
  ["食器洗い機用洗剤", 1],
  ["ハンドソープ", 1],
  ["消臭剤", 1],
  ["ラップ・アルミホイル", 2],
  ["ゴミ袋・ポリ袋", 2],
  ["キッチン清掃品", 2],
  ["トイレットペーパー", 3],
  ["トイレ清掃品", 3],
  ["ヘアケア・ボディケア", 4],
  ["お風呂清掃品", 4],
  ["入浴剤", 4],
  ["歯ブラシ", 5],
  ["フロス", 5],
  ["歯磨き粉", 5],
  ["ブレスケア", 5],
  ["口内洗浄液", 5],
  ["フェイスウォッシュ", 5],
  ["化粧水", 5],
  ["洗顔料", 5],
  ["メイク落とし", 5],
  ["日焼け止め", 5],
  ["サプリメント", 6],
  ["綿棒", 6],
  ["マスク", 6],
  ["シェーバー", 6],
  ["除菌シート", 6],
  ["目薬", 6],
  ["絆創膏", 6],
  ["消毒液", 6],
  ["ティッシュペーパー", 7],
  ["電池・電球", 7],
  ["掃除用品", 7],
  ["その他", 7],
]



sub_category_products.each do |name, category_product_id| 
  SubCategoryProduct.create(name: name, category_product_id: category_product_id)
end

sub_category_groceries = [
  ["野菜",1],
  ["果物",1],
  ["肉類",2],
  ["魚貝類",2],
  ["加工肉",2],
  ["加工魚",2],
  ["米類",3],
  ["麺類",3],
  ["雑穀",3],
  ["パン",3],
  ["卵",4],
  ["チーズ",4],
  ["牛乳",4],
  ["スナック",5],
  ["和菓子",5],
  ["洋菓子",5],
  ["アルコール",6],
  ["ソフトドリンク",6],
  ["水・お茶",6],
  ["調味料",7],
  ["調理材料",7],
  ["納豆",8],
  ["豆腐",8],
  ["生鮮食品",8],
]

sub_category_groceries.each do |name, category_grocery_id| 
  SubCategoryGrocery.create(name: name, category_grocery_id: category_grocery_id)
end


# groceries = [
#   [4, 1, 1], 
#   [5, 2, 2], 
#   [6, 3, 2],
#   [7, 1, 1] 
# ]

groceries = [
  [1, 1, 1],
  [2, 1, 1],
  [3, 1 , 1],
  [4, 2, 1],
  [5, 2, 1],
  [6, 2, 2],
  [7, 3, 2],
  [8, 3, 2],
  [9, 3, 2],
  [10, 4, 2],
  [11, 4, 2],
  [12, 4, 2],
  [13, 5, 2],
  [14, 5, 2],
  [15, 6, 2],
  [16, 7, 3],
  [17, 8, 3],
  [18, 8, 3],
  [19, 9, 3],
  [20, 10, 3],
  [21, 10, 3],
  [22, 11, 4],
  [23, 12, 4],
  [24, 12, 4],
  [25, 13, 4],
  [26, 14, 5],
  [27, 15, 5],
  [28, 16, 5],
  [29, 17, 6],
  [30, 18, 6],
  [31, 18, 6],
  [32, 19, 6],
  [33, 19, 6],
  [34, 20, 7],
  [35, 20, 7],
  [36, 21, 7],
  [37, 22, 8],
  [38, 23, 8],
  [39, 24, 8],
  [40, 24, 8]
]

groceries.each do |item_id, sub_category_grocery_id, category_grocery_id| 
  Grocery.create(item_id: item_id, sub_category_grocery_id: sub_category_grocery_id, category_grocery_id: category_grocery_id)
end


# products = [
#   [1, 1, 1, 1,"picture_1"], 
#   [2, 2, 2, 2,"picture_2"], 
#   [3, 3, 2, 3,"picture_3"],
#   [1, 1, 1, 1,"picture_1"] 
# ]

products = [
  [41, 1, 1, 1, "NANAX.png"],
  [42, 2, 1, 2, "ホミング.png"],
  [43, 3, 1, 2, "ワイルドハイター.png"],
  [44, 4, 1, 3, "洗濯ののり.png"],
  [45, 5, 1, 2, "キュキュキュット.png"],
  [46, 6, 1, 4, "食洗機用洗剤.png"],
  [47, 7, 1, 2, "オレ 泡ハンドソープ.png"],
  [48, 8, 1, 5, "ファフリーズ.png"],
  [49, 9, 2, 6, "サフランラップ.png"],
  [50, 9, 2, 6, "お料理シート.png"],
  [51, 9, 2, 7, "アルミのホイル.png"],
  [52, 10, 2, 8, "ゴミ袋 50L.png"],
  [53, 10, 2, 9, "アインラップ.png"],
  [54, 11, 2, 10, "水切りごみ袋.png"],
  [55, 11, 2, 11, "キッチンペーパー.png"],
  [56, 11, 2, 12, "紙コップ.png"],
  [57, 11, 2, 13, "金たわし.png"],
  [58, 11, 2, 13, "スポンジ.png"],
  [59, 11, 2, 14, "使い捨て手袋.png"],
  [60, 12, 3, 15, "トイレットペーパー.png"],
  [61, 13, 3, 10, "ゴム手袋.png"],
  [62, 13, 3, 16, "スクラビビンバブル 流せるトイレブラシ.png"],
  [63, 13, 3, 16, "スタンプー.png"],
  [64, 13, 3, 17, "洗浄力トイレのクリーナー.png"],
  [65, 13, 3, 18, "トイレ用ファフリーズ.png"],
  [66, 14, 4, 19, "ディープロモイスト ヘアトリートメント.png"],
  [67, 14, 4, 19, "ディープロモイスト シャンプー.png"],
  [68, 15, 4, 2, "バスマジックリンリン.png"],
  [69, 15, 4, 1, "ロック防カビ煙剤.png"],
  [70, 16, 4, 2, "バブルン.png"],
  [71, 17, 5, 1, "デンターシステム.png"],
  [72, 18, 5, 20, "デンタルフロスン.png"],
  [73, 19, 5, 21, "シュミテクトン.png"],
  [74, 20, 5, 22, "ブレスケア 強ミント.png"],
  [75, 21, 5, 1, "Nanaoマウスウォッシュ.png"],
  [76, 22, 5, 23, "ムースーウォッシュ.png"],
  [77, 23, 5, 24, "お肌撫子 引き締め化粧水.png"],
  [78, 24, 5, 25, "バルクオムニ.png"],
  [79, 25, 5, 26, "メイク落としシート.png"],
  [80, 26, 5, 27, "パーフェクトUVスキンケア.png"],
  [81, 27, 6, 1, "グッスミン 酵母の力.png"],
  [82, 27, 6, 28, "マルチビタミンさらにミネラル.png"],
  [83, 28, 6, 29, "綿棒.png"],
  [84, 29, 6, 30, "超絶快適普通サイズ.png"],
  [85, 30, 6, 31, "ジレッポ 5枚刃 髭剃り.png"],
  [86, 30, 6, 32, "ピィニィ 眉毛剃り.png"],
  [87, 31, 6, 1, "ドギレイ 除菌シート.png"],
  [88, 32, 6, 33, "ナイガード.png"],
  [89, 33, 6, 34, "バンドエイド.png"],
  [90, 34, 6, 35, "マネキロン.png"],
  [91, 35, 7, 11, "スコティッシュ.png"],
  [92, 36, 7, 36, "エボタン 単三電池.png"],
  [93, 36, 7, 37, "LED電球.png"],
  [94, 37, 7, 38, "雑巾.png"],
  [95, 37, 7, 30, "ウェーブン.png"],
  [96, 37, 7, 38, "激落ち様.png"],
  [97, 38, 7, 39, "ビニール紐.png"],
  [98, 38, 7, 40, "輪ゴム.png"],
  [99, 38, 7, 41, "軍手.png"],
  [100, 38, 7, 42, "ガムテープ.png"]
]

products.each do |item_id, sub_category_product_id, category_product_id,maker_id, picture| 
  Product.create(item_id: item_id, sub_category_product_id: sub_category_product_id, 
    category_product_id: category_product_id,maker_id: maker_id, picture: picture)
end



requests = [
  [1, 1, "Cola"],
  [2, 2, "Soda", false],
  [3, 3, "BodySoap", true],
  [4, 4, "Ramp"]
]
requests.each do |user_id,request_type,request_name, register_flag| 
  Request.create(user_id: user_id,request_type: request_type,
    request_name: request_name, register_flag: register_flag)
end



to_buy_lists = [
  [1, 1, false],
  [2, 2, true],
  [3, 3, false,"2023-03-03T03:03:03"],
  [4, 4, true,"2023-04-04T04:04:04"]
]

to_buy_lists.each do |group_id, item_id, buy_flag, discarded_at| 
  ToBuyList.create(group_id: group_id, item_id: item_id, buy_flag: buy_flag, discarded_at: discarded_at)
end


carts = [
  [1, 1, 1,111],
  [2, 2, 22, 222],
  [3, 3, 333,333, "2023-03-03T03:03:03"],
  [4, 4, 4444,4444, "2023-04-04T04:04:04"]
]

carts.each do |group_id, item_id, criteria, price, discarded_at| 
  Cart.create(group_id: group_id, item_id: item_id, criteria: criteria, price: price, discarded_at: discarded_at)
end



criteria_days = [
  [1, 1, 111],
  [2, 2, 22],
  [3, 3, 3333],
  [1, 4, 4],
]

criteria_days.each do |group_id, item_id, criteria| 
  CriteriaDay.create(group_id: group_id, item_id: item_id, criteria: criteria)
end


shops = [
  ["AOKI", "Hokkaido"],
  ["Welcia", "Toyama-ken"],
  ["albis", "Okinawa-ken"],
  ["Ito yokado", "Tokyo-to"],
]

shops.each do |name, prefecture| 
  Shop.create(name: name, prefecture: prefecture)
end



favorites = [
  [1, 1],
  [2, 2],
  [3, 3],
  [1, 4]
]

favorites.each do |group_id, item_id| 
  Favorite.create(group_id: group_id, item_id: item_id)
end


invitations = [
  [1, 1],
  [2, 2],
  [3, 3],
  [1, 4]
]

invitations.each do |group_id, user_id| 
  Invitation.create(group_id: group_id, user_id: user_id)
end



stock_items = [
  [1, 1, 1, "2023-01-01", 1111, 1, 1, nil],
  [2, 2, 2, "2023-02-02", 2222, 2, 2, nil],
  [3, 3, 3, "2023-03-03", 33333,3,33, "2023-03-03T03:03:03"],
  [4, 4, 4, "2023-04-04", 444,  4,444,"2023-04-04T04:04:04"]
]

stock_items.each do |group_id,criteria,item_id,alarm_date,price,shop_id,quantity,discarded_at| 
  StockItem.create(group_id: group_id,criteria: criteria,item_id: item_id,alarm_date: alarm_date,
    price: price,shop_id: shop_id,quantity: quantity,discarded_at: discarded_at)
end