//
//  LNBaseCollectionViewController.h
//  FBSnapshotTestCase
//
//  Created by Lenny on 2021/10/21.
//

#import <UIKit/UIKit.h>
#import "LNBaseListModelController.h"
#import "LNBaseViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface LNBaseCollectionViewController : LNBaseViewController<UICollectionViewDataSource, UICollectionViewDelegate, LNListDataResponseDelegate>

@property (nonatomic, strong) id<LNListModelControllerAdaptar> modelController;

@property (nonatomic, strong, readonly) NSArray *dataArray;

@property (nonatomic, assign) BOOL isFirst;


@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;

@property(nonatomic, strong) UICollectionView *collectionView;

- (UICollectionView *)creatCollectionView;

- (void)reloadCollectionViewCell:(UICollectionViewCell *)cell;


@end

NS_ASSUME_NONNULL_END
