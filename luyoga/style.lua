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
    return function (style)
        local r = yoga["YGNodeStyleGet" .. kind](style.ygNode)
        return Value:from_cdata(r)
    end
end

---@class Style
---@field protected ygNode table
---
---@field setFlexBasis fun(self: Style, flexBasis: number)
---@field setFlexBasisPercent fun(self: Style, flexBasis: number)
---@field setFlexBasisAuto fun(self: Style)
---@field setFlexBasisMaxContent fun(self: Style)
---@field setFlexBasisFitContent fun(self: Style)
---@field setFlexBasisStretch fun(self: Style)
---
---@field setWidth fun(self: Style, width: number)
---@field setWidthPercent fun(self: Style, width: number)
---@field setWidthAuto fun(self: Style)
---@field setWidthMaxContent fun(self: Style)
---@field setWidthFitContent fun(self: Style)
---@field setWidthStretch fun(self: Style)
---
---@field setMinWidth fun(self: Style, minWidth: number)
---@field setMinWidthPercent fun(self: Style, minWidth: number)
---@field setMinWidthAuto fun(self: Style)
---@field setMinWidthMaxContent fun(self: Style)
---@field setMinWidthFitContent fun(self: Style)
---@field setMinWidthStretch fun(self: Style)
---
---@field setMaxWidth fun(self: Style, maxWidth: number)
---@field setMaxWidthPercent fun(self: Style, maxWidth: number)
---@field setMaxWidthAuto fun(self: Style)
---@field setMaxWidthMaxContent fun(self: Style)
---@field setMaxWidthFitContent fun(self: Style)
---@field setMaxWidthStretch fun(self: Style)
---
---@field setHeight fun(self: Style, height: number)
---@field setHeightPercent fun(self: Style, height: number)
---@field setHeightAuto fun(self: Style)
---@field setHeightMaxContent fun(self: Style)
---@field setHeightFitContent fun(self: Style)
---@field setHeightStretch fun(self: Style)
---
---@field setMinHeight fun(self: Style, minHeight: number)
---@field setMinHeightPercent fun(self: Style, minHeight: number)
---@field setMinHeightAuto fun(self: Style)
---@field setMinHeightMaxContent fun(self: Style)
---@field setMinHeightFitContent fun(self: Style)
---@field setMinHeightStretch fun(self: Style)
---
---@field setMaxHeight fun(self: Style, maxHeight: number)
---@field setMaxHeightPercent fun(self: Style, maxHeight: number)
---@field setMaxHeightAuto fun(self: Style)
---@field setMaxHeightMaxContent fun(self: Style)
---@field setMaxHeightFitContent fun(self: Style)
---@field setMaxHeightStretch fun(self: Style)
local Style = {}
Style.__index = Style

local sizes = {"FlexBasis", "Width", "Height", "MinWidth", "MinHeight", "MaxWidth", "MaxHeight"}

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

---@param direction Direction
function Style:setDirection(direction)
    yoga.YGNodeStyleSetDirection(self.ygNode, direction)
end

---@return Direction
function Style:getDirection()
    return yoga.YGNodeStyleSetDirection(self.ygNode)
end

---@param direction FlexDirection
function Style:setFlexDirection(direction)
    yoga.YGNodeStyleSetFlexDirection(self.ygNode, direction)
end

---@return FlexDirection
function Style:getFlexDirection()
    return yoga.YGNodeStyleGetFlexDirection(self.ygNode)
end

---@param justifyContent Justify
function Style:setJustifyContent(justifyContent)
    yoga.YGNodeStyleSetJustifyContent(self.ygNode, justifyContent)
end

---@return Justify
function Style:getJustifyContent()
    return yoga.YGNodeStyleGetJustifyContent(self.ygNode)
end

---@param alignContent Align
function Style:setAlignContent(alignContent)
    yoga.YGNodeStyleSetAlignContent(self.ygNode, alignContent)
end

---@return Align
function Style:getAlignContent()
    return yoga.YGNodeStyleGetAlignContent(self.ygNode)
end

---@param alignItems Align
function Style:setAlignItems(alignItems)
    yoga.YGNodeStyleSetAlignItems(self.ygNode, alignItems)
end

---@return Align
function Style:getAlignItems()
    return yoga.YGNodeStyleGetAlignItems(self.ygNode)
end

---@param alignSelf Align
function Style:setAlignSelf(alignSelf)
    yoga.YGNodeStyleSetAlignSelf(self.ygNode, alignSelf)
end

---@return Align
function Style:getAlignSelf()
    return yoga.YGNodeStyleGetAlignSelf(self.ygNode)
end

---@param positionType PositionType
function Style:setPositionType(positionType)
    yoga.YGNodeStyleSetPositionType(self.ygNode, positionType)
end

---@return PositionType
function Style:getPositionType()
    return yoga.YGNodeStyleGetPositionType(self.ygNode)
end

---@param flexWrap Wrap
function Style:setFlexWrap(flexWrap)
    yoga.YGNodeStyleSetFlexWrap(self.ygNode, flexWrap)
end

---@return Wrap
function Style:getFlexWrap()
    return yoga.YGNodeStyleGetFlexWrap(self.ygNode)
end

---@param overflow Overflow
function Style:setOverflow(overflow)
    yoga.YGNodeStyleSetOverflow(self.ygNode, overflow)
end

---@return Overflow
function Style:getOverflow()
    return yoga.YGNodeStyleGetOvevlow(self.ygNode)
end

---@param display Display
function Style:setDisplay(display)
    yoga.YGNodeStyleSetDisplay(self.ygNode, display)
end

---@return Display
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

---@param edge Edge
---@param margin number
function Style:setMargin(edge, margin)
    yoga.YGNodeStyleSetMargin(self.ygNode, edge, margin)
end

---@param edge Edge
---@param margin number
function Style:setMarginPercent(edge, margin)
    yoga.YGNodeStyleSetMarginPercent(self.ygNode, edge, margin)
end

---@param edge Edge
function Style:setMarginAuto(edge)
    yoga.YGNodeStyleSetMargin(self.ygNode, edge)
end

---@param edge Edge
---@return Value
function Style:getMargin(edge)
    local r = yoga.YGNodeStyleGetMargin(self.ygNode, edge)
    return Value:from_cdata(r)
end

---@param edge Edge
---@param padding number
function Style:setPadding(edge, padding)
    yoga.YGNodeStyleSetPadding(self.ygNode, edge, padding)
end

---@param edge Edge
---@param padding number
function Style:setPaddingPercent(edge, padding)
    yoga.YGNodeStyleSetPaddingPercent(self.ygNode, edge, padding)
end

---@param edge Edge
---@return Value
function Style:getPadding(edge)
    local r = yoga.YGNodeStyleGetPadding(self.ygNode, edge)
    return Value:from_cdata(r)
end

---@param edge Edge
---@param border number
function Style:setBorder(edge, border)
    yoga.YGNodeStyleSetBorder(self.ygNode, edge, border)
end

---@param edge Edge
---@return Value
function Style:getBorder(edge)
    local r = yoga.YGNodeStyleGetBorder(self.ygNode, edge)
    return Value:from_cdata(r)
end

---@param gutter Gutter
---@param gapLength number
function Style:setGap(edge, gutter, gapLength)
    yoga.YGNodeStyleSetGap(self.ygNode, gutter, gapLength)
end

---@param gutter Gutter
---@param gapLength number
function Style:setGapPercent(edge, gutter, gapLength)
    yoga.YGNodeStyleSetGapPercent(self.ygNode, gutter, gapLength)
end

---@param gutter Gutter
---@return Value
function Style:getGap(gutter)
    local r = yoga.YGNodeStyleGetGap(self.ygNode, gutter)
    return Value:from_cdata(r)
end

---@param boxSizing BoxSizing
function Style:setBoxSizing(boxSizing)
    yoga.YGNodeStyleSetBoxSizing(self.ygNode, boxSizing)
end

---@return BoxSizing
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