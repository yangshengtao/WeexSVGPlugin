//
//  WXSVGRectComponent.m
//  Pods
//
//  Created by yangshengtao on 17/2/21.
//
//

#import "WXSVGRectComponent.h"
#import "WXSVGRect.h"

@implementation WXSVGRectComponent
{
    NSString *_x;
    NSString *_y;
    NSString *_width;
    NSString *_height;
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
        _x = attributes[@"x"];
        _y = attributes[@"y"];
        _width = attributes[@"width"];
        _height = attributes[@"height"];
        _rx = attributes[@"rx"];
        _ry = attributes[@"ry"];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    WXSVGRect *rectView = (WXSVGRect *)self.view;
    rectView.x = _x;
    rectView.y = _y;
    rectView.width = _width;
    rectView.height = _height;
    rectView.rx = _rx;
    rectView.ry = _ry;
}

- (WXSVGRect *)node
{
    return [WXSVGRect new];
}

@end
