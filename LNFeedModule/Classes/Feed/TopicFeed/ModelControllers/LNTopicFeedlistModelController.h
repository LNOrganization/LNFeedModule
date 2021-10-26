//
//  LNTopicFeedlistModelController.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/9/3.
//

#import "LNBaseListModelController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LNTopicFeedlistModelController : LNBaseListModelController

- (instancetype)initWithTopicId:(NSString *)topicId;

@property (nonatomic, copy) NSString *topicId;

@end

NS_ASSUME_NONNULL_END
