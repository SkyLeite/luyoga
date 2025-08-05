function repository_root()
    local handle = io.popen("git rev-parse --show-toplevel")
    local result = handle:read("*a")
    handle:close()

    return result:gsub("\n", "")
end

local tree = repository_root() .. "/dev"

package.path = tree .. "/share/lua/5.2/?.lua;" ..
               tree .. "/share/lua/5.2/?/init.lua;" .. package.path
package.cpath = tree .. "/lib/lua/5.2/?.so;" ..
                tree .. "/lib/lua/5.2/?.dll;" .. package.cpath

-- Optionally load luarocks.loader (for rocks that use it)
pcall(require, "luarocks.loader")

local yoga = require("luyoga")
local tree = yoga.Node.new()

tree.style:setFlexDirection(yoga.Enums.FlexDirection.Column)
tree.style:setHeight(100)
tree.style:setWidth(100)

local child = yoga.Node.new()
child.style:setMargin(yoga.Enums.Edge.Left, 10)
print(child.style:getMargin(yoga.Enums.Edge.Left).unit)
print(child.layout:getDirection())
child.style:setWidth(100)
print(child.style:setWidth(10))


tree:insertChild(child, 0)

tree:calculateLayout(nil, nil, yoga.Enums.Direction.LTR)

print(child.layout:getLeft())