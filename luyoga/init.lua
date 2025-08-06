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

local headerPath = package.searchpath("Yoga", cpath)

if jit.OS == "OSX" then
  cpath = cpath:gsub("%?%.so", "?.dylib")
elseif jit.OS == "Windows" then
  cpath = cpath:gsub("%?%.so", "?.dll")
end

local dllpath = package.searchpath("libyogacore", cpath)
status, yoga = pcall(ffi.load, dllpath)

if status == false then
  -- Try loading dylib
  local ncpath = cpath:gsub("%?%.so", "?.dylib")
  local dllpath = package.searchpath("libyogacore", ncpath)
  status, yoga = pcall(ffi.load, dllpath)
end

if status == false then
  -- Try loading dll
  local ncpath = cpath:gsub("%?%.so", "?.dll")
  local dllpath = package.searchpath("libyogacore", ncpath)
  status, yoga = pcall(ffi.load, dllpath)
end

if status == false then
  error("Failed to load yoga")
end


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
