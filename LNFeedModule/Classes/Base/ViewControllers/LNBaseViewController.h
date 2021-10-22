//
//  LNBaseViewController.h
//  LNFeed
//
//  Created by Lenny on 2021/10/21.
//

#import <UIKit/UIKit.h>
#import "LNFeedModelConfig.h"
NS_ASSUME_NONNULL_BEGIN

@interface LNBaseViewController : UIViewController

@property(nonatomic, strong, readonly) id<LNFeedMediatorDelegate> mediator;

- (void)setUpWithParams:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
