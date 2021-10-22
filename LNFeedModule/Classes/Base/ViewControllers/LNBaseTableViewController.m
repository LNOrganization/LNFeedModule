//
//  LNBaseTableViewController.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/30.
//

#import "LNBaseTableViewController.h"
#import <MJRefresh/MJRefresh.h>
#import "LNUIKitHelper.h"

@interface LNBaseTableViewController ()

@property(nonatomic, assign) CFAbsoluteTime loadingTime;

@end

@implementation LNBaseTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isFirst = YES;
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.indicatorView];
    // Do any additional setup after loading the view.
}

#pragma mark - setters and getters
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        __weak typeof(self) weakSelf = self;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf.modelController startRefreshData];
         }];
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [weakSelf.modelController startLoadMoreData];
        }];
    }
    return _tableView;
}

- (UIActivityIndicatorView *)indicatorView
{
    if (!_indicatorView) {
        _indicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
        _indicatorView.center = CGPointMake(LNUIScreenWidth/2, LNUIScreenHeight/2);
        _indicatorView.color = [UIColor grayColor];
    }
    return _indicatorView;
}

- (NSArray *)dataArray
{
    return _modelController.dataList;
}

- (void)setModelController:(id<LNListModelControllerAdaptar>)modelController
{
    _modelController = modelController;
    _modelController.delegate = self;
}

#pragma mark - UITableViewDelegate
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *cellID = @"CellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


#pragma mark - LNListModelControllerAdaptar
- (void)modelController:(id<LNListModelControllerAdaptar>)modelController
   requestBeginWithType:(LNListDataRequestType)requestType
{
    self.loadingTime = CFAbsoluteTimeGetCurrent();
}

- (void)modelController:(id<LNListModelControllerAdaptar>)modelController
  requestFinishWithType:(LNListDataRequestType)requestType
{
    [self finishLoading:requestType];
    [self.tableView reloadData];
    CFAbsoluteTime endTime = CFAbsoluteTimeGetCurrent();
    NSLog(@"加载时间：%@", @(endTime - self.loadingTime));
}

- (void)modelController:(id<LNListModelControllerAdaptar>)modelController
   requestErrorWithType:(LNListDataRequestType)requestType
             errMessage:(NSString *)errMessage
{
    if (errMessage) {
        NSLog(@"error:%@", errMessage);
    }
    [self finishLoading:requestType];
}

- (void)finishLoading:(LNListDataRequestType)requestType
{
    self.isFirst = NO;
    if (requestType == LNListDataRequestTypeLoadMore) {
        [self.tableView.mj_footer endRefreshing];
    }else{
        [self.tableView.mj_header endRefreshing];
    }
}

- (void)modelController:(id<LNListModelControllerAdaptar>)modelController
   changedObjectAtIndex:(NSInteger)index
{
    [self.tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
}


- (void)modelController:(id<LNListModelControllerAdaptar>)modelController deletedObjectAtIndex:(NSInteger)index
{
    [self.tableView beginUpdates];
    [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
}

#pragma mark - public
- (void)reloadTableViewCell:(UITableViewCell *)cell
{
    if (!cell) {
        [self.tableView reloadData];
        return;
    }
    [self.tableView beginUpdates];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    if (indexPath) {
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }else{
        [self.tableView reloadData];
    }
    [self.tableView endUpdates];
}


@end
