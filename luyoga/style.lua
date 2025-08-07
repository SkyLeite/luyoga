local Value = require("luyoga.value")

---@package
function setSize(kind)
    return function(style, size)
        yoga["YGNodeStyleSet" .. kind](style.ygNode, size)
    end
end

---@package
function setSizePercent(kind)
    return function(style, size)
        yoga["YGNodeStyleSet" .. kind .. "Percent"](style.ygNode, size)
    end
end

---@package
function setSizeAuto(kind)
    return function(style)
        yoga["YGNodeStyleSet" .. kind .. "Auto"](style.ygNode)
    end
end

---@package
function setSizeMaxContent(kind)
    return function(style)
        yoga["YGNodeStyleSet" .. kind .. "MaxContent"](style.ygNode)
    end
end

---@package
function setSizeFitContent(kind)
    return function(style)
        yoga["YGNodeStyleSet" .. kind .. "FitContent"](style.ygNode)
    end
end

---@package
function setSizeStretch(kind)
    return function(style)
        yoga["YGNodeStyleSet" .. kind .. "Stretch"](style.ygNode)
    end
end

---@package
function getSize(kind)
    return function(style)
        local r = yoga["YGNodeStyleGet" .. kind](style.ygNode)
        return Value:from_cdata(r)
    end
end

---@class luyoga.Style
---@field protected ygNode table
---
---@field setFlexBasis fun(self: luyoga.Style, flexBasis: number)
---@field setFlexBasisPercent fun(self: luyoga.Style, flexBasis: number)
---@field setFlexBasisAuto fun(self: luyoga.Style)
---@field setFlexBasisMaxContent fun(self: luyoga.Style)
---@field setFlexBasisFitContent fun(self: luyoga.Style)
---@field setFlexBasisStretch fun(self: luyoga.Style)
---
---@field setWidth fun(self: luyoga.Style, width: number)
---@field setWidthPercent fun(self: luyoga.Style, width: number)
---@field setWidthAuto fun(self: luyoga.Style)
---@field setWidthMaxContent fun(self: luyoga.Style)
---@field setWidthFitContent fun(self: luyoga.Style)
---@field setWidthStretch fun(self: luyoga.Style)
---
---@field setMinWidth fun(self: luyoga.Style, minWidth: number)
---@field setMinWidthPercent fun(self: luyoga.Style, minWidth: number)
---@field setMinWidthAuto fun(self: luyoga.Style)
---@field setMinWidthMaxContent fun(self: luyoga.Style)
---@field setMinWidthFitContent fun(self: luyoga.Style)
---@field setMinWidthStretch fun(self: luyoga.Style)
---
---@field setMaxWidth fun(self: luyoga.Style, maxWidth: number)
---@field setMaxWidthPercent fun(self: luyoga.Style, maxWidth: number)
---@field setMaxWidthAuto fun(self: luyoga.Style)
---@field setMaxWidthMaxContent fun(self: luyoga.Style)
---@field setMaxWidthFitContent fun(self: luyoga.Style)
---@field setMaxWidthStretch fun(self: luyoga.Style)
---
---@field setHeight fun(self: luyoga.Style, height: number)
---@field setHeightPercent fun(self: luyoga.Style, height: number)
---@field setHeightAuto fun(self: luyoga.Style)
---@field setHeightMaxContent fun(self: luyoga.Style)
---@field setHeightFitContent fun(self: luyoga.Style)
---@field setHeightStretch fun(self: luyoga.Style)
---
---@field setMinHeight fun(self: luyoga.Style, minHeight: number)
---@field setMinHeightPercent fun(self: luyoga.Style, minHeight: number)
---@field setMinHeightAuto fun(self: luyoga.Style)
---@field setMinHeightMaxContent fun(self: luyoga.Style)
---@field setMinHeightFitContent fun(self: luyoga.Style)
---@field setMinHeightStretch fun(self: luyoga.Style)
---
---@field setMaxHeight fun(self: luyoga.Style, maxHeight: number)
---@field setMaxHeightPercent fun(self: luyoga.Style, maxHeight: number)
---@field setMaxHeightAuto fun(self: luyoga.Style)
---@field setMaxHeightMaxContent fun(self: luyoga.Style)
---@field setMaxHeightFitContent fun(self: luyoga.Style)
---@field setMaxHeightStretch fun(self: luyoga.Style)
local Style = {}
Style.__index = Style

local sizes = { "FlexBasis", "Width", "Height", "MinWidth", "MinHeight", "MaxWidth", "MaxHeight" }

---@param ygNode table
---@return Style
function Style:new(ygNode)
    local s = {
        ygNode = ygNode,
    }

    for _, kind in pairs(sizes) do
        s["set" .. kind] = setSize(kind)
        s["set" .. kind .. "Percent"] = setSizePercent(kind)
        s["set" .. kind .. "Auto"] = setSizeAuto(kind)
        s["set" .. kind .. "MaxContent"] = setSizeMaxContent(kind)
        s["set" .. kind .. "FitContent"] = setSizeFitContent(kind)
        s["set" .. kind .. "Stretch"] = setSizeStretch(kind)
        s["get" .. kind] = getSize(kind)
    end

    setmetatable(s, { __index = self })

    return s
end

---@param direction luyoga.Direction
function Style:setDirection(direction)
    yoga.YGNodeStyleSetDirection(self.ygNode, direction)
end

---@return Direction
function Style:getDirection()
    return yoga.YGNodeStyleSetDirection(self.ygNode)
end

---@param direction luyoga.FlexDirection
function Style:setFlexDirection(direction)
    yoga.YGNodeStyleSetFlexDirection(self.ygNode, direction)
end

---@return luyoga.FlexDirection
function Style:getFlexDirection()
    return yoga.YGNodeStyleGetFlexDirection(self.ygNode)
end

---@param justifyContent luyoga.Justify
function Style:setJustifyContent(justifyContent)
    yoga.YGNodeStyleSetJustifyContent(self.ygNode, justifyContent)
end

---@return luyoga.Justify
function Style:getJustifyContent()
    return yoga.YGNodeStyleGetJustifyContent(self.ygNode)
end

---@param alignContent luyoga.Align
function Style:setAlignContent(alignContent)
    yoga.YGNodeStyleSetAlignContent(self.ygNode, alignContent)
end

---@return luyoga.Align
function Style:getAlignContent()
    return yoga.YGNodeStyleGetAlignContent(self.ygNode)
end

---@param alignItems luyoga.Align
function Style:setAlignItems(alignItems)
    yoga.YGNodeStyleSetAlignItems(self.ygNode, alignItems)
end

---@return luyoga.Align
function Style:getAlignItems()
    return yoga.YGNodeStyleGetAlignItems(self.ygNode)
end

---@param alignSelf luyoga.Align
function Style:setAlignSelf(alignSelf)
    yoga.YGNodeStyleSetAlignSelf(self.ygNode, alignSelf)
end

---@return luyoga.Align
function Style:getAlignSelf()
    return yoga.YGNodeStyleGetAlignSelf(self.ygNode)
end

---@param positionType luyoga.PositionType
function Style:setPositionType(positionType)
    yoga.YGNodeStyleSetPositionType(self.ygNode, positionType)
end

---@return luyoga.PositionType
function Style:getPositionType()
    return yoga.YGNodeStyleGetPositionType(self.ygNode)
end

---@param flexWrap luyoga.Wrap
function Style:setFlexWrap(flexWrap)
    yoga.YGNodeStyleSetFlexWrap(self.ygNode, flexWrap)
end

---@return luyoga.Wrap
function Style:getFlexWrap()
    return yoga.YGNodeStyleGetFlexWrap(self.ygNode)
end

---@param overflow luyoga.Overflow
function Style:setOverflow(overflow)
    yoga.YGNodeStyleSetOverflow(self.ygNode, overflow)
end

---@return luyoga.Overflow
function Style:getOverflow()
    return yoga.YGNodeStyleGetOvevlow(self.ygNode)
end

---@param display luyoga.Display
function Style:setDisplay(display)
    yoga.YGNodeStyleSetDisplay(self.ygNode, display)
end

---@return luyoga.Display
function Style:getDisplay()
    return yoga.YGNodeStyleGetDisplay(self.ygNode)
end

---@param flex number
function Style:setFlex(flex)
    yoga.YGNodeStyleSetFlex(self.ygNode, flex)
end

---@return number
function Style:getFlex()
    return yoga.YGNodeStyleGetFlex(self.ygNode)
end

---@param flexGrow number
function Style:setFlexGrow(flexGrow)
    yoga.YGNodeStyleSetFlexGrow(self.ygNode, flexGrow)
end

---@return number
function Style:getFlexGrow()
    return yoga.YGNodeStyleGetFlexGrow(self.ygNode)
end

---@param flexShrink number
function Style:setFlexShrink(flexShrink)
    yoga.YGNodeStyleSetFlexShrink(self.ygNode, flexShrink)
end

---@return number
function Style:getFlexShrink()
    return yoga.YGNodeStyleGetFlexShrink(self.ygNode)
end

---@param edge luyoga.Edge
---@param position number
function Style:setPosition(edge, position)
    yoga.YGNodeStyleSetPosition(self.ygNode, edge, position)
end

---@param edge luyoga.Edge
---@param position number
function Style:setPositionPercent(edge, position)
    yoga.YGNodeStyleSetPositionPercent(self.ygNode, edge, position)
end

---@param edge luyoga.Edge
function Style:getPosition(edge)
    local r = yoga.YGNodeStyleGetPosition(self.ygNode, edge)
    return Value:from_cdata(r)
end

---@param edge luyoga.Edge
function Style:setPositionAuto(edge)
    yoga.YGNodeStyleSetPositionAuto(self.ygNode, edge)
end

---@param edge luyoga.Edge
---@param margin number
function Style:setMargin(edge, margin)
    yoga.YGNodeStyleSetMargin(self.ygNode, edge, margin)
end

---@param edge luyoga.Edge
---@param margin number
function Style:setMarginPercent(edge, margin)
    yoga.YGNodeStyleSetMarginPercent(self.ygNode, edge, margin)
end

---@param edge luyoga.Edge
function Style:setMarginAuto(edge)
    yoga.YGNodeStyleSetMargin(self.ygNode, edge)
end

---@param edge luyoga.Edge
---@return Value
function Style:getMargin(edge)
    local r = yoga.YGNodeStyleGetMargin(self.ygNode, edge)
    return Value:from_cdata(r)
end

---@param edge luyoga.Edge
---@param padding number
function Style:setPadding(edge, padding)
    yoga.YGNodeStyleSetPadding(self.ygNode, edge, padding)
end

---@param edge luyoga.Edge
---@param padding number
function Style:setPaddingPercent(edge, padding)
    yoga.YGNodeStyleSetPaddingPercent(self.ygNode, edge, padding)
end

---@param edge luyoga.Edge
---@return Value
function Style:getPadding(edge)
    local r = yoga.YGNodeStyleGetPadding(self.ygNode, edge)
    return Value:from_cdata(r)
end

---@param edge luyoga.Edge
---@param border number
function Style:setBorder(edge, border)
    yoga.YGNodeStyleSetBorder(self.ygNode, edge, border)
end

---@param edge luyoga.Edge
---@return Value
function Style:getBorder(edge)
    local r = yoga.YGNodeStyleGetBorder(self.ygNode, edge)
    return Value:from_cdata(r)
end

---@param gutter luyoga.Gutter
---@param gapLength number
function Style:setGap(edge, gutter, gapLength)
    yoga.YGNodeStyleSetGap(self.ygNode, gutter, gapLength)
end

---@param gutter luyoga.Gutter
---@param gapLength number
function Style:setGapPercent(edge, gutter, gapLength)
    yoga.YGNodeStyleSetGapPercent(self.ygNode, gutter, gapLength)
end

---@param gutter luyoga.Gutter
---@return Value
function Style:getGap(gutter)
    local r = yoga.YGNodeStyleGetGap(self.ygNode, gutter)
    return Value:from_cdata(r)
end

---@param boxSizing luyoga.BoxSizing
function Style:setBoxSizing(boxSizing)
    yoga.YGNodeStyleSetBoxSizing(self.ygNode, boxSizing)
end

---@return luyoga.BoxSizing
function Style:getBoxSizing()
    return yoga.YGNodeStyleGetBoxSizing(self.ygNode)
end

---@param aspectRatio number
function Style:setAspectRatio(aspectRatio)
    yoga.YGNodeStyleSetAspectRatio(self.ygNode, aspectRatio)
end

---@return number
function Style:getAspectRatio()
    return yoga.YGNodeStyleGetAspectRatio(self.ygNode)
end

return Style
