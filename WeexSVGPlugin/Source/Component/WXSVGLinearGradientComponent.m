//
//  WXSVGLinearGradientComponent.m
//  WeexSVGPlugin
//
//  Created by yangshengtao on 2017/3/22.
//  Copyright © 2017年 Taobao. All rights reserved.
//

#import "WXSVGLinearGradientComponent.h"
#import "WXSVGLinearGradient.h"

@implementation WXSVGLinearGradientComponent
{
    NSString *_x1;
    NSString *_y1;
    NSString *_x2;
    NSString *_y2;
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
        _x1 = attributes[@"x1"];
        _x2 = attributes[@"x2"];
        _y1 = attributes[@"y1"];
        _y2 = attributes[@"y2"];
        _gradient = [attributes wxmap_safeObjectForKey:@"gradient"];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    WXSVGLinearGradient *linearView = (WXSVGLinearGradient *)self.view;
    linearView.x1 = _x1;
    linearView.y1 = _y1;
    linearView.x2 = _x2;
    linearView.y2 = _y2;
    linearView.gradient = _gradient;
}

- (WXSVGNode *)node
{
    return [WXSVGLinearGradient new];
}

@end
