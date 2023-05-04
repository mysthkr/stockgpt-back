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
  ["admin@gmail.com", 1, "admin", true, false], 
]

users.each do |email, group_id, encrypted_password, admin, business| 
  User.create(email: email, group_id: group_id, encrypted_password: encrypted_password, 
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



groceries = [
  [1, 1, 1], 
  [2, 2, 2], 
  [3, 3, 2],
  [1, 1, 1] 
]

groceries.each do |item_id, subcategory_id, category_id| 
  Grocery.create(item_id: item_id, subcategory_id: subcategory_id, category_id: category_id)
end


products = [
  [1, 1, 1, 1,"picture_1"], 
  [2, 2, 2, 2,"picture_2"], 
  [3, 3, 2, 3,"picture_3"],
  [1, 1, 1, 1,"picture_1"] 
]

products.each do |item_id, subcategory_id, category_id,maker_id, picture| 
  Product.create(item_id: item_id, subcategory_id: subcategory_id, 
    category_id: category_id,maker_id: maker_id, picture: picture)
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




