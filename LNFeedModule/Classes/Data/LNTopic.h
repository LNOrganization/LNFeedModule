//
//  LNTopic.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/31.
//

#import <LNCommonKit/LNCommonKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LNTopic : LNJSONModel

@property(nonatomic, copy) NSString *topicId;

@property(nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
