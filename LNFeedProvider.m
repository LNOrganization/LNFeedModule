//
//  LNFeedProvider.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/9/3.
//

#import "LNFeedProvider.h"

@implementation LNFeedProvider

// 点赞 或 取消点赞
- (void)feed:(LNFeed *)feed
        like:(BOOL)isLike
  completion:(void (^)(NSError *error))completion
{
    if (isLike) {
        feed.likeCount += 1;
    }else{
        feed.likeCount -= 1;
    }
    if (completion) {
        completion(nil);
    }
}

// 收藏 或 取消收藏
- (void)feed:(LNFeed *)feed
       store:(BOOL)isStore
  completion:(void (^)(NSError *error))completion
{
    if (isStore) {
        feed.storeCount += 1;
    }else{
        feed.storeCount -= 1;
    }
    if (completion) {
        completion(nil);
    }
}

// 评论
- (void)addComment:(LNComment *)comment
            toFeed:(LNFeed *)feed
        completion:(void (^)(NSError *error))completion
{
    
}

// 删除评论
- (void)deleteComment:(LNComment *)comment
             fromFeed:(LNFeed *)feed
           completion:(void (^)(NSError *error))completion
{
    
}

// 转发feed
- (void)forwordFeed:(LNFeed *)feed
            content:(NSString *)content
       relatedUsers:(NSArray <LNUser * >*)users
      relatedTopics:(NSArray <LNTopic * >*)topics
         completion:(void (^)(NSError *error))completion
{
    
}

@end
