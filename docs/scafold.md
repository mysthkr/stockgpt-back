
rails g scaffold api/v1/categoryGrocery name:string --no-assets

rails g scaffold api/v1/categoryProduct name:string --no-assets

rails g scaffold api/v1/user email:string group_id:bigint encrypted_password:string admin:boolean business:boolean



model api/viからファイルを移行する。





###Users

curl 10.0.0.11:3000/api/v1/users/4

POST /api/v1/users

curl -X POST -H "Content-Type: application/json"  -d '{"email": "postuser@gmail.com", "group_id": 5, "encrypted_password": "postuser", "admin": true, "business": false }' 10.0.0.11:3000/api/v1/users

"email": "postuser@gmail.com", "group_id": 5, "encrypted_password": "postuser", "admin": true, "business": false


 email, group_id, encrypted_password, 
   admin,  business

curl -X POST -H "Content-Type: application/json"  -d "{"email": "post@gmail.com", "group_id": 5, "encrypted_password": "post", "admin": true, "business": false }" 10.0.0.11:3000/api/v1/users

---User---
Get
curl -X GET 10.0.0.11:3000/api/v1/users

Show
curl -X GET 10.0.0.11:3000/api/v1/users/6

Create
curl -X POST -H "Content-Type: application/json" -d "{\"email\": \"post@gmail.com\", \"group_id\": 5, \"encrypted_password\": \"post\", \"admin\": false, \"business\": false }" 10.0.0.11:3000/api/v1/users

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"email\": \"postpatch@gmail.com\", \"group_id\": 5, \"encrypted_password\": \"postpatch\", \"admin\": false, \"business\": false }" 10.0.0.11:3000/api/v1/users/6

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/users/7

Test not null
curl -X POST -H "Content-Type: application/json" -d "{\"email\": \"post@gmail.com\",  \"encrypted_password\": \"post\" }" 10.0.0.11:3000/api/v1/users



###Profile
rails g scaffold api/v1/profile user_id:bigint name:string nickname:string roommate_number:integer prefecture:string

3点修正
・Model
・Migration
・Controller

Get
curl -X GET 10.0.0.11:3000/api/v1/profiles

Show
curl -X GET 10.0.0.11:3000/api/v1/profiles/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"user_id\": 5, \"name\": \"name5\", \"nickname\": \"nicky5\", \"roommate_number\": 5, \"prefecture\": \"prefecture\"}" 10.0.0.11:3000/api/v1/profiles

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"user_id\": 5, \"name\": \"post name5\", \"nickname\": \"nickyedited\", \"roommate_number\": 1, \"prefecture\": \"prefecture\"}" 10.0.0.11:3000/api/v1/profiles/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/profiles/5


Test not null registration
curl -X POST -H "Content-Type: application/json" -d "{\"user_id\": 5, \"name\": \"name5\"}" 10.0.0.11:3000/api/v1/profiles


###Group

rails g scaffold api/v1/group name:string

Get
curl -X GET 10.0.0.11:3000/api/v1/groups

Show
curl -X GET 10.0.0.11:3000/api/v1/groups/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"name\": \"post group 5\"}" 10.0.0.11:3000/api/v1/groups

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"name\": \"editeddddd group 5\"}" 10.0.0.11:3000/api/v1/groups/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/groups/5


###Grocery
3点修正
・Model
・Migration
・Controller

rails g scaffold api/v1/grocery item_id:bigint subcategory_id:bigint category_id:bigint


Get
curl -X GET 10.0.0.11:3000/api/v1/groceries

Show
curl -X GET 10.0.0.11:3000/api/v1/groceries/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"item_id\": 9, \"subcategory_id\": 2, \"category_id\": 3}" 10.0.0.11:3000/api/v1/groceries

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"item_id\": 9999, \"subcategory_id\": 299, \"category_id\": 399}" 10.0.0.11:3000/api/v1/groceries/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/groceries/5


###Product
rails g scaffold api/v1/product item_id:bigint subcategory_id:bigint category_id:bigint maker_id:bigint picture:string


Get
curl -X GET 10.0.0.11:3000/api/v1/products

Show
curl -X GET 10.0.0.11:3000/api/v1/products/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"item_id\": 5, \"subcategory_id\": 2, \"category_id\": 3, \"maker_id\": 222, \"picture\": \"picture_post\"}" 10.0.0.11:3000/api/v1/products

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"item_id\": 9999, \"subcategory_id\": 299, \"category_id\": 399, \"maker_id\": 222999, \"picture\": \"edit_post\"}" 10.0.0.11:3000/api/v1/products/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/products/5

###CategoryGrocery
Get
curl -X GET 10.0.0.11:3000/api/v1/category_groceries

Show
curl -X GET 10.0.0.11:3000/api/v1/category_groceries/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"name\": \"snack\"}" 10.0.0.11:3000/api/v1/category_groceries

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"name\": \"edited snack\"}" 10.0.0.11:3000/api/v1/category_groceries/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/category_groceries/5


###CategoryProduct
Get
curl -X GET 10.0.0.11:3000/api/v1/category_products

Show
curl -X GET 10.0.0.11:3000/api/v1/category_products/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"name\": \"clean\"}" 10.0.0.11:3000/api/v1/category_products

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"name\": \"edited clean\"}" 10.0.0.11:3000/api/v1/category_products/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/category_products/5


###SubCategoryProduct
rails g scaffold api/v1/subCategoryProduct name:string category_id:bigint

Get
curl -X GET 10.0.0.11:3000/api/v1/sub_category_products

Show
curl -X GET 10.0.0.11:3000/api/v1/sub_category_products/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"name\": \"Bochuzai\", \"category_product_id\": 4}" 10.0.0.11:3000/api/v1/sub_category_products

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"name\": \"EditedddBochuzai\", \"category_id\": 3}" 10.0.0.11:3000/api/v1/sub_category_products/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/sub_category_products/5


###SubCategoryGrocery
rails g scaffold api/v1/subCategoryGrocery name:string category_id:bigint

Get
curl -X GET 10.0.0.11:3000/api/v1/sub_category_groceries

Show
curl -X GET 10.0.0.11:3000/api/v1/sub_category_groceries/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"name\": \"Onion\", \"category_id\": 4}" 10.0.0.11:3000/api/v1/sub_category_groceries

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"name\": \"EditedOnion\", \"category_id\": 3}" 10.0.0.11:3000/api/v1/sub_category_groceries/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/sub_category_groceries/5


###stockItem
rails g scaffold api/v1/stockItem group_id:bigint criteria:integer item_id:bigint alarm_date:date price:integer shop_id:bigint quantity:integer discarded_at:datetime:index

Get
curl -X GET 10.0.0.11:3000/api/v1/stock_items

Show
curl -X GET 10.0.0.11:3000/api/v1/stock_items/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"group_id\": 4,\"criteria\": 55,\"item_id\": 4,\"alarm_date\": \"2023-04-05\", \"price\": 55555, \"shop_id\": 4, \"quantity\": 555, \"discarded_at\": \"2022-05-05T05:05:05\"}" 10.0.0.11:3000/api/v1/stock_items

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"group_id\": 4,\"criteria\": 666,\"item_id\": 4,\"alarm_date\": \"2022-06-06\", \"price\":6666, \"shop_id\": 4, \"quantity\": 6666, \"discarded_at\": \"2022-06-06T06:06:06\"}" 10.0.0.11:3000/api/v1/stock_items/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/stock_items/5

null test 
curl -X POST -H "Content-Type: application/json" -d "{\"group_id\": 4,\"criteria\": 55,\"item_id\": 4,\"alarm_date\": \"2023-04-05\",  \"shop_id\": 4,  \"discarded_at\": \"2022-05-05T05:05:05\"}" 10.0.0.11:3000/api/v1/stock_items



###request
rails g scaffold api/v1/request user_id:bigint request_type:integer request_name:string register_flag:boolean

Get
curl -X GET 10.0.0.11:3000/api/v1/requests

Show
curl -X GET 10.0.0.11:3000/api/v1/requests/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"user_id\": 3,\"request_type\": 2,\"request_name\":  \"post name\"}" 10.0.0.11:3000/api/v1/requests

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"user_id\":3,\"request_type\": 3,\"request_name\": \"editeddd name\", \"register_flag\": true}" 10.0.0.11:3000/api/v1/requests/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/requests/5


###toBuyList
rails g scaffold api/v1/toBuyList group_id:bigint item_id:bigint buy_flag:boolean discarded_at:datetime:index

Get
curl -X GET 10.0.0.11:3000/api/v1/to_buy_lists

Show
curl -X GET 10.0.0.11:3000/api/v1/to_buy_lists/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"group_id\": 3,\"item_id\": 2}" 10.0.0.11:3000/api/v1/to_buy_lists

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"group_id\": 4,\"item_id\": 4,\"buy_flag\": true, \"discarded_at\": \"2022-05-05T05:05:05\"}" 10.0.0.11:3000/api/v1/to_buy_lists/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/to_buy_lists/5


###cart
rails g scaffold api/v1/cart group_id:bigint item_id:bigint criteria:integer price:integer discarded_at:datetime:index

Get
curl -X GET 10.0.0.11:3000/api/v1/carts

Show
curl -X GET 10.0.0.11:3000/api/v1/carts/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"group_id\": 3,\"item_id\": 2,\"criteria\": 555}" 10.0.0.11:3000/api/v1/carts

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"group_id\": 3,\"item_id\": 2,\"criteria\": 555, \"price\": 55555,\"discarded_at\": \"2022-05-05T05:05:05\"}" 10.0.0.11:3000/api/v1/carts/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/carts/5



##maker
rails g scaffold api/v1/maker name:string

Get
curl -X GET 10.0.0.11:3000/api/v1/makers

Show
curl -X GET 10.0.0.11:3000/api/v1/makers/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"name\": \"SUNSTAR\"}" 10.0.0.11:3000/api/v1/makers

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"name\": \"EDIT SUNSTAR\"}" 10.0.0.11:3000/api/v1/makers/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/makers/5



##criteriaDay
rails g scaffold api/v1/criteriaDay group_id:bigint item_id:bigint criteria:integer

Get
curl -X GET 10.0.0.11:3000/api/v1/criteria_days

Show
curl -X GET 10.0.0.11:3000/api/v1/criteria_days/1

Create
curl -X POST -H "Content-Type: application/json" -d "{\"group_id\": 3,\"item_id\": 2,\"criteria\": 555}" 10.0.0.11:3000/api/v1/criteria_days

Patch
curl -X PATCH -H "Content-Type: application/json" -d "{\"group_id\": 3,\"item_id\": 2,\"criteria\": 5555}" 10.0.0.11:3000/api/v1/criteria_days/5

Delete
curl -X DELETE 10.0.0.11:3000/api/v1/criteria_days/5






