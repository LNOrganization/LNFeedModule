//
//  LNFeedMediator.m
//  LNFeed
//
//  Created by Lenny on 2021/10/22.
//

#import "LNFeedMediator.h"
#import "UIViewController+Router.h"
#import "LNTopicFeedTableViewController.h"
#import "LNFeedDetailViewController.h"
#import "LNTopicTableViewController.h"


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

- (UIViewController *)creatFeedDetailVCWithFeed:(LNFeed *)feed {
    LNFeedDetailViewController *feedVc = [[LNFeedDetailViewController alloc] init];
    feedVc.feed = feed;
    return feedVc;
}

- (UIViewController *)createTopicFeedListVCWithTopic:(LNTopic *)topic {
    LNTopicFeedTableViewController *topicFeedVc = [[LNTopicFeedTableViewController alloc] init];
    topicFeedVc.topic = topic;
    return topicFeedVc;
}

- (UIViewController *)createUserCenterVCWithUser:(LNUser *)user {
    LNFeedDetailViewController *userVC = [[LNFeedDetailViewController alloc] init];
    return userVC;
}

- (UIViewController *)creatTopicVc {
    LNTopicTableViewController *topicVc = [[LNTopicTableViewController alloc] init];
    return topicVc;
}


#pragma mark -
- (UIViewController *)topViewController:(UIViewController *)vc {
    if (!vc) {
        return [self topViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
    }
    else if (vc.presentedViewController) {
        return [self topViewController:vc.presentedViewController];
    } else if ([vc isKindOfClass:[UISplitViewController class]]) {
        UISplitViewController *svc = (UISplitViewController*)vc;
        if (svc.viewControllers.count > 0) {
            return [self topViewController:svc.viewControllers.lastObject];
        } else {
            return vc;
        }
    } else if ([vc isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navC = (UINavigationController*)vc;
        if (navC.viewControllers.count > 0) {
            return [self topViewController:navC.topViewController];
        } else {
            return vc;
        }
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabC = (UITabBarController*)vc;
        if (tabC.viewControllers.count > 0) {
            return [self topViewController:tabC.selectedViewController];
        } else {
            return vc;
        }
    } else {
        return vc;
    }
}

- (UIViewController *)currentViewController {
    UIViewController *vc = [self topViewController:nil];
    return vc;
}

- (void)pushToViewControll:(UIViewController *)viewController
{
    UIViewController *currentVc = [self currentViewController];
    if (currentVc.navigationController) {
        [currentVc.navigationController pushViewController:viewController animated:YES];
    }else{
        [currentVc presentViewController:viewController animated:YES completion:nil];
    }
}

- (void)showFeedDetailVcWithFeed:(LNFeed *)feed {
    LNFeedDetailViewController *userVC = [[LNFeedDetailViewController alloc] init];
    [self pushToViewControll:userVC];
}

- (void)showTopicFeedListVcWithTopic:(LNTopic *)topic {
    LNTopicFeedTableViewController *topicFeedVc = [[LNTopicFeedTableViewController alloc] init];
    topicFeedVc.topic = topic;
    [self pushToViewControll:topicFeedVc];
}

- (void)showUserCenterVcWithUser:(LNUser *)user {
    LNFeedDetailViewController *userVC = [[LNFeedDetailViewController alloc] init];
    [self pushToViewControll:userVC];
}


- (void)showTopicVc {
    LNTopicTableViewController *topicVC = [[LNTopicTableViewController alloc] init];
    [self pushToViewControll:topicVC];
}

@end
