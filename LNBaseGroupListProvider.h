//
//  LNBaseGroupListProvider.h
//  LNFeedModule
//
//  Created by Lenny on 2022/7/26.
//

#import <LNFeedModule/LNFeedModule.h>
#import "LNBaseListModelProvider.h"
NS_ASSUME_NONNULL_BEGIN

@interface LNBaseGroupListProvider : LNBaseListModelProvider


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

NS_ASSUME_NONNULL_END
