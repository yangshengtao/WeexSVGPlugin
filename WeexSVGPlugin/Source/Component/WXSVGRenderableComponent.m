//
//  WXSVGRenderableComponent.m
//  Pods
//
//  Created by yangshengtao on 17/2/16.
//
//

#import "WXSVGRenderableComponent.h"
#import "WXConvert+WXSVG.h"

@implementation WXSVGRenderableComponent

#pragma mark -
#pragma mark - override methods
- (instancetype)initWithRef:(NSString *)ref
                       type:(NSString*)type
                     styles:(nullable NSDictionary *)styles
                 attributes:(nullable NSDictionary *)attributes
                     events:(nullable NSArray *)events
               weexInstance:(WXSDKInstance *)weexInstance
{
    self = [super initWithRef:ref type:type styles:styles attributes:attributes events:events weexInstance:weexInstance];
    if (self) {
        //_strokeWidth = [attributes[@"strokeWidth"] floatValue];
        //_stroke = [WXConvert WXSVGCGColor:self.attributes[@"stroke"]];
        //_fill = [WXConvert WXSVGCGColor:self.attributes[@"fill"]];
        //_strokeOpacity = [attributes[@"strokeOpacity"] floatValue];
    }
    
    return self;
}

#pragma mark -
#pragma mark - public methods
- (WXSVGRenderable *)node
{
    WXSVGRenderable *renderableView = [WXSVGRenderable new];
    [self syncViewAttributes:renderableView];
    return renderableView;
}

- (void)syncViewAttributes:(WXSVGNode *)view
{
    WXSVGRenderable *renderableView = (WXSVGRenderable *)view;
    if (self.attributes[@"strokeWidth"]) {
        renderableView.strokeWidth = [self.attributes[@"strokeWidth"] floatValue];
    }
    if (self.attributes[@"stroke"]) {
        //NSArray *rbga = [WXConvert colorWithHex:[_attributes[@"stroke"] integerValue]];
        //renderableView.stroke = [WXConvert WXSVGBrush:rbga];
        renderableView.stroke = [WXConvert WXSVGCGColor:self.attributes[@"stroke"]];
    }
    if (self.attributes[@"fill"]) {
        //NSArray *rbga = [WXConvert colorWithHex:[_attributes[@"stroke"] integerValue]];
        //renderableView.fill = [WXConvert WXSVGBrush:rbga];
        renderableView.fill = [WXConvert WXSVGCGColor:self.attributes[@"fill"]];
    }
    renderableView.strokeMiterlimit = 4;
    [super syncViewAttributes:view];

}

@end
