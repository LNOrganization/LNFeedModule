//
//  LNBaseTableViewCell.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/9/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LNBaseTableViewCell : UITableViewCell

//子类型重写，更新cell的数据
- (void)reloadWithData:(id)data;

//子类型重写，更新cell的布局
- (void)updateSubviewsLayout;

//子类型重写，更新cell的样式
- (void)updateSubviewsStyle;

@end

NS_ASSUME_NONNULL_END
