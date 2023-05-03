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


groups = [
  "group one", 
  "group two", 
  "group three", 
  "group four"
]

groups.each do |name| 
  Group.create(name: name)
end
