//
//  WXSVGCircleComponent.m
//  Pods
//
//  Created by yangshengtao on 17/2/21.
//
//

#import "WXSVGCircleComponent.h"
#import "WXSVGCircle.h"

@implementation WXSVGCircleComponent
{
    NSString *_cx;
    NSString *_cy;
    NSString *_r;
}

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
        _cx = attributes[@"cx"];
        _cy = attributes[@"cy"];
        _r = attributes[@"r"];
    }
    
    return self;
}

- (WXSVGCircle *)node
{
    WXSVGCircle *circleView = [WXSVGCircle new];
    circleView.cx = [WXConvert WXPixelType:_cx scaleFactor:self.weexInstance.pixelScaleFactor];
    circleView.cy = [WXConvert WXPixelType:_cy scaleFactor:self.weexInstance.pixelScaleFactor];
    CGFloat r = [WXConvert WXPixelType:_r scaleFactor:self.weexInstance.pixelScaleFactor];
    circleView.r = [NSString stringWithFormat:@"%f",r];
    
    [self syncViewAttributes:circleView];
    return circleView;
}

@end
