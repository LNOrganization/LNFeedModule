//
//  UIViewController+Mediator.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/9/3.
//

#import "UIViewController+Router.h"
#import "LNRouter.h"

@implementation UIViewController (Router)

- (UIViewController *)topViewController:(UIViewController *)vc {
    return [LNRouter topViewController:vc];
}

- (UIViewController *)currentViewController {
    UIViewController *vc = [self topViewController:self];
    return vc;
}

- (void)pushToViewControll:(UIViewController *)viewController
{
    if (self.navigationController) {
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

- (void)showViewControll:(UIViewController *)viewController
{
    [LNRouter showFromViewController:self toViewControll:viewController];
}

@end
