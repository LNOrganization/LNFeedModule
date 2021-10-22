//
//  LNBaseListModelController.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/30.
//

#import "LNBaseListModelController.h"

@interface LNBaseListModelController ()

@property(nonatomic, assign, readwrite) NSInteger               currentPage;
@property(nonatomic, strong, readwrite) NSMutableArray          *dataList;
@property(nonatomic, assign)            LNListDataRequestType   requestType;
@property(nonatomic, assign)            BOOL                    isLaoding;
@property(nonatomic, assign)            BOOL                    isFirst;
@property(nonatomic, copy)              LNListRequestCompletion completionBlock;
@end

@implementation LNBaseListModelController

@synthesize delegate = _delegate, pageSize = _pageSize;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.currentPage = 0;
        self.pageSize = 20;
        self.isLaoding = NO;
        self.isFirst = YES;
        self.requestType = LNListDataRequestTypeFirstTimeRefresh;
        _dataList = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - private
- (void)requestWithCompletion:(LNListRequestCompletion)completion
{
    NSLog(@"This method must be overwrite by subclass");
}



#pragma mark - LNListModelControllerAdaptar

- (void)startRefreshData
{
    LNListDataRequestType requestType = self.isFirst? LNListDataRequestTypeFirstTimeRefresh : LNListDataRequestTypeRefresh;
    if (self.isLaoding && self.requestType != LNListDataRequestTypeRefresh) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(modelController:requestErrorWithType:errMessage:)]) {
            [self.delegate modelController:self
                      requestErrorWithType:requestType
                                errMessage:@"请求过于频繁"];
        }
        return;
    }else if(self.isLaoding){
        [self cancelRequestIfNeed];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(modelController:requestBeginWithType:)]) {
        [self.delegate modelController:self requestBeginWithType:requestType];
    }
    self.currentPage = 0;
    self.isLaoding = YES;
    self.requestType = requestType;
    __weak typeof(self) weakSelf = self;
    [self requestWithCompletion:^(NSArray * _Nonnull dataList, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.isLaoding = NO;
            if (!error) {
                [weakSelf.dataList removeAllObjects];
                [weakSelf.dataList addObjectsFromArray:dataList];
            }
            LNListDataRequestType type = weakSelf.isFirst? LNListDataRequestTypeFirstTimeRefresh : LNListDataRequestTypeRefresh;
            weakSelf.isFirst = NO;
    
            if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(modelController:requestFinishWithType:)]) {
                
                [weakSelf.delegate modelController:weakSelf requestFinishWithType:type];
            }
        });
    }];
}

- (void)startLoadMoreData
{
    if (self.isLaoding && self.requestType != LNListDataRequestTypeLoadMore) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(modelController:requestErrorWithType:errMessage:)]) {
            [self.delegate modelController:self
                      requestErrorWithType:LNListDataRequestTypeLoadMore
                                errMessage:@"请求过于频繁"];
        }
        return;
    }else if (self.isLaoding) {
        [self cancelRequestIfNeed];
    }
    self.isLaoding = YES;
    self.currentPage += 1;
    if (self.delegate && [self.delegate respondsToSelector:@selector(modelController:requestBeginWithType:)]) {
        [self.delegate modelController:self requestBeginWithType:LNListDataRequestTypeLoadMore];
    }
    self.requestType = LNListDataRequestTypeLoadMore;
    [self requestWithCompletion:^(NSArray *dataList, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.isLaoding = NO;
            if (!error) {
                [self.dataList addObjectsFromArray:dataList];
                if (self.delegate && [self.delegate respondsToSelector:@selector(modelController:requestFinishWithType:)]) {
                    [self.delegate modelController:self requestFinishWithType:LNListDataRequestTypeLoadMore];
                }
            }else{
                if (self.delegate && [self.delegate respondsToSelector:@selector(modelController:requestErrorWithType:errMessage:)]) {
                    [self.delegate modelController:self
                              requestErrorWithType:LNListDataRequestTypeLoadMore
                                        errMessage:error.description];
                }
            }
           
        });
    }];
}

- (void)cancelRequestIfNeed
{
    NSLog(@"取消请求");
    self.isLaoding = NO;
    if (self.currentPage > 0) {
        self.currentPage -= 1;
    }
}


- (nonnull NSArray *)dataListInSection:(NSInteger)section {
    if (_dataList && _dataList.count > section) {
        NSArray *sectionDatas = _dataList[section];
        if (sectionDatas && [sectionDatas isKindOfClass:[NSArray class]]) {
            return sectionDatas;
        }
    }
    return _dataList;
}

- (nonnull id)objectAtIndex:(NSInteger)index inSection:(NSInteger)section {
    NSArray *arr = [self dataListInSection:section];
    id obj = nil;
    if (arr && arr.count > index) {
        obj = arr[index];
    }
    return obj;
}



- (void)addObject:(nonnull id)object inSection:(NSInteger)section {
    NSLog(@"This method can overwrite by subclass if need");
}

- (void)insertObject:(nonnull id)object atIndex:(NSInteger)index inSection:(NSInteger)section {
    NSLog(@"This method can overwrite by subclass if need");
}


- (void)removeObjectAtIndex:(NSInteger)index inSection:(NSInteger)section {
    NSLog(@"This method can overwrite by subclass if need");
}

- (void)replaceObject:(nonnull id)object atIndex:(NSInteger)index inSection:(NSInteger)section  {
    NSLog(@"This method can overwrite by subclass if need");
}


@end
