//
//  LNBaseTableViewController.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/30.
//

#import <UIKit/UIKit.h>
#import "LNBaseListModelController.h"
#import "LNBaseViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface LNBaseTableViewController : LNBaseViewController<UITableViewDataSource, UITableViewDelegate, LNListDataResponseDelegate>

@property (nonatomic, strong) id<LNListModelControllerAdaptar> modelController;

@property (nonatomic, strong, readonly) NSArray *dataArray;

@property (nonatomic, assign) BOOL isFirst;

@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;

@property(nonatomic, strong) UITableView *tableView;

- (void)reloadTableViewCell:(UITableViewCell *)cell;

@end

NS_ASSUME_NONNULL_END
