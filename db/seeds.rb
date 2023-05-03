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
