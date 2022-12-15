//
//  LNBaseFeedListProvider.h
//  LNFeedModule
//
//  Created by Lenny on 2021/10/31.
//

#import "LNBaseListModelProvider.h"

FOUNDATION_EXPORT LNHTTPRequestPathString const LNFeedRecommendsPath;
FOUNDATION_EXPORT LNHTTPRequestPathString const LNFeedTimelinesPath;
FOUNDATION_EXPORT LNHTTPRequestPathString const LNFeedFocusFeedsPath;
FOUNDATION_EXPORT LNHTTPRequestPathString const LNFeedDetailPath;
FOUNDATION_EXPORT LNHTTPRequestPathString const LNFeedTopicsPath;
FOUNDATION_EXPORT LNHTTPRequestPathString const LNFeedTopicFeedsPath;
FOUNDATION_EXPORT LNHTTPRequestPathString const LNFeedCommentsPath;


NS_ASSUME_NONNULL_BEGIN

@interface LNBaseFeedListProvider : LNBaseListModelProvider

@property(nonatomic, strong) NSOperationQueue *layoutObjectQueue;

- (NSArray *)createFeedCellLayoutsWithFeeds:(NSArray *)feeds;


@end

NS_ASSUME_NONNULL_END
