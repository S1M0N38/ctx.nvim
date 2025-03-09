-----------------------------------------
-- modules/users.lua
-----------------------------------------
local users = {}
local userList = {}

function users.create(name, email)
  local user = {
    id = #userList + 1,
    name = name,
    email = email,
    created = os.time(),
  }

  table.insert(userList, user)
  return user
end

function users.get(id)
  return userList[id]
end

function users.loadAll()
  -- Mock data
  users.create("John", "john@example.com")
  users.create("Alice", "alice@example.com")
  return userList
end

return users
