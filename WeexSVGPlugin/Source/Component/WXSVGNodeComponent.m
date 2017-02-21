//
//  WXSVGNodeComponent.m
//  Pods
//
//  Created by yangshengtao on 17/2/16.
//
//

#import "WXSVGNodeComponent.h"

@implementation WXSVGNodeComponent

@synthesize name = _name;
@synthesize opacity = _opacity;
@synthesize matrix = _matrix;
@synthesize clipPath = _clipPath;
@synthesize responsible = _responsible;

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

- (UIView *) loadView
{
    return [self node];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    WXSVGNode *SVGView = (WXSVGNode *)self.view;
    SVGView.matrix = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
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
- (WXSVGNode *)node
{
    return [WXSVGNode new];
}

@end
