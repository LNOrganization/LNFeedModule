//
//  LNBaseCollectionViewController.m
//  FBSnapshotTestCase
//
//  Created by Lenny on 2021/10/21.
//

#import "LNBaseCollectionViewController.h"
#import <MJRefresh/MJRefresh.h>
#import "LNUIKitHelper.h"

@interface LNBaseCollectionViewController ()

@end

@implementation LNBaseCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isFirst = YES;
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.indicatorView];
    // Do any additional setup after loading the view.
}

#pragma mark - setters and getters
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = [self creatCollectionView];
    }
    return _collectionView;
}
- (UICollectionView *)creatCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    __weak typeof(self) weakSelf = self;
    collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf.modelController startRefreshData];
     }];
    collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf.modelController startRefreshData];
    }];
    return collectionView;
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

#pragma mark - UICollectionViewDataSource
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [[UICollectionViewCell alloc] init];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.modelController.dataList.count;
}



#pragma mark - LNListModelControllerAdaptar
- (void)modelController:(id<LNListModelControllerAdaptar>)modelController
   requestBeginWithType:(LNListDataRequestType)requestType
{
    if (requestType == LNListDataRequestTypeFirstTimeRefresh) {
    }
}

- (void)modelController:(id<LNListModelControllerAdaptar>)modelController
  requestFinishWithType:(LNListDataRequestType)requestType
{
    [self finishLoading:requestType];
    [self.collectionView reloadData];
}

- (void)modelController:(id<LNListModelControllerAdaptar>)modelController
   requestErrorWithType:(LNListDataRequestType)requestType
             errMessage:(NSString *)errMessage
{
    if (errMessage) {
        NSLog(@"error:%@, requestType:%@", errMessage, @(requestType));
    }
    [self finishLoading:requestType];
}

- (void)finishLoading:(LNListDataRequestType)requestType
{
    self.isFirst = NO;
    if (requestType == LNListDataRequestTypeLoadMore) {
        [self.collectionView.mj_footer endRefreshing];
    }else{
        [self.collectionView.mj_header endRefreshing];
    }
}

- (void)modelController:(id<LNListModelControllerAdaptar>)modelController
   changedObjectAtIndex:(NSInteger)index
{
    [self.collectionView reloadItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]]];

}


- (void)modelController:(id<LNListModelControllerAdaptar>)modelController deletedObjectAtIndex:(NSInteger)index
{
    [self.collectionView deleteItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]]];
}

#pragma mark - public
- (void)reloadCollectionViewCell:(UICollectionViewCell *)cell
{
    if (!cell) {
        [self.collectionView reloadData];
        return;
    }
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    if (indexPath) {
        [self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
    }else{
        [self.collectionView reloadData];
    }
}


@end
