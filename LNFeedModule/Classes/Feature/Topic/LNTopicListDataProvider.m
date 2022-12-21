//
//  LNTopicListDataProvider.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/9/3.
//

#import "LNTopicListDataProvider.h"
#import "LNTopic.h"
#import "LNFeedNetworkConst.h"


@implementation LNTopicListDataProvider

- (LNHTTPRequest *)requestWithSuccess:(LNLoadSuccessBlock)success
                              failure:(LNLoadFailureBlock)failure{
    
    LNHTTPRequest *request = [LNNetworkManager startRequestCreator:^(LNHTTPRequest *  _Nonnull request) {
        request.urlPath = LNFeedTopicsPath;
        [request createParameters:^(NSMutableDictionary * _Nonnull params) {
            [params setObject:@(self.pageSize) forKey:@"pageSize"];
            [params setObject:@(self.currentPage) forKey:@"currentPage"];
        }];
    }
    succeed:^(id  _Nonnull data) {
        LN_SAFE_BLOCK_CALL(success, data);
    } failed:^(NSError * _Nonnull error) {
        LN_SAFE_BLOCK_CALL(failure, error);
    }];
    
    return request;
}



@end
