//
//  LNBaseFeedListProvider.h
//  LNFeedModule
//
//  Created by Lenny on 2021/10/31.
//

#import "LNBaseListDataProvider.h"
#import "LNFeedNetworkConst.h"
#import <LNCommonKit/LNDataModel.h>
NS_ASSUME_NONNULL_BEGIN

@interface LNBaseFeedListProvider : LNBaseListDataProvider

- (LNListJSONResponse *)feedCellLayoutResponseWithFeedResponse:(LNListJSONResponse *)feedListResponse;

- (NSDictionary *)localData;
@end

NS_ASSUME_NONNULL_END
