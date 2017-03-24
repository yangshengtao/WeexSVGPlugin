//
//  WXSVGPolygon.m
//  WeexSVGPlugin
//
//  Created by yangshengtao on 2017/3/24.
//  Copyright © 2017年 Taobao. All rights reserved.
//

#import "WXSVGPolygon.h"
#import "WXConvert+WXSVG.h"

@implementation WXSVGPolygon

- (CGPathRef)getPath:(CGContextRef)context
{
    [self setBoundingBox:CGContextGetClipBoundingBox(context)];
    CGMutablePathRef path = CGPathCreateMutable();
    
    if (!self.points || (self.points.count <= 0)) {
        return nil;
    }
    NSMutableArray *polygonArr = [NSMutableArray arrayWithArray:self.points];
    if (![self.points.lastObject isEqualToString:self.points.firstObject]) {
        [polygonArr addObject:self.points.firstObject];
    }
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
