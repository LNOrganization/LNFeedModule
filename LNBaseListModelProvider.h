//
//  LNBaseListModelProvider.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/30.
//

#import "LNModelProvider.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, LNListDataRequestType) {
    LNListDataRequestTypeFirstTimeRefresh,
    LNListDataRequestTypeRefresh,
    LNListDataRequestTypeLoadMore
};

typedef NS_ENUM(NSUInteger, LNListDataLoadingStatus) {
    LNListDataLoadingStatusNormal,
    LNListDataLoadingStatusLoading,
    LNListDataLoadingStatusError,
    LNListDataLoadingStatusNoMore,
    LNListDataLoadingStatusEmpty
};


typedef void(^LNListRequestCompletion)(id data, NSError * _Nullable error);

@protocol LNListModelAdaptar;
@protocol LNListDataResponseDelegate <NSObject>


//- (void)provider:(id<LNListModelAdaptar>)provider
//   requestBeginWithType:(LNListDataRequestType)requestType;
//
//- (void)provider:(id<LNListModelAdaptar>)provider
//  requestFinishWithType:(LNListDataRequestType)requestType;
//
//- (void)provider:(id<LNListModelAdaptar>)provider
//   requestErrorWithType:(LNListDataRequestType)requestType
//             errMessage:(NSString *)errMessage;
//- (void)provider:(id<LNListModelAdaptar>)provider
//      refreshWithStatus:(LNListDataStatus)status;
//
//- (void)provider:(id<LNListModelAdaptar>)provider
//     loadMoreWithStatus:(LNListDataStatus)status;

//- (void)provider:(id<LNListModelAdaptar>)provider
//     loadDataWithStatus:(LNListDataStatus)status;

- (void)providerLoadStart:(id<LNListModelAdaptar>)provider isLoadMored:(BOOL)isLoadMore;
- (void)providerLoading:(id<LNListModelAdaptar>)provider isLoadMored:(BOOL)isLoadMore;
- (void)providerLoadSucceed:(id<LNListModelAdaptar>)provider isLoadMored:(BOOL)isLoadMore;
- (void)providerLoadFail:(id<LNListModelAdaptar>)provider isLoadMored:(BOOL)isLoadMore;
- (void)providerLoadCancel:(id<LNListModelAdaptar>)provider isLoadMored:(BOOL)isLoadMore;

@optional
- (void)provider:(id<LNListModelAdaptar>)provider
   changedObjectAtIndex:(NSInteger)index;

- (void)provider:(id<LNListModelAdaptar>)provider
   deletedObjectAtIndex:(NSInteger)index;

@end


@protocol LNListModelAdaptar <NSObject>

@property(nonatomic, assign, readonly) NSInteger currentPage;

@property(nonatomic, assign) NSInteger pageSize;

@property(nonatomic, strong, readonly) NSArray *dataList;

@property(nonatomic, weak) id<LNListDataResponseDelegate> delegate;

/*
 * 请求第一页 或 刷新
 */
- (void)startRefreshData;

/*
 * 加载下一页
 */
- (void)startLoadMoreData;

/*
 * 取消请求
 */
- (void)cancelRequestIfNeed;

/*
 * 清除数据
 */
- (void)clearData;


@end


@interface LNBaseListModelProvider : LNModelProvider<LNListModelAdaptar>

- (void)requestWithCompletion:(LNListRequestCompletion)completion;

- (id)objectAtIndex:(NSInteger)index;

- (void)removeObjectAtIndex:(NSInteger)index;

- (void)insertObject:(id)object atIndex:(NSInteger)index;

- (void)addObject:(id)object;

- (void)replaceObject:(id)object atIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
