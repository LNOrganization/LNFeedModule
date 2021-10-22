//
//  LNFeedModelConfig.m
//  LNFeed
//
//  Created by Lenny on 2021/10/22.
//

#import "LNFeedModelConfig.h"

@implementation LNFeedModelConfig

+ (id<LNFeedMediatorDelegate>)mediator
{
    static id<LNFeedMediatorDelegate> obj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [[NSClassFromString(@"LNFeedMediator") alloc] init];
    });
     
    return obj;
}

@end
