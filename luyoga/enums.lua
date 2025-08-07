local ffi = require("ffi")

---@enum luyoga.FlexDirection
local FlexDirection = {
    Column = ffi.C.YGFlexDirectionColumn,
    ColumnReverse = ffi.C.YGFlexDirectionColumnReverse,
    Row = ffi.C.YGFlexDirectionRow,
    RowReverse = ffi.C.YGFlexDirectionRowReverse,
}

---@enum luyoga.Direction
local Direction = {
    Inherit = ffi.C.YGDirectionInherit,
    LTR = ffi.C.YGDirectionLTR,
    RTL = ffi.C.YGDirectionRTL,
}

---@enum luyoga.Align
local Align = {
    Auto = ffi.C.YGAlignAuto,
    FlexStart = ffi.C.YGAlignFlexStart,
    Center = ffi.C.YGAlignCenter,
    FlexEnd = ffi.C.YGAlignFlexEnd,
    Stretch = ffi.C.YGAlignStretch,
    Baseline = ffi.C.YGAlignBaseline,
    SpaceBetween = ffi.C.YGAlignSpaceBetween,
    SpaceAround = ffi.C.YGAlignSpaceAround,
    SpaceEvenly = ffi.C.YGAlignSpaceEvenly,
}

---@enum luyoga.Justify
local Justify = {
    FlexStart = ffi.C.YGJustifyFlexStart,
    Center = ffi.C.YGJustifyCenter,
    FlexEnd = ffi.C.YGJustifyFlexEnd,
    SpaceBetween = ffi.C.YGJustifySpaceBetween,
    SpaceAround = ffi.C.YGJustifySpaceAround,
    SpaceEvenly = ffi.C.YGJustifySpaceEvenly,
}

---@enum luyoga.Edge
local Edge = {
    Left = ffi.C.YGEdgeLeft,
    Top = ffi.C.YGEdgeTop,
    Right = ffi.C.YGEdgeRight,
    Bottom = ffi.C.YGEdgeBottom,
    Start = ffi.C.YGEdgeStart,
    End = ffi.C.YGEdgeEnd,
    Horizontal = ffi.C.YGEdgeHorizontal,
    Vertical = ffi.C.YGEdgeVertical,
    All = ffi.C.YGEdgeAll
}

---@enum luyoga.Unit
local Unit = {
    Undefined = ffi.C.YGUnitUndefined,
    Point = ffi.C.YGUnitPoint,
    Percent = ffi.C.YGUnitPercent,
    Auto = ffi.C.YGUnitAuto,
    MaxContent = ffi.C.YGUnitMaxContent,
    FitContent = ffi.C.YGUnitFitContent,
    Stretch = ffi.C.YGUnitStretch
}

---@enum luyoga.Gutter
local Gutter = {
    Column = ffi.C.YGGutterColumn,
    Row = ffi.C.YGGutterRow,
    All = ffi.C.YGGutterAll,
}

---@enum luyoga.PositionType
local PositionType = {
    Static = ffi.C.YGPositionTypeStatic,
    Relative = ffi.C.YGPositionTypeRelative,
    Absolute = ffi.C.YGPositionTypeAbsolute,
}

---@enum luyoga.Wrap
local Wrap = {
    NoWrap = ffi.C.YGWrapNoWrap,
    Wrap = ffi.C.YGWrapWrap,
    WrapReverse = ffi.C.YGWrapWrapReverse,
}

---@enum luyoga.Overflow
local Overflow = {
    Visible = ffi.C.YGOverflowVisible,
    Hidden = ffi.C.YGOverflowHidden,
    Scroll = ffi.C.YGOverflowScroll,
}

---@enum luyoga.Display
local Display = {
    Flex = ffi.C.YGDisplayFlex,
    None = ffi.C.YGDisplayNone,
    Contents = ffi.C.YGDisplayContents,
}

---@enum luyoga.BoxSizing
local BoxSizing = {
    BorderBox = ffi.C.YGBoxSizingBorderBox,
    ContentBox = ffi.C.YGBoxSizingContentBox,
}

---@enum luyoga.NodeType
local NodeType = {
    Default = ffi.C.YGNodeTypeDefault,
    Text = ffi.C.YGNodeTypeText,
}

return {
    FlexDirection = FlexDirection,
    Direction = Direction,
    Edge = Edge,
    Unit = Unit,
    Justify = Justify,
    Gutter = Gutter,
    PositionType = PositionType,
    Wrap = Wrap,
    Overflow = Overflow,
    Display = Display,
    BoxSizing = BoxSizing,
    NodeType = NodeType,
    Align = Align,
    YGUndefined = ffi.cast("float", 0/0)
}
