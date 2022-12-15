//
//  LNBaseFeedListProvider.m
//  LNFeedModule
//
//  Created by Lenny on 2021/10/31.
//

#import "LNBaseFeedListProvider.h"
#import "LNFeed.h"
#import "LNFeedCellLayout.h"

LNHTTPRequestPathString const LNFeedRecommendsPath = @"feed/recommend/feeds";
LNHTTPRequestPathString const LNFeedTimelinesPath = @"feed/timeline/feeds";
LNHTTPRequestPathString const LNFeedFocusFeedsPath = @"feed/focus/feeds";
LNHTTPRequestPathString const LNFeedDetailPath = @"feed/detail";
LNHTTPRequestPathString const LNFeedTopicsPath = @"feed/topics";
LNHTTPRequestPathString const LNFeedTopicFeedsPath = @"feed/topic/feeds";
LNHTTPRequestPathString const LNFeedCommentsPath = @"feed/comments";


@implementation LNBaseFeedListProvider


- (NSOperationQueue *)layoutObjectQueue
{
    if (!_layoutObjectQueue) {
        _layoutObjectQueue = [[NSOperationQueue alloc] init];
        _layoutObjectQueue.maxConcurrentOperationCount = 5;
    }
    return _layoutObjectQueue;
}

- (NSArray *)createFeedCellLayoutsWithFeeds:(NSArray *)feeds
{
    if (!feeds || feeds.count == 0) {
        return nil;
    }
    NSMutableArray *feedCellLayouts = [[NSMutableArray alloc] init];
    NSMutableArray *operations = [[NSMutableArray alloc] init];
    NSBlockOperation *lastOperation = nil;
    for (LNFeed *feed in feeds) {
        NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
            LNFeedCellLayout *feedLayout = [[LNFeedCellLayout alloc] init];
            feedLayout.feed = feed;
            [feedCellLayouts addObject:feedLayout];
        }];
        if (lastOperation) {
            [blockOperation addDependency:lastOperation];
        }
        lastOperation = blockOperation;
        [operations addObject:blockOperation];
    }
    NSLog(@"Operations start operate");
    [self.layoutObjectQueue addOperations:operations waitUntilFinished:YES];
    NSLog(@"Operations finish operate");;
    return [feedCellLayouts copy];
}





@end
