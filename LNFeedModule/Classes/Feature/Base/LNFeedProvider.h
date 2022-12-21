//
//  LNFeedProvider.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/9/3.
//

#import "LNBaseDataProvider.h"
#import "LNFeed.h"
NS_ASSUME_NONNULL_BEGIN

@interface LNFeedProvider : LNBaseDataProvider

// 点赞 或 取消点赞
- (void)feed:(LNFeed *)feed
        like:(BOOL)isLike
  completion:(LNDataLoadCompletionBlock)completion;

// 收藏 或 取消收藏
- (void)feed:(LNFeed *)feed
       store:(BOOL)isStore
  completion:(LNDataLoadCompletionBlock)completion;

// 评论
- (void)addComment:(LNComment *)comment
            toFeed:(LNFeed *)feed
        completion:(LNDataLoadCompletionBlock)completion;

// 删除评论
- (void)deleteComment:(LNComment *)comment
             fromFeed:(LNFeed *)feed
           completion:(LNDataLoadCompletionBlock)completion;

// 转发feed
- (void)forwardFeed:(LNFeed *)feed
            content:(NSString *)content
       relatedUsers:(NSArray <LNUser * >*)users
      relatedTopics:(NSArray <LNTopic * >*)topics
         completion:(LNDataLoadCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
