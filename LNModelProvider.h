//
//  LNModelProvider.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/9/3.
//

#import <Foundation/Foundation.h>
#import "LNRequestManager.h"


typedef NSString *LNHTTPRequestPathString NS_STRING_ENUM;

NS_ASSUME_NONNULL_BEGIN

@interface LNModelProvider : NSObject<LNHTTPRequestDelegate>

@property(nonatomic, strong) LNHTTPRequest *request;

@end

NS_ASSUME_NONNULL_END
