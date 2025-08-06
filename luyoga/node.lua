local ffi = require("ffi")
local Style = require("luyoga.style")
local Layout = require("luyoga.layout")
local Enums = require("luyoga.enums")

---@class Node
---@field private ygNode table
---@field style Style
---@field layout Layout
local Node = {}

---@return Node
function Node.new()
    local node = yoga.YGNodeNew()
    return Node.from_cdata(node)
end

---@return Node
function Node.from_cdata(node)
    local s = {
        ygNode = node,
        style = Style:new(node),
        layout = Layout:new(node),
    }
    setmetatable(s, { __index = Node })

    return s
end

function Node:reset()
    yoga.YGNodeReset(self.ygNode)
end

---@param availableWidth number?
---@param availableHeight number?
---@param ownerDirection Direction
function Node:calculateLayout(availableWidth, availableHeight, ownerDirection)
    yoga.YGNodeCalculateLayout(self.ygNode, availableWidth or Enums.YGUndefined, availableHeight or Enums.YGUndefined, ownerDirection)
end

function Node:getHasNewLayout()
    return yoga.YGNodeGetHasNewLayout(self.ygNode)
end

---@param hasNewLayout boolean
function Node:setHasNewLayout(hasNewLayout)
    yoga.YGNodeSetHasNewLayout(self.ygNode, hasNewLayout)
end

function Node:isDirty()
    return yoga.YGNodeIsDirty(self.ygNode)
end

function Node:markDirty()
    return yoga.YGNodeMarkDirty(self.ygNode)
end

---@param child Node
---@param index number
function Node:insertChild(child, index)
    assert(self.ygNode ~= child.ygNode, "Cannot set a node as its own child.")

    yoga.YGNodeInsertChild(self.ygNode, child.ygNode, index or 0)
end

---@param child Node
---@param index number
function Node:swapChild(child, index)
    yoga.YGNodeSwapChild(self.ygNode, child.ygNode, index or 0)
end

---@param child Node
function Node:removeChild(child)
    yoga.YGNodeRemoveChild(self.ygNode, child.ygNode)
end

function Node:removeAllChildren(child)
    yoga.YGNodeRemoveAllChildren(self.ygNode)
end

---@param index number
function Node:getChild(index)
    local node = yoga.YGNodeGetChild(self.ygNode, index)
    return Node.from_cdata(node)
end

---@return number
function Node:getChildCound()
    return yoga.YGNodeGetChildCount(self.ygNode)
end

---@return Node
function Node:getOwner()
    local node = yoga.YGNodeGetOwner(self.ygNode)
    return Node.from_cdata(node)
end

---@return Node
function Node:getParent()
    local node = yoga.YGNodeGetParent(self.ygNode)
    return Node.from_cdata(node)
end

---@param nodeType NodeType
function Node:setNodeType(nodeType)
    yoga.YGNodeSetNodeType(self.ygNode, nodeType)
end

---@param nodeType NodeType
function Node:getNodeType(nodeType)
    return yoga.YGNodeGetNodeType(self.ygNode)
end

---@param alwaysFormsContainingBlock boolean
function Node:setAlwaysFormsContainingBlock(alwaysFormsContainingBlock)
    yoga.YGNodeSetAlwaysFormsContainingBlock(self.ygNode, alwaysFormsContainingBlock)
end

---@return boolean
function Node:getAlwaysFormsContainingBlock()
    return yoga.YGNodeSetAlwaysFormsContainingBlock(self.ygNode)
end

---@param dstNode Node
---@param srcNode Node
function Node:copyStyle(dstNode, srcNode)
    yoga.YGNodeCopyStyle(dstNode, srcNode)
end

return Node