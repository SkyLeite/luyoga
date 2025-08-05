# Luyoga

This is a set of Lua-friendly bindings for [Yoga](https://www.yogalayout.dev), Facebook's layout library.

## Setup

Simply copy the `luyoga` directory to your project and require it.

## Usage

The library is designed to resemble Yoga as closely as possible, so the official docs should be enough to learn how to use it.

### Building a Yoga tree

```lua
local yoga = require("yoga")

local root = yoga.Node.new()
root.style:setFlexDirection(yoga.Enums.FlexDirection.Row)
root.style:setWidth(100)
root.style:setHeight(100)

local child0 = yoga.Node.new()
child0.style:setFlexGrow(1)
child0.style:setMargin(1, yoga.Enums.Edge.Right)
root:insertChild(child0, 0)

local child1 = yoga.Node.new()
child1.style:setFlexGrow(1)
root:insertChild(child1, 1)
```

### Laying out the tree

```
root:caculateLayout(nil, nil, yoga.Enums.Direction.LTR)
```

### Reading layout results

```
loca left = child0.layout:getLeft();
loca height = child0.layout:getHeight();
```