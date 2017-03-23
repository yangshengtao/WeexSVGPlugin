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
@synthesize attributes = _attributes;
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
        if (!_attributes) {
            _attributes = [NSDictionary dictionaryWithDictionary:attributes];
        }
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

- (void)syncViewAttributes:(WXSVGRenderable *)view
{
    if (_attributes[@"strokeWidth"]) {
        view.strokeWidth = [_attributes[@"strokeWidth"] floatValue];
    }
    if (_attributes[@"stroke"]) {
        //NSArray *rbga = [WXConvert colorWithHex:[_attributes[@"stroke"] integerValue]];
        //renderableView.stroke = [WXConvert WXSVGBrush:rbga];
        view.stroke = [WXConvert WXSVGCGColor:_attributes[@"stroke"]];
    }
    if (_attributes[@"fill"]) {
        //NSArray *rbga = [WXConvert colorWithHex:[_attributes[@"stroke"] integerValue]];
        //renderableView.fill = [WXConvert WXSVGBrush:rbga];
        view.fill = [WXConvert WXSVGCGColor:_attributes[@"fill"]];
    }
    view.strokeMiterlimit = 4;
    view.matrix = CGAffineTransformMake(1, 0, 0, 1, 0, 0);

}

@end
