//
//  LNFeedModule.m
//  FBSnapshotTestCase
//
//  Created by Lenny on 2020/6/30.
//

#import "LNFeedModule.h"
#import "LNRecommendListViewController.h"
#import "LNTimeLineViewController.h"
#import "LNFeedDetailViewController.h"
#import <LNModuleProtocol/LNFeedModuleProtocol.h>

const NSString *LNFeedModuleClassName = @"LNFeedModule";

__attribute__((constructor)) void addModulLNFeedModule(void){
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[LNModuleManager sharedInstance] addImpClassName:@"LNFeedModule" protocolName:@"LNFeedModuleProtocol"];
    });
}


@interface LNFeedModule ()<LNFeedModuleProtocol>

@end

@implementation LNFeedModule


- (UIViewController *)getFeedListViewControllerWithType:(NSInteger)type
{
    LNRecommendListViewController *feedVC = [[LNRecommendListViewController alloc] init];
    return feedVC;
}

- (UIViewController *)getFeedDetailViewControllerWithFeedId:(NSString *)feedId
{
    LNFeedDetailViewController *feedVC = [[LNFeedDetailViewController alloc] init];
    return feedVC;
}

- (UIViewController *)getRecommendFeedViewController {
    LNRecommendListViewController *feedVC = [[LNRecommendListViewController alloc] init];
    return feedVC;
}


- (UIViewController *)getTimeLineFeedViewController {
    LNTimeLineViewController *feedVC = [[LNTimeLineViewController alloc] init];
    return feedVC;
}



- (void)doInitialize {
    NSLog(@"Init finish");
}

- (NSString *)version {
    return @"0.1.4";
}

@end
