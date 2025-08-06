local ffi = require("ffi")
local hpath = package.cpath:gsub("%?%.so", "?.h"):gsub("%?%.dll", "?.h")
local headerPath = package.searchpath("Yoga", hpath)
local headerFile = io.open(headerPath, "r")
if headerFile == nil then
    error (
        "Could not find header file. Please report this in the GitHub repository.\n" ..
        "package.cpath: " .. package.cpath .. "\n" ..
        "hpath: " .. hpath .. "\n"
    )
end

ffi.cdef(headerFile:read("a"))

local cpath = package.cpath
if jit.OS == "OSX" then
  cpath = cpath:gsub("%?%.so", "?.dylib")
elseif jit.OS == "Windows" then
  cpath = cpath:gsub("%?%.so", "?.dll")
end

local dllpath = package.searchpath("libyogacore", cpath)
yoga = ffi.load(dllpath)

local Enums = require("luyoga.enums")
require("luyoga.util")

local Style = require("luyoga.style")
local Layout = require("luyoga.layout")
local Node = require("luyoga.node")
local Value = require("luyoga.value")

return {
    Node = Node,
    Layout = Layout,
    Style = Style,
    Value = Value,
    Enums = Enums
}
