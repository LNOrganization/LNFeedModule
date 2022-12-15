//
//  LNFeedTimeLineViewController.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/30.
//

#import "LNFeedTimeLineViewController.h"
#import "LNFeedTimeLineListProvider.h"
#import <MJRefresh/MJRefresh.h>

@interface LNFeedTimeLineViewController ()

@end

@implementation LNFeedTimeLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isFirst = YES;
    self.provider = [[LNFeedTimeLineListProvider alloc] init];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.isFirst) {
        self.isFirst = NO;
        [self.provider startRefreshData];
    }
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
