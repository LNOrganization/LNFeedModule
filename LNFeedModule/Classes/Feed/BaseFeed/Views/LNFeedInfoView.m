//
//  LNFeedInfoView.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/31.
//

#import "LNFeedInfoView.h"
#import "LNUIKitHelper.h"

@implementation LNFeedInfoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatSubviews];
        [self updateSubviewsLayout];
    }
    return self;
}

- (void)creatSubviews
{
    self.likeCountLabel = [self createCommonLabel];
    self.commentCountLabel = [self createCommonLabel];
    self.storeCountLabel = [self createCommonLabel];
    
    self.likeImageView = [self createCommonImageView];
    [self.likeImageView setTitle:@"赞" forState:UIControlStateNormal];
    [self.likeImageView addTarget:self action:@selector(clickOnLike) forControlEvents:UIControlEventTouchUpInside];
    
    self.commentImageView = [self createCommonImageView];
    [self.commentImageView setTitle:@"评论" forState:UIControlStateNormal];
    [self.commentImageView addTarget:self action:@selector(clickOnCommment) forControlEvents:UIControlEventTouchUpInside];
    
    self.storeImageView = [self createCommonImageView];
    [self.storeImageView setTitle:@"收藏" forState:UIControlStateNormal];
    [self.storeImageView addTarget:self action:@selector(clickOnStore) forControlEvents:UIControlEventTouchUpInside];
}

- (UILabel *)createCommonLabel
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.font = [UIFont systemFontOfSize:9];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor grayColor];
    label.backgroundColor = [UIColor greenColor];
    [self addSubview:label];
    return label;
}

- (UIButton *)createCommonImageView
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
    button.backgroundColor = [UIColor redColor];
    button.layer.cornerRadius = 4;
    button.layer.masksToBounds = YES;
    button.userInteractionEnabled = YES;
    button.titleLabel.font = [UIFont systemFontOfSize12];
    [self addSubview:button];
    return button;
}

- (void)updateSubviewsLayout
{
    CGFloat hSpaceOfLabel = 5;//横向间距
    CGFloat vSpace = 2;//纵向间距
    CGFloat count = 3;//列数
    CGFloat labelWidth = (self.frame.size.width - (count - 1)*hSpaceOfLabel)/count;
    CGFloat labelHeigth = 10;
    CGFloat imageWidth = self.frame.size.height - vSpace;
//    CGFloat hSpaceOfImage = hSpaceOfLabel;
    if (imageWidth > labelWidth) {
        imageWidth = labelWidth;
    }
    
    for (NSInteger i = 0; i < count; i++) {
        CGFloat xOfLabel = i*(hSpaceOfLabel + labelWidth);
        CGFloat xOfImage = xOfLabel + (labelWidth - imageWidth)/2;
        switch (i) {
            case 0:
                self.likeCountLabel.frame = CGRectMake(xOfLabel, 0, labelWidth, labelHeigth);
                self.likeImageView.frame = CGRectMake(xOfImage, vSpace+labelHeigth, imageWidth, imageWidth);
                break;
            case 1:
                self.commentCountLabel.frame = CGRectMake(xOfLabel, 0, labelWidth, labelHeigth);
                self.commentImageView.frame = CGRectMake(xOfImage, vSpace+labelHeigth, imageWidth, imageWidth);
                break;
            case 2:
                self.storeCountLabel.frame = CGRectMake(xOfLabel, 0, labelWidth, labelHeigth);
                self.storeImageView.frame = CGRectMake(xOfImage, vSpace+labelHeigth, imageWidth, imageWidth);
                break;
            default:
                break;
        }
    }
}

- (void)reloadWithData:(LNFeed *)feedModel
{
    self.likeCountLabel.text = [NSString stringWithFormat:@"%@",@(feedModel.likeCount)];
    self.commentCountLabel.text = [NSString stringWithFormat:@"%@",@(feedModel.commentCount)];
    self.storeCountLabel.text = [NSString stringWithFormat:@"%@",@(feedModel.storeCount)];
}

- (void)clickOnLike
{
    
    [self.delegate feedInfoView:self clikeOnLikeButton:self.likeImageView];
}

- (void)clickOnCommment
{
    [self.delegate feedInfoView:self clikeOnCommentButton:self.commentImageView];
}

- (void)clickOnStore
{
    [self.delegate feedInfoView:self clikeOnStoreButton:self.storeImageView];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
