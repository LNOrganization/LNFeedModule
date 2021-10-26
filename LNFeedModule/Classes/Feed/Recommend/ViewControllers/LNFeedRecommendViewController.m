//
//  LNFeedRecommendViewController.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/30.
//

#import "LNFeedRecommendViewController.h"
#import "LNFeedRecommendModelController.h"

@interface LNFeedRecommendViewController ()<LNListDataResponseDelegate>


@end

@implementation LNFeedRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.modelController = [[LNFeedRecommendModelController alloc] init];
    self.modelController.pageSize = 20;
    [self.modelController startRefreshData];
//    self.ta
    // Do any additional setup after loading the view.
}


@end

