//
//  WXSVGStopComponent.m
//  WeexSVGPlugin
//
//  Created by yangshengtao on 2017/3/24.
//  Copyright © 2017年 Taobao. All rights reserved.
//

#import "WXSVGStopComponent.h"
#import "WXSVGStop.h"


@implementation WXSVGStopComponent

- (instancetype)initWithRef:(NSString *)ref
                       type:(NSString*)type
                     styles:(nullable NSDictionary *)styles
                 attributes:(nullable NSDictionary *)attributes
                     events:(nullable NSArray *)events
               weexInstance:(WXSDKInstance *)weexInstance
{
    self = [super initWithRef:ref type:type styles:styles attributes:attributes events:events weexInstance:weexInstance];
    if (self) {
        //_strokeWidth = [attributes[@"strokeWidth"] floatValue];
        _stopColor = attributes[@"stopColor"];
        _offet = attributes[@"offset"];
        _stopOpacity = [attributes[@"stopOpacity"] floatValue];
    }
    
    return self;
}

- (WXSVGNode *)node
{
    /*WXSVGStop *stopView = [WXSVGStop new];
    stopView.stopColor = _stopColor;
    stopView.stopOpacity = _stopOpacity;
    stopView.offet = _offet;
    return stopView;*/
    return [WXSVGStop new];
}

- (void)viewDidLoad
{
    WXSVGStop *stopView = (WXSVGStop *)self.view;
    WXSVGNodeComponent *component = (WXSVGNodeComponent *)self.supercomponent;
    WXSVGNode *linearGradient = (WXSVGNode *)[component node];
    [linearGradient addGradientStopColor:_stopColor];
    //stopView.stopColor = _stopColor;
    //stopView.stopOpacity = _stopOpacity;
    //stopView.offet = _offet;
}

@end
