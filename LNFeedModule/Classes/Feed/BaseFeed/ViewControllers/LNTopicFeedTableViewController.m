//
//  LNTopicFeedTableViewController.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/9/3.
//

#import "LNTopicFeedTableViewController.h"
#import "LNTopicFeedlistModelController.h"

@interface LNTopicFeedTableViewController ()

@end

@implementation LNTopicFeedTableViewController

- (void)setUpWithParams:(NSDictionary *)params
{
    self.topic = [params objectForKey:@"topic"];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setTopic:(LNTopic *)topic
{
    _topic = topic;
    if (topic) {
        self.title = topic.name;
        self.modelController = [[LNTopicFeedlistModelController alloc] initWithTopicId:topic.topicId];
        [self.modelController startRefreshData];
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
