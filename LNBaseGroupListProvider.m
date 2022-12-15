//
//  LNBaseGroupListProvider.m
//  LNFeedModule
//
//  Created by Lenny on 2022/7/26.
//

#import "LNBaseGroupListProvider.h"

@interface LNBaseGroupListProvider ()

@property(nonatomic, strong, readwrite) NSMutableArray          *dataList;

@end

@implementation LNBaseGroupListProvider

- (nonnull NSArray *)dataListInSection:(NSInteger)section {
    if (self.dataList && self.dataList.count > section) {
        NSArray *sectionDatas = self.dataList[section];
        if (sectionDatas && [sectionDatas isKindOfClass:[NSArray class]]) {
            return sectionDatas;
        }
    }
    return self.dataList;
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
