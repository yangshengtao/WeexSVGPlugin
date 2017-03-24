//
//  WXSVGPolyline.m
//  WeexSVGPlugin
//
//  Created by yangshengtao on 2017/3/24.
//  Copyright © 2017年 Taobao. All rights reserved.
//

#import "WXSVGPolyline.h"
#import "WXConvert+WXSVG.h"

@implementation WXSVGPolyline

- (void)setPoints:(NSArray *)points
{
    if (points == _points) {
        return;
    }
    _points = points;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    return nil;
}

- (CGPathRef)getPath:(CGContextRef)context
{
    [self setBoundingBox:CGContextGetClipBoundingBox(context)];
    CGMutablePathRef path = CGPathCreateMutable();
    
    if (!_points || (_points.count <= 0)) {
        return nil;
    }
    NSMutableArray *polygonArr = [NSMutableArray arrayWithArray:_points];
    for (int idx = 0; idx < polygonArr.count; idx++) {
        NSArray *pointArr = [polygonArr[idx] componentsSeparatedByString:@","];
        CGPoint point = [WXConvert CGPoint:pointArr];
        if (idx == 0) {
            //move to the first point
            CGPathMoveToPoint(path, nil, point.x, point.y);
        }else {
            CGPathAddLineToPoint(path, nil, point.x, point.y);
        }
    }
    
    return (CGPathRef)CFAutorelease(path);
}

@end
