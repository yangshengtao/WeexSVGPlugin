//
//  WXSVGCircle.h
//  Pods
//
//  Created by yangshengtao on 17/2/21.
//
//

#import <WeexSDK/WeexSDK.h>
#import "WXSVGRenderable.h"

@interface WXSVGCircle : WXSVGRenderable

@property (nonatomic, strong) NSString* cx;
@property (nonatomic, strong) NSString* cy;
@property (nonatomic, strong) NSString* r;

@end
