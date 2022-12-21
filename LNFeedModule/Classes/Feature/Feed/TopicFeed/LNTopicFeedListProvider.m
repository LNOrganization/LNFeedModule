//
//  LNTopicFeedListProvider.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/9/3.
//

#import "LNTopicFeedListProvider.h"
#import "LNFeed.h"
#import "LNUser.h"
#import "LNTopic.h"
#import "LNComment.h"
#import "LNFeedCellLayout.h"


@implementation LNTopicFeedListProvider

- (instancetype)initWithTopicId:(NSString *)topicId;
{
    self = [super init];
    if (self) {
        self.topicId = topicId;
    }
    return self;
}


- (LNHTTPRequest *)requestWithSuccess:(LNLoadSuccessBlock)success
                              failure:(LNLoadFailureBlock)failure{
    
    LNHTTPRequest *request = [LNNetworkManager startRequestCreator:^(LNHTTPRequest *  _Nonnull request) {
        request.urlPath = LNFeedTopicFeedsPath;
        [request createParameters:^(NSMutableDictionary * _Nonnull params) {
            [params setObject:@(self.pageSize) forKey:@"pageSize"];
            [params setObject:@(self.currentPage) forKey:@"currentPage"];
            [params setObject:self.topicId forKey:@"topicId"];
        }];
    }
    succeed:^(id  _Nonnull data) {
        LNListJSONResponse *response = [LNListJSONResponse responseWithDictionary:data modelClass:[self modelClass]];
        response = [self feedCellLayoutResponseWithFeedResponse:response];
        LN_SAFE_BLOCK_CALL(success, response);
    } failed:^(NSError * _Nonnull error) {
        LN_SAFE_BLOCK_CALL(failure, error);
#if DEBUG
        LNListJSONResponse *response = [LNListJSONResponse responseWithDictionary:[self localData] modelClass:[self modelClass]];
        response = [self feedCellLayoutResponseWithFeedResponse:response];
        LN_SAFE_BLOCK_CALL(success, response);
#endif
    }];
    
    return request;
}

@end
