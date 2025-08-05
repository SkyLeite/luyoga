local ffi = require("ffi")
local enums = require("enums")

---@class Value
---@field value number
---@field unit Unit
local Value = {}
Value.__index = Value

---@param value any
---@param unit Unit
---@return Value
function Value:new(value, unit)
    cdata = ffi.new("YGValue", { value = value, unit = unit })
    return Value:from_cdata(cdata)
end

---@param cdata any
---@return Value
function Value:from_cdata(cdata)
    local s = {}
    setmetatable(s, { __index = Value })

    s.cdata = cdata
    s.value = cdata.value
    s.unit = enumKey(enums.Unit, cdata.unit)

    return s
end

return Value