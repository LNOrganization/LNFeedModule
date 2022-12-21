//
//  LNComment.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/31.
//

#import <LNCommonKit/LNCommonKit.h>

NS_ASSUME_NONNULL_BEGIN

@class LNUser;

@interface LNComment : LNJSONModel

@property(nonatomic, copy) NSString *commentId;

@property(nonatomic, copy) NSString *feedId;

@property(nonatomic, copy) NSString *content;

@property(nonatomic, strong) LNUser *creator;

@end

NS_ASSUME_NONNULL_END
