//
//  LNTopicListDataSource.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/9/3.
//

#import "LNTopicListDataSource.h"
#import "LNTopic.h"

@implementation LNTopicListDataSource
//dispatch_async(dispatch_get_global_queue(0, 0), ^{
//    for (NSInteger index = 0; index < self.pageSize; index ++) {
//
//    }
//});
- (void)requestWithSuccess:(LNLoadSuccessBlock)success
                        failure:(LNLoadFailureBlock)failure
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSMutableArray *topics = [NSMutableArray array];
        for (NSInteger index = 0; index < self.pageSize; index ++) {
            LNTopic *topic = [[LNTopic alloc] init];
            topic.name = [NSString stringWithFormat:@"这是一个很好的话题-%@",@(index)];
            [topics addObject:topic];
        }
        if (success) {
            success(topics);
        }
    });
}
@end
