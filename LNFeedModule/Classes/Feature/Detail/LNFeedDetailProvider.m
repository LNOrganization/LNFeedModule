//
//  LNFeedDetailProvider.m
//  FBSnapshotTestCase
//
//  Created by Lenny on 2021/10/17.
//

#import "LNFeedDetailProvider.h"
#import "LNFeed.h"
@implementation LNFeedDetailProvider

- (LNHTTPRequest *)requestWithSuccess:(LNLoadSuccessBlock)success
                              failure:(LNLoadFailureBlock)failure
{
    
    return [LNNetworkManager startRequestCreator:^(LNHTTPRequest * _Nonnull request) {
        
    } succeed:^(id  _Nonnull data) {
        LN_SAFE_BLOCK_CALL(success, data);
    } failed:^(NSError * _Nonnull error) {
        LN_SAFE_BLOCK_CALL(failure, error);
    }];
}

- (Class)responseClass
{
    return [LNJSONResponse class];
}

- (Class)modelClass
{
    return [LNFeed class];
}

@end
