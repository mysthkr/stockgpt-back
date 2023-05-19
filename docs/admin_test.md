---User---
rails g controller api/v1/admin/users

Get
curl -X GET 10.0.0.11:3000/api/v1/admin/users

Show
curl -X GET 10.0.0.11:3000/api/v1/admin/users/6

Create
curl -X POST -H "Content-Type: application/json" -d "{\"email\": \"post@gmail.com\", \"group_id\": 5, \"encrypted_password\": \"post\", \"admin\": false, \"business\": false }" 10.0.0.11:3000/api/v1/admin/users

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"email\": \"postpatch@gmail.com\", \"group_id\": 5, \"encrypted_password\": \"postpatch\", \"admin\": false, \"business\": false }" 10.0.0.11:3000/api/v1/admin/users/6

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/admin/users/7

Test not null
curl -X POST -H "Content-Type: application/json" -d "{\"email\": \"post@gmail.com\",  \"encrypted_password\": \"post\" }" 10.0.0.11:3000/api/v1/admin/users



###Profile
rails g controller api/v1/admin/profiles

3点修正
・Model
・Migration
・Controller

Get
curl -X GET 10.0.0.11:3000/api/v1/admin/profiles

Show
curl -X GET 10.0.0.11:3000/api/v1/admin/profiles/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"user_id\": 5, \"name\": \"name5\", \"nickname\": \"nicky5\", \"roommate_number\": 5, \"prefecture\": \"prefecture\"}" 10.0.0.11:3000/api/v1/admin/profiles

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"user_id\": 5, \"name\": \"post name5\", \"nickname\": \"nickyedited\", \"roommate_number\": 1, \"prefecture\": \"prefecture\"}" 10.0.0.11:3000/api/v1/admin/profiles/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/admin/profiles/5


Test not null registration
curl -X POST -H "Content-Type: application/json" -d "{\"user_id\": 5, \"name\": \"name5\"}" 10.0.0.11:3000/api/v1/admin/profiles


###Group

rails g controller api/v1/admin/groups

Get
curl -X GET 10.0.0.11:3000/api/v1/admin/groups

Show
curl -X GET 10.0.0.11:3000/api/v1/admin/groups/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"name\": \"post group 5\"}" 10.0.0.11:3000/api/v1/admin/groups

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"name\": \"editeddddd group 5\"}" 10.0.0.11:3000/api/v1/admin/groups/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/admin/groups/5


###Grocery
3点修正
・Model
・Migration
・Controller

rails g controller api/v1/admin/groceries


Get
curl -X GET 10.0.0.11:3000/api/v1/admin/groceries

Show
curl -X GET 10.0.0.11:3000/api/v1/admin/groceries/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"item_id\": 9, \"subcategory_id\": 2, \"category_id\": 3}" 10.0.0.11:3000/api/v1/admin/groceries

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"item_id\": 9999, \"subcategory_id\": 299, \"category_id\": 399}" 10.0.0.11:3000/api/v1/admin/groceries/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/admin/groceries/5


###Product
rails g controller api/v1/admin/products

Get
curl -X GET 10.0.0.11:3000/api/v1/admin/products

Show
curl -X GET 10.0.0.11:3000/api/v1/admin/products/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"item_id\": 5, \"subcategory_id\": 2, \"category_id\": 3, \"maker_id\": 222, \"picture\": \"picture_post\"}" 10.0.0.11:3000/api/v1/admin/products

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"item_id\": 9999, \"subcategory_id\": 299, \"category_id\": 399, \"maker_id\": 222999, \"picture\": \"edit_post\"}" 10.0.0.11:3000/api/v1/admin/products/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/admin/products/5

###CategoryGrocery
rails g controller api/v1/admin/categoryGroceries


Get
curl -X GET 10.0.0.11:3000/api/v1/admin/category_groceries

Show
curl -X GET 10.0.0.11:3000/api/v1/admin/category_groceries/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"name\": \"snack\"}" 10.0.0.11:3000/api/v1/admin/category_groceries

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"name\": \"edited snack\"}" 10.0.0.11:3000/api/v1/admin/category_groceries/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/admin/category_groceries/5


###CategoryProduct
rails g controller api/v1/admin/categoryProducts

Get
curl -X GET 10.0.0.11:3000/api/v1/admin/category_products

Show
curl -X GET 10.0.0.11:3000/api/v1/admin/category_products/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"name\": \"clean\"}" 10.0.0.11:3000/api/v1/admin/category_products

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"name\": \"edited clean\"}" 10.0.0.11:3000/api/v1/admin/category_products/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/admin/category_products/5


###SubCategoryProduct
rails g controller api/v1/admin/subCategoryProducts

Get
curl -X GET 10.0.0.11:3000/api/v1/admin/sub_category_products

Show
curl -X GET 10.0.0.11:3000/api/v1/admin/sub_category_products/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"name\": \"Bochuzai\", \"category_product_id\": 4}" 10.0.0.11:3000/api/v1/admin/sub_category_products

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"name\": \"EditedddBochuzai\", \"category_id\": 3}" 10.0.0.11:3000/api/v1/admin/sub_category_products/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/admin/sub_category_products/5


###SubCategoryGrocery
rails g controller api/v1/admin/subCategoryGroceries

Get
curl -X GET 10.0.0.11:3000/api/v1/admin/sub_category_groceries

Show
curl -X GET 10.0.0.11:3000/api/v1/admin/sub_category_groceries/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"name\": \"Onion\", \"category_id\": 4}" 10.0.0.11:3000/api/v1/admin/sub_category_groceries

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"name\": \"EditedOnion\", \"category_id\": 3}" 10.0.0.11:3000/api/v1/admin/sub_category_groceries/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/admin/sub_category_groceries/5


###stockItem
rails g controller api/v1/admin/stockItems

Get
curl -X GET 10.0.0.11:3000/api/v1/admin/stock_items

Show
curl -X GET 10.0.0.11:3000/api/v1/admin/stock_items/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"group_id\": 4,\"criteria\": 55,\"item_id\": 4,\"alarm_date\": \"2023-04-05\", \"price\": 55555, \"shop_id\": 4, \"quantity\": 555, \"discarded_at\": \"2022-05-05T05:05:05\"}" 10.0.0.11:3000/api/v1/admin/stock_items

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"group_id\": 4,\"criteria\": 666,\"item_id\": 4,\"alarm_date\": \"2022-06-06\", \"price\":6666, \"shop_id\": 4, \"quantity\": 6666, \"discarded_at\": \"2022-06-06T06:06:06\"}" 10.0.0.11:3000/api/v1/admin/stock_items/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/admin/stock_items/5

null test 
curl -X POST -H "Content-Type: application/json" -d "{\"group_id\": 4,\"criteria\": 55,\"item_id\": 4,\"alarm_date\": \"2023-04-05\",  \"shop_id\": 4,  \"discarded_at\": \"2022-05-05T05:05:05\"}" 10.0.0.11:3000/api/v1/admin/stock_items



###request
rails g controller api/v1/admin/requests

Get
curl -X GET 10.0.0.11:3000/api/v1/admin/requests

Show
curl -X GET 10.0.0.11:3000/api/v1/admin/requests/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"user_id\": 3,\"request_type\": 2,\"request_name\":  \"post name\"}" 10.0.0.11:3000/api/v1/admin/requests

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"user_id\":3,\"request_type\": 3,\"request_name\": \"editeddd name\", \"register_flag\": true}" 10.0.0.11:3000/api/v1/admin/requests/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/admin/requests/5


###toBuyList
rails g controller api/v1/admin/toBuyLists

Get
curl -X GET 10.0.0.11:3000/api/v1/admin/to_buy_lists

Show
curl -X GET 10.0.0.11:3000/api/v1/admin/to_buy_lists/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"group_id\": 3,\"item_id\": 2}" 10.0.0.11:3000/api/v1/admin/to_buy_lists

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"group_id\": 4,\"item_id\": 4,\"buy_flag\": true, \"discarded_at\": \"2022-05-05T05:05:05\"}" 10.0.0.11:3000/api/v1/admin/to_buy_lists/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/admin/to_buy_lists/5


###cart
rails g controller api/v1/admin/carts

Get
curl -X GET 10.0.0.11:3000/api/v1/admin/carts

Show
curl -X GET 10.0.0.11:3000/api/v1/admin/carts/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"group_id\": 3,\"item_id\": 2,\"criteria\": 555}" 10.0.0.11:3000/api/v1/admin/carts

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"group_id\": 3,\"item_id\": 2,\"criteria\": 555, \"price\": 55555,\"discarded_at\": \"2022-05-05T05:05:05\"}" 10.0.0.11:3000/api/v1/admin/carts/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/admin/carts/5



##maker
rails g controller api/v1/admin/makers

Get
curl -X GET 10.0.0.11:3000/api/v1/admin/makers

Show
curl -X GET 10.0.0.11:3000/api/v1/admin/makers/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"name\": \"SUNSTAR\"}" 10.0.0.11:3000/api/v1/admin/makers

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"name\": \"EDIT SUNSTAR\"}" 10.0.0.11:3000/api/v1/admin/makers/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/admin/makers/5



##criteriaDay
rails g controller api/v1/admin/criteriaDays

Get
curl -X GET 10.0.0.11:3000/api/v1/admin/criteria_days

Show
curl -X GET 10.0.0.11:3000/api/v1/admin/criteria_days/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"group_id\": 3,\"item_id\": 2,\"criteria\": 555}" 10.0.0.11:3000/api/v1/admin/criteria_days

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"group_id\": 3,\"item_id\": 2,\"criteria\": 5555}" 10.0.0.11:3000/api/v1/admin/criteria_days/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/admin/criteria_days/5


##Shop
rails g controller api/v1/admin/shops

Get
curl -X GET 10.0.0.11:3000/api/v1/admin/shops

Show
curl -X GET 10.0.0.11:3000/api/v1/admin/shops/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"name\": \"Ogino\",\"prefecture\": \"Yamanashi-ken\"}" 10.0.0.11:3000/api/v1/admin/shops

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"name\": \"Raicho\"}" 10.0.0.11:3000/api/v1/admin/shops/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/admin/shops/5




##favorite
rails g controller api/v1/admin/favorites

Get
curl -X GET 10.0.0.11:3000/api/v1/admin/favorites

Show
curl -X GET 10.0.0.11:3000/api/v1/admin/favorites/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"group_id\": 4,\"item_id\": 4}" 10.0.0.11:3000/api/v1/admin/favorites

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"group_id\": 1}" 10.0.0.11:3000/api/v1/admin/favorites/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/admin/favorites/5




##invitation
rails g controller api/v1/admin/invitations

Get
curl -X GET 10.0.0.11:3000/api/v1/admin/invitations

Show
curl -X GET 10.0.0.11:3000/api/v1/admin/invitations/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"group_id\": 4,\"user_id\": 4}" 10.0.0.11:3000/api/v1/admin/invitations

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"group_id\": 1}" 10.0.0.11:3000/api/v1/admin/invitations/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/admin/invitations/5




##item
rails g controller api/v1/admin/items

Get
curl -X GET 10.0.0.11:3000/api/v1/admin/items

Show
curl -X GET 10.0.0.11:3000/api/v1/admin/items/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"name\": \"beef\",\"criteria\": 5}" 10.0.0.11:3000/api/v1/admin/items

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"criteria\": 4}" 10.0.0.11:3000/api/v1/admin/items/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/admin/items/5