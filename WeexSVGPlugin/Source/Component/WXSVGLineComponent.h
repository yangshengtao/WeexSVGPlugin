//
//  WXSVGLineComponent.h
//  Pods
//
//  Created by yangshengtao on 17/2/17.
//
//

#import <WeexSDK/WeexSDK.h>
#import "WXSVGRenderableComponent.h"

@interface WXSVGLineComponent : WXSVGRenderableComponent

@property (nonatomic, copy) NSString *x1;
@property (nonatomic, copy) NSString *y1;
@property (nonatomic, copy) NSString *x2;
@property (nonatomic, copy) NSString *y2;

@end
