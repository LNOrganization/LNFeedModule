//
//  LNFeed.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/30.
//

#import <LNCommonKit/LNJSONModel.h>


NS_ASSUME_NONNULL_BEGIN

@class LNUser, LNComment, LNTopic;

@protocol LNTopic

@end
@protocol LNComment

@end
@protocol LNUser

@end
@protocol LNFeed

@end

@interface LNFeed : LNJSONModel

@property(nonatomic, copy)   NSString *feedId;

@property(nonatomic, copy)   NSString *content;

@property(nonatomic, assign) NSInteger likeCount;

@property(nonatomic, assign) NSInteger storeCount;

@property(nonatomic, assign) BOOL isLike;//

@property(nonatomic, assign) BOOL isStored;

@property(nonatomic, assign) NSInteger commentCount;

@property(nonatomic, strong) NSArray *imageUrls;

@property(nonatomic, copy)   NSString *videoUrl;

@property(nonatomic, strong) LNUser *creator;

@property(nonatomic, strong) NSArray <LNComment> *comments;

@property(nonatomic, strong) NSArray <LNTopic> *topics;

@property(nonatomic, strong) NSArray <LNUser> *relatedUsers;

@property(nonatomic, strong) LNFeed *originFeed;

@property(nonatomic, assign) NSTimeInterval createTime;

@end



NS_ASSUME_NONNULL_END
