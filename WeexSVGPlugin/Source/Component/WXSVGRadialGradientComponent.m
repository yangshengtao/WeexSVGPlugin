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
    NSString *_name;
    NSString *_fx;
    NSString *_fy;
    NSString *_rx;
    NSString *_ry;
    NSString *_cx;
    NSString *_cy;
    
    WXSVGRadialGradient *_radialView;
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
        _name = attributes[@"id"];
        _fx = attributes[@"fx"];
        _fy = attributes[@"fy"];
        _rx = attributes[@"r"];
        _ry = attributes[@"r"];
        _cx = attributes[@"cx"];
        _cy = attributes[@"cy"];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    WXSVGRadialGradient *radialView = (WXSVGRadialGradient *)self.view;
    _radialView.name = _name;
    radialView.fx = _fx;
    radialView.fy = _fy;
    radialView.rx = _rx;
    radialView.ry = _ry;
    radialView.cx = _cx;
    radialView.cy = _cy;
}

- (WXSVGRadialGradient *)node
{
    if (!_radialView) {
         _radialView = [WXSVGRadialGradient new];
        _radialView.fx = [self formatterPoint:_fx];
        _radialView.fy = [self formatterPoint:_fy];
        _radialView.rx = [self formatterPoint:_rx];
        _radialView.ry = [self formatterPoint:_ry];
        _radialView.cx = [self formatterPoint:_cx];
        _radialView.cy = [self formatterPoint:_cy];
        [self syncViewAttributes:_radialView];
    }
    return _radialView;
}

@end
