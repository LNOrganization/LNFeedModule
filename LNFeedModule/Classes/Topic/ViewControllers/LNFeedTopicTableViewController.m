//
//  LNFeedTopicTableViewController.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/9/3.
//

#import "LNFeedTopicTableViewController.h"
#import "LNFeedTopicListModelController.h"

@interface LNFeedTopicTableViewController ()

@end

@implementation LNFeedTopicTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 40;
    
    self.modelController = [[LNFeedTopicListModelController alloc] init];
    
    [self.modelController startRefreshData];
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
