//
//  LNTimeLineViewController.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/30.
//

#import "LNTimeLineViewController.h"
#import "LNTimeLineListModelController.h"
#import <MJRefresh/MJRefresh.h>

@interface LNTimeLineViewController ()

@end

@implementation LNTimeLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isFirst = YES;
    self.modelController = [[LNTimeLineListModelController alloc] init];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.isFirst) {
        self.isFirst = NO;
        [self.modelController startRefreshData];
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
