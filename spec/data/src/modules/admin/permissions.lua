-----------------------------------------
-- modules/admin/permissions.lua
-----------------------------------------
local permissions = {}
local roles = {
  admin = { "read", "write", "delete", "manage" },
  user = { "read", "write" },
  guest = { "read" },
}

function permissions.check(role, action)
  if not roles[role] then
    return false
  end

  for _, permitted in ipairs(roles[role]) do
    if permitted == action then
      return true
    end
  end

  return false
end

function permissions.getRolePermissions(role)
  return roles[role]
end

return permissions
