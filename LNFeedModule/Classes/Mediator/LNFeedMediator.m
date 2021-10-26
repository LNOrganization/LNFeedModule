//
//  LNFeedMediator.m
//  LNFeed
//
//  Created by Lenny on 2021/10/22.
//

#import "LNFeedMediator.h"
#import <LNCommonKit/LNRouter.h>
#import "LNTopicFeedTableViewController.h"
#import "LNFeedDetailViewController.h"
#import "LNTopicTableViewController.h"
#import "LNFeedRecommendViewController.h"
#import "LNFeedTimeLineViewController.h"
#import "LNFeedDetailViewController.h"
#import "LNFeedMainViewController.h"

@interface LNFeedMediator ()

@end

@implementation LNFeedMediator


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UIViewController *)createFeedMainVC {
    LNFeedMainViewController *userVC = [[LNFeedMainViewController alloc] initWithNibName:@"LNFeedMainViewController" bundle:[LNFeedModelConfig feedBundle]];
    return userVC;
}

- (UIViewController *)createFeedRecommendVC {
    LNFeedRecommendViewController *userVC = [[LNFeedRecommendViewController alloc] init];
    return userVC;
}

- (UIViewController *)createFeedTimeLineVC {
    LNFeedTimeLineViewController*feedVc = [[LNFeedTimeLineViewController alloc] init];
    return feedVc;
}

- (UIViewController *)createFeedFoucusVC {
    LNFeedTimeLineViewController*feedVc = [[LNFeedTimeLineViewController alloc] init];
    return feedVc;
}

- (UIViewController *)createUserCenterVCWithUser:(LNUser *)user {
    LNFeedDetailViewController *userVC = [[LNFeedDetailViewController alloc] init];
    return userVC;
}

- (UIViewController *)createFeedDetailVCWithFeed:(LNFeed *)feed {
    LNFeedDetailViewController *feedVc = [[LNFeedDetailViewController alloc] init];
    feedVc.feed = feed;
    return feedVc;
}

/**
 * 创建Feed详情页
 */
- (UIViewController *)createFeedDetailVCWithFeedId:(NSString *)feedId
{
    LNFeedDetailViewController *feedVc = [[LNFeedDetailViewController alloc] init];
    LNFeed *feed = [[LNFeed alloc] init];
    feed.feedId = feedId;
    feedVc.feed = feed;
    return feedVc;
}

- (UIViewController *)createTopicFeedListVCWithTopic:(LNTopic *)topic {
    LNTopicFeedTableViewController *topicFeedVc = [[LNTopicFeedTableViewController alloc] init];
    topicFeedVc.topic = topic;
    return topicFeedVc;
}

- (UIViewController *)createTopicVC {
    LNTopicTableViewController *topicVc = [[LNTopicTableViewController alloc] init];
    return topicVc;
}


//#pragma mark -
//- (UIViewController *)topViewController:(UIViewController *)vc {
//    if (!vc) {
//        return [self topViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
//    }
//    else if (vc.presentedViewController) {
//        return [self topViewController:vc.presentedViewController];
//    } else if ([vc isKindOfClass:[UISplitViewController class]]) {
//        UISplitViewController *svc = (UISplitViewController*)vc;
//        if (svc.viewControllers.count > 0) {
//            return [self topViewController:svc.viewControllers.lastObject];
//        } else {
//            return vc;
//        }
//    } else if ([vc isKindOfClass:[UINavigationController class]]) {
//        UINavigationController *navC = (UINavigationController*)vc;
//        if (navC.viewControllers.count > 0) {
//            return [self topViewController:navC.topViewController];
//        } else {
//            return vc;
//        }
//    } else if ([vc isKindOfClass:[UITabBarController class]]) {
//        UITabBarController *tabC = (UITabBarController*)vc;
//        if (tabC.viewControllers.count > 0) {
//            return [self topViewController:tabC.selectedViewController];
//        } else {
//            return vc;
//        }
//    } else {
//        return vc;
//    }
//}
//
//- (UIViewController *)currentViewController {
//    UIViewController *vc = [self topViewController:nil];
//    return vc;
//}
//
//- (void)pushToViewControll:(UIViewController *)viewController
//{
//    UIViewController *currentVc = [self currentViewController];
//    if (currentVc.navigationController) {
//        [currentVc.navigationController pushViewController:viewController animated:YES];
//    }else{
//        [currentVc presentViewController:viewController animated:YES completion:nil];
//    }
//}

//- (void)showFeedDetailVcWithFeed:(LNFeed *)feed {
//    LNFeedDetailViewController *userVC = [[LNFeedDetailViewController alloc] init];
//    [LNRouter pushToViewControll:userVC];
//}
//
//- (void)showTopicFeedListVcWithTopic:(LNTopic *)topic {
//    LNTopicFeedTableViewController *topicFeedVc = [[LNTopicFeedTableViewController alloc] init];
//    topicFeedVc.topic = topic;
//    [LNRouter pushToViewControll:topicFeedVc];
//}
//
//- (void)showUserCenterVcWithUser:(LNUser *)user {
//    LNFeedDetailViewController *userVC = [[LNFeedDetailViewController alloc] init];
//    [LNRouter pushToViewControll:userVC];
//}
//
//- (void)showTopicVc {
//    LNTopicTableViewController *topicVC = [[LNTopicTableViewController alloc] init];
//    [LNRouter pushToViewControll:topicVC];
//}

@end
