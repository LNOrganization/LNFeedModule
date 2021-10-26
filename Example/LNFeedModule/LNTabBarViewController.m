//
//  LNTabBarViewController.m
//  LNFeedModule_Example
//
//  Created by Lenny on 2021/10/26.
//  Copyright © 2021 dongjianxiong. All rights reserved.
//

#import "LNTabBarViewController.h"
#import "LNViewController.h"
#import <LNModuleProtocol/LNModuleProtocol.h>
#import <LNModuleCore/LNModuleCore.h>

@interface LNTabBarViewController ()

@end

@implementation LNTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    id<LNFeedModuleProtocol> feedModule = [[LNModuleManager sharedInstance] impInstanceForProtocol:@protocol(LNFeedModuleProtocol)];
    UIViewController *homeVc = [feedModule getMainFeedViewController];
    homeVc.title = @"首页";
    
    LNViewController *VC2 = [[LNViewController alloc] init];
    VC2.title = @"其他";
    
    self.viewControllers = @[homeVc, VC2];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
