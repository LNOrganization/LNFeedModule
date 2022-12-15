//
//  LNBaseListModelProvider.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/30.
//

#import "LNBaseListModelProvider.h"


@interface LNBaseListModelProvider ()

@property(nonatomic, assign, readwrite) NSInteger               currentPage;
@property(nonatomic, strong, readwrite) NSMutableArray          *dataList;
@property(nonatomic, assign)            LNListDataLoadingStatus status;
@end

@implementation LNBaseListModelProvider

@synthesize delegate = _delegate, pageSize = _pageSize;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.currentPage = 1;
        self.pageSize = 20;
        self.status = LNListDataLoadingStatusNormal;
        _dataList = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - private
- (void)requestWithCompletion:(LNListRequestCompletion)completion
{
    NSLog(@"This method must be overwrite by subclass");
}



#pragma mark - LNListModelAdaptar

- (void)startRefreshData
{
    self.currentPage = 1;
    [self _innerLoadData:NO];
}

- (void)callBackWithStatus:(LNListDataLoadingStatus)loadingStatus
                 isSucceed:(BOOL)isSucceed
                    errMsg:(NSString *)msg
{
//    LNListDataStatus status = LNListDataStatusInit(loadingStatus, isSucceed, msg);
//    if (self.delegate && [self.delegate respondsToSelector:@selector(provider:loadDataWithStatus:)]) {
//        [self.delegate provider:self loadDataWithStatus:status];
//    }
//    if (self.currentPage == 1) {
//        if (self.delegate && [self.delegate respondsToSelector:@selector(provider:refreshWithStatus:)]) {
//            [self.delegate provider:self refreshWithStatus:status];
//        }
//    }else{
//        if (self.delegate && [self.delegate respondsToSelector:@selector(provider:loadMoreWithStatus:)]) {
//            [self.delegate provider:self loadMoreWithStatus:status];
//        }
//    }
}

- (void)startLoadMoreData
{
    [self _innerLoadData:YES];
}

- (void)_innerLoadData:(BOOL)isLoadMore{
    
    if (self.status == LNListDataLoadingStatusLoading) {
        [self callBackWithStatus:LNListDataLoadingStatusLoading isSucceed:NO errMsg:@"请求太频繁了"];
        return;
    }
    self.status = LNListDataLoadingStatusLoading;
    __weak typeof(self) weakSelf = self;
    
//    LNHTTPRequest *request = [self createRequest];
//    request.delegate = self;
//    [LNHTTPClient startRequest:request completion:^(id data, NSError *error) {
//        
//    }];
    
    [self requestWithCompletion:^(NSArray * _Nonnull dataList, NSError * _Nullable error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf handleData:dataList error:error isLoadMore:isLoadMore];
    }];
}

#pragma mark - handle data

- (void)handleData:(NSArray *)dataList
             error:(NSError *)error
        isLoadMore:(BOOL)isLoadMore
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        self.status = LNListDataLoadingStatusNormal;
        NSString *errorMsg = nil;
        if (!error) {
            if (!isLoadMore) {
                [self.dataList removeAllObjects];
            }
            if ([dataList isKindOfClass:[NSArray class]] && dataList.count > 0) {
                [self.dataList addObjectsFromArray:dataList];
            }else{
                if (isLoadMore) {
                    self.status = LNListDataLoadingStatusNoMore;
                }else{
                    self.status = LNListDataLoadingStatusEmpty;
                }
            }
            self.currentPage += 1;
        }else{
            self.status = LNListDataLoadingStatusError;
            errorMsg = error.description;
        }
        [self callBackWithStatus:self.status isSucceed:NO errMsg:errorMsg];
    });
}


- (void)cancelRequestIfNeed
{
    NSLog(@"取消请求");
    if (self.currentPage > 1) {
        self.currentPage -= 1;
    }
}

- (void)clearData
{
    [_dataList removeAllObjects];
    _currentPage = 0;
    _status = LNListDataLoadingStatusNormal;
}

@end
