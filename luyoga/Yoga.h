typedef unsigned long size_t;

typedef enum YGAlign
{
    YGAlignAuto,
    YGAlignFlexStart,
    YGAlignCenter,
    YGAlignFlexEnd,
    YGAlignStretch,
    YGAlignBaseline,
    YGAlignSpaceBetween,
    YGAlignSpaceAround,
    YGAlignSpaceEvenly
} YGAlign;
const char *YGAlignToString(YGAlign);
typedef enum YGBoxSizing
{
    YGBoxSizingBorderBox,
    YGBoxSizingContentBox
} YGBoxSizing;
const char *YGBoxSizingToString(YGBoxSizing);
typedef enum YGDimension
{
    YGDimensionWidth,
    YGDimensionHeight
} YGDimension;
const char *YGDimensionToString(YGDimension);
typedef enum YGDirection
{
    YGDirectionInherit,
    YGDirectionLTR,
    YGDirectionRTL
} YGDirection;
const char *YGDirectionToString(YGDirection);
typedef enum YGDisplay
{
    YGDisplayFlex,
    YGDisplayNone,
    YGDisplayContents
} YGDisplay;
const char *YGDisplayToString(YGDisplay);
typedef enum YGEdge
{
    YGEdgeLeft,
    YGEdgeTop,
    YGEdgeRight,
    YGEdgeBottom,
    YGEdgeStart,
    YGEdgeEnd,
    YGEdgeHorizontal,
    YGEdgeVertical,
    YGEdgeAll
} YGEdge;
const char *YGEdgeToString(YGEdge);
typedef enum YGErrata
{
    YGErrataNone = 0,
    YGErrataStretchFlexBasis = 1,
    YGErrataAbsolutePositionWithoutInsetsExcludesPadding = 2,
    YGErrataAbsolutePercentAgainstInnerSize = 4,
    YGErrataAll = 2147483647,
    YGErrataClassic = 2147483646
} YGErrata;
const char *YGErrataToString(YGErrata);

typedef enum YGExperimentalFeature
{
    YGExperimentalFeatureWebFlexBasis
} YGExperimentalFeature;

const char *YGExperimentalFeatureToString(YGExperimentalFeature);

typedef enum YGFlexDirection
{
    YGFlexDirectionColumn,
    YGFlexDirectionColumnReverse,
    YGFlexDirectionRow,
    YGFlexDirectionRowReverse
} YGFlexDirection;

const char *YGFlexDirectionToString(YGFlexDirection);

typedef enum YGGutter
{
    YGGutterColumn,
    YGGutterRow,
    YGGutterAll
} YGGutter;
const char *YGGutterToString(YGGutter);

typedef enum YGJustify
{
    YGJustifyFlexStart,
    YGJustifyCenter,
    YGJustifyFlexEnd,
    YGJustifySpaceBetween,
    YGJustifySpaceAround,
    YGJustifySpaceEvenly
} YGJustify;
const char *YGJustifyToString(YGJustify);
typedef enum YGLogLevel
{
    YGLogLevelError,
    YGLogLevelWarn,
    YGLogLevelInfo,
    YGLogLevelDebug,
    YGLogLevelVerbose,
    YGLogLevelFatal
} YGLogLevel;

const char *YGLogLevelToString(YGLogLevel);
typedef enum YGMeasureMode
{
    YGMeasureModeUndefined,
    YGMeasureModeExactly,
    YGMeasureModeAtMost
} YGMeasureMode;

const char *YGMeasureModeToString(YGMeasureMode);

typedef enum YGNodeType
{
    YGNodeTypeDefault,
    YGNodeTypeText
} YGNodeType;

const char *YGNodeTypeToString(YGNodeType);

typedef enum YGOverflow
{
    YGOverflowVisible,
    YGOverflowHidden,
    YGOverflowScroll
} YGOverflow;

const char *YGOverflowToString(YGOverflow);

typedef enum YGPositionType
{
    YGPositionTypeStatic,
    YGPositionTypeRelative,
    YGPositionTypeAbsolute
} YGPositionType;

const char *YGPositionTypeToString(YGPositionType);

typedef enum YGUnit
{
    YGUnitUndefined,
    YGUnitPoint,
    YGUnitPercent,
    YGUnitAuto,
    YGUnitMaxContent,
    YGUnitFitContent,
    YGUnitStretch
} YGUnit;
const char *YGUnitToString(YGUnit);
typedef enum YGWrap
{
    YGWrapNoWrap,
    YGWrapWrap,
    YGWrapWrapReverse
} YGWrap;
const char *YGWrapToString(YGWrap);

typedef struct YGNode *YGNodeRef;
typedef const struct YGNode *YGNodeConstRef;

typedef struct YGConfig *YGConfigRef;

typedef const struct YGConfig *YGConfigConstRef;

YGConfigRef YGConfigNew(void);

void YGConfigFree(YGConfigRef config);

YGConfigConstRef YGConfigGetDefault(void);

void YGConfigSetUseWebDefaults(YGConfigRef config, bool enabled);
bool YGConfigGetUseWebDefaults(YGConfigConstRef config);
void YGConfigSetPointScaleFactor(YGConfigRef config, float pixelsInPoint);

float YGConfigGetPointScaleFactor(YGConfigConstRef config);
void YGConfigSetErrata(YGConfigRef config, YGErrata errata);

YGErrata YGConfigGetErrata(YGConfigConstRef config);

// typedef int (*YGLogger)(
//     YGConfigConstRef config,
//     YGNodeConstRef node,
//     YGLogLevel level,
//     const char* format,
//     va_list args);

// void YGConfigSetLogger(YGConfigRef config, YGLogger logger);

void YGConfigSetContext(YGConfigRef config, void *context);

void *YGConfigGetContext(YGConfigConstRef config);

typedef YGNodeRef (*YGCloneNodeFunc)(
    YGNodeConstRef oldNode,
    YGNodeConstRef owner,
    size_t childIndex);

void YGConfigSetExperimentalFeatureEnabled(
    YGConfigRef config,
    YGExperimentalFeature feature, bool enabled);
bool YGConfigIsExperimentalFeatureEnabled(
    YGConfigConstRef config,
    YGExperimentalFeature feature);

void YGConfigSetCloneNodeFunc(YGConfigRef config, YGCloneNodeFunc callback);

typedef struct YGNode *YGNodeRef;

typedef const struct YGNode *YGNodeConstRef;

YGNodeRef YGNodeNew(void);

YGNodeRef YGNodeNewWithConfig(YGConfigConstRef config);

YGNodeRef YGNodeClone(YGNodeConstRef node);

void YGNodeFree(YGNodeRef node);

void YGNodeFreeRecursive(YGNodeRef node);

void YGNodeFinalize(YGNodeRef node);

void YGNodeReset(YGNodeRef node);
void YGNodeCalculateLayout(
    YGNodeRef node,
    float availableWidth,
    float availableHeight,
    YGDirection ownerDirection);
bool YGNodeGetHasNewLayout(YGNodeConstRef node);

void YGNodeSetHasNewLayout(YGNodeRef node, bool hasNewLayout);
bool YGNodeIsDirty(YGNodeConstRef node);

void YGNodeMarkDirty(YGNodeRef node);

typedef void (*YGDirtiedFunc)(YGNodeConstRef node);

void YGNodeSetDirtiedFunc(YGNodeRef node, YGDirtiedFunc dirtiedFunc);

YGDirtiedFunc YGNodeGetDirtiedFunc(YGNodeConstRef node);

void YGNodeInsertChild(YGNodeRef node, YGNodeRef child, size_t index);

void YGNodeSwapChild(YGNodeRef node, YGNodeRef child, size_t index);

void YGNodeRemoveChild(YGNodeRef node, YGNodeRef child);

void YGNodeRemoveAllChildren(YGNodeRef node);

void YGNodeSetChildren(
    YGNodeRef owner,
    const YGNodeRef *children,
    size_t count);

YGNodeRef YGNodeGetChild(YGNodeRef node, size_t index);

size_t YGNodeGetChildCount(YGNodeConstRef node);

YGNodeRef YGNodeGetOwner(YGNodeRef node);

YGNodeRef YGNodeGetParent(YGNodeRef node);

void YGNodeSetConfig(YGNodeRef node, YGConfigRef config);

YGConfigConstRef YGNodeGetConfig(YGNodeRef node);

void YGNodeSetContext(YGNodeRef node, void *context);

void *YGNodeGetContext(YGNodeConstRef node);

typedef struct YGSize
{
    float width;
    float height;
} YGSize;
typedef YGSize (*YGMeasureFunc)(
    YGNodeConstRef node,
    float width,
    YGMeasureMode widthMode,
    float height,
    YGMeasureMode heightMode);

void YGNodeSetMeasureFunc(YGNodeRef node, YGMeasureFunc measureFunc);
bool YGNodeHasMeasureFunc(YGNodeConstRef node);

typedef float (*YGBaselineFunc)(YGNodeConstRef node, float width, float height);

void YGNodeSetBaselineFunc(YGNodeRef node, YGBaselineFunc baselineFunc);
bool YGNodeHasBaselineFunc(YGNodeConstRef node);

void YGNodeSetIsReferenceBaseline(
    YGNodeRef node,
    bool isReferenceBaseline);
bool YGNodeIsReferenceBaseline(YGNodeConstRef node);

void YGNodeSetNodeType(YGNodeRef node, YGNodeType nodeType);

YGNodeType YGNodeGetNodeType(YGNodeConstRef node);

void YGNodeSetAlwaysFormsContainingBlock(
    YGNodeRef node, bool alwaysFormsContainingBlock);
bool YGNodeGetAlwaysFormsContainingBlock(YGNodeConstRef node);
bool YGNodeCanUseCachedMeasurement(
    YGMeasureMode widthMode,
    float availableWidth,
    YGMeasureMode heightMode,
    float availableHeight,
    YGMeasureMode lastWidthMode,
    float lastAvailableWidth,
    YGMeasureMode lastHeightMode,
    float lastAvailableHeight,
    float lastComputedWidth,
    float lastComputedHeight,
    float marginRow,
    float marginColumn,
    YGConfigRef config);

float YGNodeLayoutGetLeft(YGNodeConstRef node);
float YGNodeLayoutGetTop(YGNodeConstRef node);
float YGNodeLayoutGetRight(YGNodeConstRef node);
float YGNodeLayoutGetBottom(YGNodeConstRef node);
float YGNodeLayoutGetWidth(YGNodeConstRef node);
float YGNodeLayoutGetHeight(YGNodeConstRef node);
YGDirection YGNodeLayoutGetDirection(YGNodeConstRef node);
bool YGNodeLayoutGetHadOverflow(YGNodeConstRef node);

float YGNodeLayoutGetMargin(YGNodeConstRef node, YGEdge edge);
float YGNodeLayoutGetBorder(YGNodeConstRef node, YGEdge edge);
float YGNodeLayoutGetPadding(YGNodeConstRef node, YGEdge edge);

float YGNodeLayoutGetRawHeight(YGNodeConstRef node);

float YGNodeLayoutGetRawWidth(YGNodeConstRef node);

typedef struct YGValue
{
    float value;
    YGUnit unit;
} YGValue;

extern const YGValue YGValueAuto;

extern const YGValue YGValueUndefined;

extern const YGValue YGValueZero;
bool YGFloatIsUndefined(float value);

void YGNodeCopyStyle(YGNodeRef dstNode, YGNodeConstRef srcNode);

void YGNodeStyleSetDirection(YGNodeRef node, YGDirection direction);
YGDirection YGNodeStyleGetDirection(YGNodeConstRef node);

void YGNodeStyleSetFlexDirection(YGNodeRef node, YGFlexDirection flexDirection);
YGFlexDirection YGNodeStyleGetFlexDirection(YGNodeConstRef node);

void YGNodeStyleSetJustifyContent(YGNodeRef node, YGJustify justifyContent);
YGJustify YGNodeStyleGetJustifyContent(YGNodeConstRef node);

void YGNodeStyleSetAlignContent(YGNodeRef node, YGAlign alignContent);
YGAlign YGNodeStyleGetAlignContent(YGNodeConstRef node);

void YGNodeStyleSetAlignItems(YGNodeRef node, YGAlign alignItems);
YGAlign YGNodeStyleGetAlignItems(YGNodeConstRef node);

void YGNodeStyleSetAlignSelf(YGNodeRef node, YGAlign alignSelf);
YGAlign YGNodeStyleGetAlignSelf(YGNodeConstRef node);

void YGNodeStyleSetPositionType(YGNodeRef node, YGPositionType positionType);
YGPositionType YGNodeStyleGetPositionType(YGNodeConstRef node);

void YGNodeStyleSetFlexWrap(YGNodeRef node, YGWrap flexWrap);
YGWrap YGNodeStyleGetFlexWrap(YGNodeConstRef node);

void YGNodeStyleSetOverflow(YGNodeRef node, YGOverflow overflow);
YGOverflow YGNodeStyleGetOverflow(YGNodeConstRef node);

void YGNodeStyleSetDisplay(YGNodeRef node, YGDisplay display);
YGDisplay YGNodeStyleGetDisplay(YGNodeConstRef node);

void YGNodeStyleSetFlex(YGNodeRef node, float flex);
float YGNodeStyleGetFlex(YGNodeConstRef node);

void YGNodeStyleSetFlexGrow(YGNodeRef node, float flexGrow);
float YGNodeStyleGetFlexGrow(YGNodeConstRef node);

void YGNodeStyleSetFlexShrink(YGNodeRef node, float flexShrink);
float YGNodeStyleGetFlexShrink(YGNodeConstRef node);

void YGNodeStyleSetFlexBasis(YGNodeRef node, float flexBasis);
void YGNodeStyleSetFlexBasisPercent(YGNodeRef node, float flexBasis);
void YGNodeStyleSetFlexBasisAuto(YGNodeRef node);
void YGNodeStyleSetFlexBasisMaxContent(YGNodeRef node);
void YGNodeStyleSetFlexBasisFitContent(YGNodeRef node);
void YGNodeStyleSetFlexBasisStretch(YGNodeRef node);
YGValue YGNodeStyleGetFlexBasis(YGNodeConstRef node);

void YGNodeStyleSetPosition(YGNodeRef node, YGEdge edge, float position);
void YGNodeStyleSetPositionPercent(YGNodeRef node, YGEdge edge, float position);
YGValue YGNodeStyleGetPosition(YGNodeConstRef node, YGEdge edge);
void YGNodeStyleSetPositionAuto(YGNodeRef node, YGEdge edge);

void YGNodeStyleSetMargin(YGNodeRef node, YGEdge edge, float margin);
void YGNodeStyleSetMarginPercent(YGNodeRef node, YGEdge edge, float margin);
void YGNodeStyleSetMarginAuto(YGNodeRef node, YGEdge edge);
YGValue YGNodeStyleGetMargin(YGNodeConstRef node, YGEdge edge);

void YGNodeStyleSetPadding(YGNodeRef node, YGEdge edge, float padding);
void YGNodeStyleSetPaddingPercent(YGNodeRef node, YGEdge edge, float padding);
YGValue YGNodeStyleGetPadding(YGNodeConstRef node, YGEdge edge);

void YGNodeStyleSetBorder(YGNodeRef node, YGEdge edge, float border);
float YGNodeStyleGetBorder(YGNodeConstRef node, YGEdge edge);

void YGNodeStyleSetGap(YGNodeRef node, YGGutter gutter, float gapLength);
void YGNodeStyleSetGapPercent(YGNodeRef node, YGGutter gutter, float gapLength);
YGValue YGNodeStyleGetGap(YGNodeConstRef node, YGGutter gutter);

void YGNodeStyleSetBoxSizing(YGNodeRef node, YGBoxSizing boxSizing);
YGBoxSizing YGNodeStyleGetBoxSizing(YGNodeConstRef node);

void YGNodeStyleSetWidth(YGNodeRef node, float width);
void YGNodeStyleSetWidthPercent(YGNodeRef node, float width);
void YGNodeStyleSetWidthAuto(YGNodeRef node);
void YGNodeStyleSetWidthMaxContent(YGNodeRef node);
void YGNodeStyleSetWidthFitContent(YGNodeRef node);
void YGNodeStyleSetWidthStretch(YGNodeRef node);
YGValue YGNodeStyleGetWidth(YGNodeConstRef node);

void YGNodeStyleSetHeight(YGNodeRef node, float height);
void YGNodeStyleSetHeightPercent(YGNodeRef node, float height);
void YGNodeStyleSetHeightAuto(YGNodeRef node);
void YGNodeStyleSetHeightMaxContent(YGNodeRef node);
void YGNodeStyleSetHeightFitContent(YGNodeRef node);
void YGNodeStyleSetHeightStretch(YGNodeRef node);
YGValue YGNodeStyleGetHeight(YGNodeConstRef node);

void YGNodeStyleSetMinWidth(YGNodeRef node, float minWidth);
void YGNodeStyleSetMinWidthPercent(YGNodeRef node, float minWidth);
void YGNodeStyleSetMinWidthMaxContent(YGNodeRef node);
void YGNodeStyleSetMinWidthFitContent(YGNodeRef node);
void YGNodeStyleSetMinWidthStretch(YGNodeRef node);
YGValue YGNodeStyleGetMinWidth(YGNodeConstRef node);

void YGNodeStyleSetMinHeight(YGNodeRef node, float minHeight);
void YGNodeStyleSetMinHeightPercent(YGNodeRef node, float minHeight);
void YGNodeStyleSetMinHeightMaxContent(YGNodeRef node);
void YGNodeStyleSetMinHeightFitContent(YGNodeRef node);
void YGNodeStyleSetMinHeightStretch(YGNodeRef node);
YGValue YGNodeStyleGetMinHeight(YGNodeConstRef node);

void YGNodeStyleSetMaxWidth(YGNodeRef node, float maxWidth);
void YGNodeStyleSetMaxWidthPercent(YGNodeRef node, float maxWidth);
void YGNodeStyleSetMaxWidthMaxContent(YGNodeRef node);
void YGNodeStyleSetMaxWidthFitContent(YGNodeRef node);
void YGNodeStyleSetMaxWidthStretch(YGNodeRef node);
YGValue YGNodeStyleGetMaxWidth(YGNodeConstRef node);

void YGNodeStyleSetMaxHeight(YGNodeRef node, float maxHeight);
void YGNodeStyleSetMaxHeightPercent(YGNodeRef node, float maxHeight);
void YGNodeStyleSetMaxHeightMaxContent(YGNodeRef node);
void YGNodeStyleSetMaxHeightFitContent(YGNodeRef node);
void YGNodeStyleSetMaxHeightStretch(YGNodeRef node);
YGValue YGNodeStyleGetMaxHeight(YGNodeConstRef node);

void YGNodeStyleSetAspectRatio(YGNodeRef node, float aspectRatio);
float YGNodeStyleGetAspectRatio(YGNodeConstRef node);

float YGRoundValueToPixelGrid(
    double value,
    double pointScaleFactor, bool forceCeil, bool forceFloor);
