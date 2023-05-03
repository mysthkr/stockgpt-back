
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

curl -X POST -H "Content-Type: application/json" -d "{\"email\": \"post@gmail.com\",  \"encrypted_password\": \"post\" }" 10.0.0.11:3000/api/v1/users






