//
//  WXSVGBrush.m
//  Pods
//
//  Created by yangshengtao on 17/2/16.
//
//

#import "WXSVGBrush.h"

@implementation WXSVGBrush

- (instancetype)initWithArray:(NSArray *)data
{
    return [super init];
}

- (instancetype)initWithColor:(id)value
{
    return [super init];
}

- (BOOL)applyFillColor:(CGContextRef)context opacity:(CGFloat)opacity
{
    return NO;
}

- (BOOL)applyStrokeColor:(CGContextRef)context opacity:(CGFloat)opacity
{
    return NO;
}

- (void)paint:(CGContextRef)context opacity:(CGFloat)opacity brushConverter:(WXSVGBrushConverter *)brushConverter
{
    // abstract
}

@end
