//
//  LNRecommendListViewController.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/30.
//

#import "LNRecommendListViewController.h"
#import "LNRecommendListModelController.h"

@interface LNRecommendListViewController ()<LNListDataResponseDelegate>


@end

@implementation LNRecommendListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.modelController = [[LNRecommendListModelController alloc] init];
    self.modelController.pageSize = 20;
    [self.modelController startRefreshData];
//    self.ta
    // Do any additional setup after loading the view.
}


@end

