//
//  LNFeedModelConfig.h
//  LNFeed
//
//  Created by Lenny on 2021/10/22.
//

#import <Foundation/Foundation.h>
#import "LNFeedMediatorDelegate.h"
#import <LNCommonKit/LNCommonKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LNFeedModelConfig : NSObject


+(id<LNFeedMediatorDelegate>)feeMediator;

+(NSBundle *)feedBundle;

@end

NS_ASSUME_NONNULL_END
