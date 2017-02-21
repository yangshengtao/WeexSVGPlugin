//
//  WXSVGRenderableComponent.m
//  Pods
//
//  Created by yangshengtao on 17/2/16.
//
//

#import "WXSVGRenderableComponent.h"

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
        _strokeWidth = [attributes[@"strokeWidth"] floatValue];
        if (!_attributes) {
            _attributes = [NSDictionary dictionaryWithDictionary:attributes];
        }
    }
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
