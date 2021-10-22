//
//  LNBaseTableViewCell.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/9/3.
//

#import "LNBaseTableViewCell.h"

@implementation LNBaseTableViewCell


//子类型重写，更新cell的数据
- (void)reloadWithData:(id)data
{
    
}

//子类型重写，更新cell的布局
- (void)updateSubviewsLayout
{
    
}

//子类型重写，更新cell的样式
- (void)updateSubviewsStyle
{
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
