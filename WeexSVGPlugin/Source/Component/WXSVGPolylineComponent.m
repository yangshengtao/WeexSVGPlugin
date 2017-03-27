//
//  WXSVGPolylineComponent.m
//  WeexSVGPlugin
//
//  Created by yangshengtao on 2017/3/24.
//  Copyright © 2017年 Taobao. All rights reserved.
//

#import "WXSVGPolylineComponent.h"
#import "WXSVGPolyline.h"

@implementation WXSVGPolylineComponent
@synthesize points = _points;

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
        
    }
    
    return self;
}

#pragma mark -
#pragma mark -
- (WXSVGRenderable *)node
{
    WXSVGPolyline *polylineView = [WXSVGPolyline new];
    [self formatterPointStr:self.attributes[@"points"]];
    polylineView.points = _points;
    [self syncViewAttributes:polylineView];
    return polylineView;
}

- (void)formatterPointStr:(NSString *)pointStr
{
    NSArray *tmpArr = [pointStr componentsSeparatedByString:@" "];
    NSUInteger count = tmpArr.count;
    NSMutableArray *points = [[NSMutableArray alloc] initWithCapacity:tmpArr.count];
    for (int idx = 0; idx < tmpArr.count; idx++) {
        NSArray *pointArr = [tmpArr[idx] componentsSeparatedByString:@","];
        CGPoint point = [WXConvert CGPoint:pointArr withScale:self.weexInstance.pixelScaleFactor];
        [points addObject:@[@(point.x),@(point.y)]];
    }
    _points = [NSArray arrayWithArray:points];
}

@end
