//
//  LNBaseViewController.m
//  LNFeed
//
//  Created by Lenny on 2021/10/21.
//

#import "LNBaseViewController.h"

@interface LNBaseViewController ()

@property(nonatomic, strong, readwrite) id<LNFeedMediatorDelegate> mediator;

@end

@implementation LNBaseViewController


- (void)setUpWithParams:(NSDictionary *)params
{
    
}

- (id<LNFeedMediatorDelegate>)mediator
{
    if (!_mediator) {
        _mediator = [LNFeedModelConfig mediator];
    }
    return _mediator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    // Do any additional setup after loading the view.
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
