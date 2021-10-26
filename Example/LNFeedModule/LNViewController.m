//
//  LNViewController.m
//  LNFeedModule
//
//  Created by dongjianxiong on 10/22/2021.
//  Copyright (c) 2021 dongjianxiong. All rights reserved.
//

#import "LNViewController.h"
#import <LNModuleCore/LNModuleCore.h>
#import <LNModuleProtocol/LNFeedModuleProtocol.h>

@interface LNViewController ()

@end

@implementation LNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self showFeed];
}

- (void)showFeed
{
    id<LNFeedModuleProtocol> feedModule = (id)[[LNModuleManager sharedInstance] impInstanceForProtocol:@protocol(LNFeedModuleProtocol)];
    UIViewController *feedVc = [feedModule getMainFeedViewController];
    [self.navigationController pushViewController:feedVc animated:YES];
//    [self presentViewController:feedVc animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
