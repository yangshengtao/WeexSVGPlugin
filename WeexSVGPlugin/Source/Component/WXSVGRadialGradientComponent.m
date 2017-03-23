//
//  WXSVGRadialGradientComponent.m
//  WeexSVGPlugin
//
//  Created by yangshengtao on 2017/3/22.
//  Copyright © 2017年 Taobao. All rights reserved.
//

#import "WXSVGRadialGradientComponent.h"
#import "WXSVGRadialGradient.h"

@implementation WXSVGRadialGradientComponent
{
    NSString *_fx;
    NSString *_fy;
    NSString *_rx;
    NSString *_ry;
    NSString *_cx;
    NSString *_cy;
    NSArray<NSNumber *> *_gradient;
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
        _fx = attributes[@"f1"];
        _fy = attributes[@"fy"];
        _rx = attributes[@"rx"];
        _ry = attributes[@"ry"];
        _cx = attributes[@"cx"];
        _cy = attributes[@"cy"];
        _gradient = [attributes wxmap_safeObjectForKey:@"gradient"];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    WXSVGRadialGradient *radialView = (WXSVGRadialGradient *)self.view;
    radialView.fx = _fx;
    radialView.fy = _fy;
    radialView.rx = _rx;
    radialView.ry = _ry;
    radialView.cx = _cx;
    radialView.cy = _cy;
    radialView.gradient = _gradient;
}

- (WXSVGRadialGradient *)node
{
    return [WXSVGRadialGradient new];
}

@end
