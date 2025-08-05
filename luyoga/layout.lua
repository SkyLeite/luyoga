---@class Layout
---@field private ygNode table
local Layout = {}

---@return Layout
function Layout:new(ygNode)
    local s = {
        ygNode = ygNode,
    }
    setmetatable(s, { __index = self })

    return s
end

---@return number
function Layout:getLeft()
    return yoga.YGNodeLayoutGetLeft(self.ygNode)
end

---@return number
function Layout:getTop()
    return yoga.YGNodeLayoutGetTop(self.ygNode)
end

---@return number
function Layout:getRight()
    return yoga.YGNodeLayoutGetRight(self.ygNode)
end

---@return number
function Layout:getBottom()
    return yoga.YGNodeLayoutGetBottom(self.ygNode)
end

---@return number
function Layout:getWidth()
    return yoga.YGNodeLayoutGetWidth(self.ygNode)
end

---@return number
function Layout:getHeight()
    return yoga.YGNodeLayoutGetHeight(self.ygNode)
end

---@return Direction
function Layout:getDirection()
    return yoga.YGNodeLayoutGetDirection(self.ygNode)
end

---@return bool
function Layout:getHadOverflow()
    return yoga.YGNodeLayoutGetHadOverflow(self.ygNode)
end

---@param edge Edge
---@return number
function Layout:getMargin(edge)
    return yoga.YGNodeLayoutGetMargin(self.ygNode, edge)
end

---@param edge Edge
---@return number
function Layout:getBorder(edge)
    return yoga.YGNodeLayoutGetBorder(self.ygNode, edge)
end

---@param edge Edge
---@return number
function Layout:getPadding(edge)
    return yoga.YGNodeLayoutGetPadding(self.ygNode, edge)
end

---@return number
function Layout:getRawHeight()
    return yoga.YGNodeLayoutGetRawHeight(self.ygNode)
end

---@return number
function Layout:getRawWidth()
    return yoga.YGNodeLayoutGetRawWidth(self.ygNode)
end

return Layout