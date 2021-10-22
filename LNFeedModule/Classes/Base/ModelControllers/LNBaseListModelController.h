//
//  LNBaseListModelController.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/30.
//

#import "LNModelController.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, LNListDataRequestType) {
    LNListDataRequestTypeFirstTimeRefresh,
    LNListDataRequestTypeRefresh,
    LNListDataRequestTypeLoadMore
};

typedef void(^LNListRequestCompletion)(NSArray *dataList, NSError * _Nullable error);

@protocol LNListModelControllerAdaptar;
@protocol LNListDataResponseDelegate <NSObject>


- (void)modelController:(id<LNListModelControllerAdaptar>)modelController
   requestBeginWithType:(LNListDataRequestType)requestType;

- (void)modelController:(id<LNListModelControllerAdaptar>)modelController
  requestFinishWithType:(LNListDataRequestType)requestType;

- (void)modelController:(id<LNListModelControllerAdaptar>)modelController
   requestErrorWithType:(LNListDataRequestType)requestType
             errMessage:(NSString *)errMessage;

@optional
- (void)modelController:(id<LNListModelControllerAdaptar>)modelController
   changedObjectAtIndex:(NSInteger)index;

- (void)modelController:(id<LNListModelControllerAdaptar>)modelController
   deletedObjectAtIndex:(NSInteger)index;

@end


@protocol LNListModelControllerAdaptar <NSObject>

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
 * 分组数据获取，请求结束之后同步读取
 */
- (NSArray *)dataListInSection:(NSInteger)section;

- (id)objectAtIndex:(NSInteger)index inSection:(NSInteger)section;

- (void)removeObjectAtIndex:(NSInteger)index inSection:(NSInteger)section;

- (void)insertObject:(id)object atIndex:(NSInteger)index inSection:(NSInteger)section;

- (void)addObject:(id)object inSection:(NSInteger)section;

- (void)replaceObject:(id)object atIndex:(NSInteger)index inSection:(NSInteger)section ;

@end


@interface LNBaseListModelController : LNModelController<LNListModelControllerAdaptar>

- (void)requestWithCompletion:(LNListRequestCompletion)completion;

@end

NS_ASSUME_NONNULL_END
