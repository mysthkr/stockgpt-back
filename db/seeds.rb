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


items = [
  ["Senzai", 100],
  ["Haburashi", 200],
  ["Shampoo", 300],
  ["Egg", 7]
]

items.each do |name, criteria| 
  Item.create(name: name, criteria: criteria)
end


makers = [
  "Kao", "Lion", "P&G", "SHIRO"
]

makers.each do |name| 
  Maker.create(name: name)
end


category_groceries = [
  "meet", "fish", "bevarage", "vegetable"
]

category_groceries.each do |name| 
  CategoryGrocery.create(name: name)
end



category_ptoducts = [
  "kitchen", "bathroom", "rooms", "outdoor"
]

category_ptoducts.each do |name| 
  CategoryProduct.create(name: name)
end


sub_category_products = [
  ["senzai",1], 
  ["suponzi",1], 
  ["Shampoo",2],
  ["Fragrance",3] 
]

sub_category_products.each do |name, category_product_id| 
  SubCategoryProduct.create(name: name, category_product_id: category_product_id)
end

sub_category_groceries = [
  ["beef",1], 
  ["pork",1], 
  ["salmon",2],
  ["milk",3] 
]

sub_category_groceries.each do |name, category_grocery_id| 
  SubCategoryGrocery.create(name: name, category_grocery_id: category_grocery_id)
end


groceries = [
  [1, 1, 1], 
  [2, 2, 2], 
  [3, 3, 2],
  [1, 1, 1] 
]

groceries.each do |item_id, sub_category_grocery_id, category_grocery_id| 
  Grocery.create(item_id: item_id, sub_category_grocery_id: sub_category_grocery_id, category_grocery_id: category_grocery_id)
end


products = [
  [1, 1, 1, 1,"picture_1"], 
  [2, 2, 2, 2,"picture_2"], 
  [3, 3, 2, 3,"picture_3"],
  [1, 1, 1, 1,"picture_1"] 
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