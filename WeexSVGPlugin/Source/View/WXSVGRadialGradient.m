//
//  WXSVGRadialGradient.m
//  WeexSVGPlugin
//
//  Created by yangshengtao on 2017/3/22.
//  Copyright © 2017年 Taobao. All rights reserved.
//

#import "WXSVGRadialGradient.h"

@implementation WXSVGRadialGradient

- (void)setGradient:(NSArray<NSNumber *> *)gradient
{
    if (gradient == _gradient) {
        return;
    }
    
    _gradient = gradient;
    [self invalidate];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    return nil;
}

- (void)saveDefinition
{
    WXSVGBrushConverter *converter = [[WXSVGBrushConverter alloc] init];
    converter.colors = self.gradient;
    converter.points = @[self.fx, self.fy, self.rx, self.ry, self.cx, self.cy];
    converter.type = kWXSVGRadialGradient;
    [[self getSvgView] defineBrushConverter:converter brushConverterRef:self.name];
}

@end
