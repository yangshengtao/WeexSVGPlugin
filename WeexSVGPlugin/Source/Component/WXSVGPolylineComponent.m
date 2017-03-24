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
    WXSVGPolyline *polylineView = [WXSVGPolyline new];
    polylineView.points = _points;
    [self syncViewAttributes:polylineView];
    return polylineView;
}

@end
