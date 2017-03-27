//
//  WXSVGStop.m
//  WeexSVGPlugin
//
//  Created by yangshengtao on 2017/3/27.
//  Copyright © 2017年 Taobao. All rights reserved.
//

#import "WXSVGStop.h"
#import "WXSVGLinearGradient.h"

@implementation WXSVGStop

- (void)setOffet:(NSString *)offet
{
    if (_offet == offet) {
        return;
    }
    [self invalidate];
    _offet = offet;
}

- (void)setStopColor:(NSString *)stopColor
{
    if (_stopColor == stopColor) {
        return;
    }
    [self invalidate];
    _stopColor = stopColor;
    WXSVGNode *linearGradient = (WXSVGNode *)self.superview;
    [linearGradient addGradientStopColor:stopColor];
}

- (void)setStopOpacity:(CGFloat)stopOpacity
{
    if (_stopOpacity == stopOpacity) {
        return;
    }
    [self invalidate];
    _stopOpacity = stopOpacity;
}

@end
