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
    return [WXSVGCircle new];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    WXSVGCircle *circleView = (WXSVGCircle *)self.view;
    circleView.cx = _cx;
    circleView.cy = _cy;
    circleView.r = _r;
}

@end
