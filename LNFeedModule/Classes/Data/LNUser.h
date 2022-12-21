//
//  LNUser.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/30.
//

#import <LNCommonKit/LNCommonKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LNUser : LNJSONModel

@property(nonatomic, copy) NSString *userId;

@property(nonatomic, copy) NSString *name;

@property(nonatomic, copy) NSString *nikeName;

@property(nonatomic, copy) NSString *portraitUrl;

@end

NS_ASSUME_NONNULL_END
