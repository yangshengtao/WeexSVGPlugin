//
//  WXSVGNode.m
//  Pods
//
//  Created by yangshengtao on 17/2/16.
//
//

#import "WXSVGNode.h"
#import "WXSVGContainer.h"

@implementation WXSVGNode
{
    BOOL _transparent;
    CGPathRef _cachedClipPath;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.opacity = 1;
    }
    return self;
}

- (void)invalidate
{
    id<WXSVGContainer> container = (id<WXSVGContainer>)self.superview;
    [container invalidate];
}


#pragma mark -
#pragma mark - public methods
- (void)beginTransparencyLayer:(CGContextRef)context
{
    if (_transparent) {
        CGContextBeginTransparencyLayer(context, NULL);
    }
}

- (void)endTransparencyLayer:(CGContextRef)context
{
    if (_transparent) {
        CGContextEndTransparencyLayer(context);
    }
}

- (void)renderTo:(CGContextRef)context
{
    // abstract
}

- (CGPathRef)getClipPath
{
    return _cachedClipPath;
}

- (CGPathRef)getClipPath:(CGContextRef)context
{
    if (self.clipPath && !_cachedClipPath) {
        CGPathRelease(_cachedClipPath);
        _cachedClipPath = CGPathRetain([[[self getSvgView] getDefinedClipPath:self.clipPath] getPath:context]);
    }
    
    return [self getClipPath];
}

- (void)clip:(CGContextRef)context
{
    CGPathRef clipPath = [self getClipPath:context];
    
    if (clipPath) {
        CGContextAddPath(context, clipPath);
        if (self.clipRule == kWXSVGCGFCRuleEvenodd) {
            CGContextEOClip(context);
        } else {
            CGContextClip(context);
        }
    }
}

- (CGPathRef)getPath: (CGContextRef) context
{
    // abstract
    return nil;
}

- (void)renderLayerTo:(CGContextRef)context
{
    // abstract
}

- (WXSVGSvgView *)getSvgView
{
    UIView *parent = self.superview;
    while (parent && [parent class] != [WXSVGSvgView class]) {
        parent = parent.superview;
    }
    
    return (WXSVGSvgView *)parent;
}

- (void)saveDefinition
{
    if (self.name) {
        WXSVGSvgView* svg = [self getSvgView];
        [svg defineTemplate:self templateRef:self.name];
    }
}

- (void)mergeProperties:(__kindof WXSVGNode *)target mergeList:(NSArray<NSString *> *)mergeList
{
    // abstract
}

- (void)mergeProperties:(__kindof WXSVGNode *)target mergeList:(NSArray<NSString *> *)mergeList inherited:(BOOL)inherited
{
    // abstract
}

- (void)traverseSubviews:(BOOL (^)(WXSVGNode *node))block
{
    for (WXSVGNode *node in self.subviews) {
        if ([node isKindOfClass:[WXSVGNode class]]) {
            if (!block(node)) {
                break;
            }
        }
    }
}

- (void)resetProperties
{
    // abstract
}

- (void)dealloc
{
    CGPathRelease(_cachedClipPath);
}

#pragma mark - hitTest delagate
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    
    // abstract
    return nil;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event withTransform:(CGAffineTransform)transfrom
{
    // abstract
    return nil;
}

#pragma mark -
#pragma mark - setPros
- (void)setOpacity:(CGFloat)opacity
{
    if (opacity == _opacity) {
        return;
    }
    
    if (opacity < 0) {
        opacity = 0;
    } else if (opacity > 1) {
        opacity = 1;
    }
    
    [self invalidate];
    _transparent = opacity < 1;
    _opacity = opacity;
}

- (void)setMatrix:(CGAffineTransform)matrix
{
    if (CGAffineTransformEqualToTransform(matrix, _matrix)) {
        return;
    }
    [self invalidate];
    _matrix = matrix;
}

- (void)setClipPath:(NSString *)clipPath
{
    if (_clipPath == clipPath) {
        return;
    }
    CGPathRelease(_cachedClipPath);
    _cachedClipPath = nil;
    _clipPath = clipPath;
    [self invalidate];
}



@end
