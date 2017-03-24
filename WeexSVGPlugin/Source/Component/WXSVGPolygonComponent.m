//
//  WXSVGPolygonComponent.m
//  WeexSVGPlugin
//
//  Created by yangshengtao on 2017/3/24.
//  Copyright © 2017年 Taobao. All rights reserved.
//

#import "WXSVGPolygonComponent.h"
#import "WXSVGPolygon.h"

@implementation WXSVGPolygonComponent
{
    NSArray *_points;
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
        NSString *pointSrt = attributes[@"points"];
        if (pointSrt) {
            _points = [pointSrt componentsSeparatedByString:@" "];
        }
    }
    
    return self;
}

#pragma mark -
#pragma mark -
- (WXSVGRenderable *)node
{
    WXSVGPolygon *polygonView = [WXSVGPolygon new];
    polygonView.points = _points;
    [self syncViewAttributes:polygonView];
    return polygonView;
}
@end
