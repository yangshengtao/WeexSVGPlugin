//
//  WXSVGEllipseComponent.m
//  Pods
//
//  Created by yangshengtao on 17/2/21.
//
//

#import "WXSVGEllipseComponent.h"
#import "WXSVGEllipse.h"

@implementation WXSVGEllipseComponent
{
    NSString *_cx;
    NSString *_cy;
    NSString *_rx;
    NSString *_ry;
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
        _rx = attributes[@"rx"];
        _ry = attributes[@"ry"];
    }
    
    return self;
}

- (WXSVGEllipse *)node
{
    WXSVGEllipse *ellipseView = [WXSVGEllipse new];
    ellipseView.cx = [WXConvert WXPixelType:_cx scaleFactor:self.weexInstance.pixelScaleFactor];;
    ellipseView.cy = [WXConvert WXPixelType:_cy scaleFactor:self.weexInstance.pixelScaleFactor];;
    ellipseView.rx = [WXConvert WXPixelType:_rx scaleFactor:self.weexInstance.pixelScaleFactor];;
    ellipseView.ry = [WXConvert WXPixelType:_ry scaleFactor:self.weexInstance.pixelScaleFactor];;
    [self syncViewAttributes:ellipseView];
    return ellipseView;
}



@end
