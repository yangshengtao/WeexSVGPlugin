//
//  WXSVGLineComponent.m
//  Pods
//
//  Created by yangshengtao on 17/2/17.
//
//

#import "WXSVGLineComponent.h"
#import "WXSVGLine.h"
#import "WXConvert+WXSVG.h"

@implementation WXSVGLineComponent
{
    NSString *_x1;
    NSString *_y1;
    NSString *_x2;
    NSString *_y2;
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
    }
    
    return self;
}


#pragma mark -
#pragma mark -
- (WXSVGRenderable *)node
{
    WXSVGLine *lineView = [WXSVGLine new];
    lineView.x1 = _x1;
    lineView.y1 = _y1;
    lineView.x2 = _x2;
    lineView.y2 = _y2;
    [self syncViewAttributes:lineView];
    return lineView;
}

@end
