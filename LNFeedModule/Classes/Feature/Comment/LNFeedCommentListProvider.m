//
//  LNFeedCommentListProvider.m
//  LNAccountModule
//
//  Created by Lenny on 2021/10/26.
//

#import "LNFeedCommentListProvider.h"
#import "LNComment.h"
@implementation LNFeedCommentListProvider

- (LNHTTPRequest *)requestWithSuccess:(LNLoadSuccessBlock)success
                              failure:(LNLoadFailureBlock)failure
{
    return [LNNetworkManager startRequestCreator:^(LNHTTPRequest * _Nonnull request) {
        request.methodType = LNHTTPMethodTypeGet;
        request.urlPath = @"";
    } succeed:^(id  _Nonnull data) {
//        LNListJSONResponse *response = [LNListJSONResponse responseWithDictionary:data modelClass:[LNComment class]];
        LN_SAFE_BLOCK_CALL(success, data);
    } failed:^(NSError * _Nonnull error) {
        LN_SAFE_BLOCK_CALL(failure, error);
    }];
}

- (Class)modelClass
{
    return [LNComment class];
}

@end
