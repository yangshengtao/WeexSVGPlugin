//
//  WXSVGPathComponent.m
//  Pods
//
//  Created by yangshengtao on 17/2/22.
//
//

#import "WXSVGPathComponent.h"
#import "WXSVGPath.h"
#import "WXConvert+WXSVG.h"

@implementation WXSVGPathComponent
{
    NSString *_d;
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
        _d = attributes[@"d"];
    }
    
    return self;
}

- (WXSVGPath *)node
{
    WXSVGPath *pathView = [WXSVGPath new];
    pathView.d = [WXConvert CGPath:_d];
    [self syncViewAttributes:pathView];
    return pathView;
}


@end
