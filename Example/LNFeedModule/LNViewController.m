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
#import "LNTestView.h"

@interface LNViewController ()

@property(nonatomic, strong) LNTestView *myView;

@end

@implementation LNViewController

- (void)viewDidLoad
{
    NSLog(@"%s",__func__);
    [super viewDidLoad];
    
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self showFeed];
    
//    [self.view setNeedsDisplay];
    [self.view setNeedsLayout];
//    [self.view addSubview:[[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)]];
//    self.view.frame = CGRectMake(0, 0, 200, 300);
//    [self.view layoutIfNeeded];
    
}

- (void)showFeed
{
    id<LNFeedModuleProtocol> feedModule = (id)[[LNModuleManager sharedInstance] impInstanceForProtocol:@protocol(LNFeedModuleProtocol)];
    UIViewController *feedVc = [feedModule getMainFeedViewController];
    [self.navigationController pushViewController:feedVc animated:YES];
//    [self presentViewController:feedVc animated:YES completion:nil];
}

- (void)loadView
{
    self.myView = [[LNTestView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
    self.myView.backgroundColor = [UIColor redColor];
    self.view = self.myView;
}

// Called when the view is about to made visible. Default does nothing
- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%s",__func__);
}

// Called when the view has been fully transitioned onto the screen. Default does nothing
- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"%s",__func__);
}

// Called when the view is dismissed, covered or otherwise hidden. Default does nothing
- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"%s",__func__);
}

// Called after the view was dismissed, covered or otherwise hidden. Default does nothing
- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"%s",__func__);
}


// Called just before the view controller's view's layoutSubviews method is invoked. Subclasses can implement as necessary. The default is a no-op.
- (void)viewWillLayoutSubviews API_AVAILABLE(ios(5.0))
{
    NSLog(@"%s",__func__);
}

// Called just after the view controller's view's layoutSubviews method is invoked. Subclasses can implement as necessary. The default is a no-op.
- (void)viewDidLayoutSubviews API_AVAILABLE(ios(5.0))
{
    NSLog(@"%s",__func__);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
