//
//  WXSVGRenderableComponent.m
//  Pods
//
//  Created by yangshengtao on 17/2/16.
//
//

#import "WXSVGRenderableComponent.h"
#import "WXConvert+WXSVG.h"

@implementation WXSVGRenderableComponent
@synthesize attributes = _attributes;
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
        if (!_attributes) {
            _attributes = [NSDictionary dictionaryWithDictionary:attributes];
        }
    }
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    WXSVGRenderable *renderableView = (WXSVGRenderable *)self.view;
    if (_attributes[@"strokeWidth"]) {
        renderableView.strokeWidth = [_attributes[@"strokeWidth"] floatValue];
    }
    if (_attributes[@"stroke"]) {
        renderableView.stroke = [WXConvert WXSVGBrush:@[@(0),@(0),@(0),@(0),@(1)]];
    }
    if (_attributes[@"fill"]) {
        renderableView.fill = [WXConvert WXSVGBrush:@[@(0),@(255),@(0),@(0),@(1)]];
    }
    renderableView.strokeMiterlimit = 4;
}

/*
 - (void)insertSubview:(WXComponent *)subcomponent atIndex:(NSInteger)index
 {
 [super insertSubview:subcomponent atIndex:index];
 }
 
 - (void)willRemoveSubview:(WXComponent *)component
 {
 [super willRemoveSubview:component];
 
 }

- (void)layoutDidFinish
{
    
}

- (void)viewWillUnload
{
    
}

- (void)dealloc
{
    
}

- (void)updateAttributes:(NSDictionary *)attributes
{
    
}

- (void)addEvent:(NSString *)eventName
{
    
}

- (void)removeEvent:(NSString *)eventName
{
    
}
 */

#pragma mark -
#pragma mark - public methods
- (WXSVGRenderable *)node
{
    return [WXSVGRenderable new];
}

@end
