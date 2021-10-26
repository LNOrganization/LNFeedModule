//
//  LNBaseFeedTableViewController.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/31.
//

#import "LNBaseFeedTableViewController.h"
#import "LNFeedImageTableViewCell.h"
#import "LNFeedVideoTableViewCell.h"
#import "LNFeedModelController.h"

@interface LNBaseFeedTableViewController ()<LNFeedViewEventDelegate>

@property (nonatomic, strong) LNFeedModelController *feedmodelController;

@end

@implementation LNBaseFeedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 200;
    self.feedmodelController = [[LNFeedModelController alloc] init];
    // Do any additional setup after loading the view.
}


#pragma mark - UITableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    LNFeedCellLayout *feedLayout = self.dataArray[indexPath.row];
    LNFeedTableViewCell *cell = nil;
    if (feedLayout.feed.imageUrls.count > 0) {
        NSString *feedImageCellID = @"LNFeedImageTableViewCell";
        cell = [tableView dequeueReusableCellWithIdentifier:feedImageCellID];
        if (!cell) {
            cell = [[LNFeedImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:feedImageCellID];
        }
    }else if(feedLayout.feed.videoUrl){
        NSString *feedvideoCellID = @"LNFeedVideoTableViewCell";
        cell = [tableView dequeueReusableCellWithIdentifier:feedvideoCellID];
        if (!cell) {
            cell = [[LNFeedVideoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:feedvideoCellID];
        }
    }else{
        NSString *cellID = @"LNFeedTableViewCell";
        cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[LNFeedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
    }
    cell.delegate = self;
    [cell reloadWithData:self.dataArray[indexPath.row]];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LNFeedCellLayout *layout = self.dataArray[indexPath.row];
    return layout.cellHeight;
}

#pragma mark - LNFeedViewDelegate
- (void)feedView:(nonnull LNFeedTableViewCell *)cell clickOnLikeFeed:(nonnull LNFeed *)feed
          isLike:(BOOL)isLike {
    [self.feedmodelController feed:feed like:isLike completion:^(NSError * _Nonnull error) {
        [self reloadTableViewCell:cell];
    }];
}

- (void)feedView:(nonnull LNFeedTableViewCell *)cell
clickOnStoreFeed:(nonnull LNFeed *)feed
         isStore:(BOOL)isStore {
    [self.feedmodelController feed:feed store:isStore completion:^(NSError * _Nonnull error) {
        [self reloadTableViewCell:cell];
    }];
}


- (void)feedView:(nonnull UIView *)view clickOnTopic:(nonnull LNTopic *)topic {
    [LNRouter pushToViewControll:[self.mediator createTopicFeedListVCWithTopic:topic]];
//    [self.mediator showTopicFeedListVcWithTopic:topic];
}

- (void)feedView:(UIView *)view clickOnCommentFeed:(LNFeed *)feed
{
//    [self.mediator showFeedDetailVcWithFeed:feed];
    [LNRouter pushToViewControll:[self.mediator createFeedDetailVCWithFeed:feed]];
}

- (void)feedView:(nonnull UIView *)view clickOnUser:(nonnull LNUser *)user {
//    [self.mediator showUserCenterVcWithUser:user];
    [LNRouter pushToViewControll:[self.mediator createUserCenterVCWithUser:user]];
}



@end
