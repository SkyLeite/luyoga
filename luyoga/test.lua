local yoga = require("main")
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