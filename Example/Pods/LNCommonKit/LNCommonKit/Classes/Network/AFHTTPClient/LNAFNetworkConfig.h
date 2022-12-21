//
//  LNAFNetworkConfig.h.h
//  LNCommonKit
//
//  Created by Lenny on 2022/12/2.
//

#import <Foundation/Foundation.h>
#import <LNCommonKit/LNNetworkConst.h>


@interface LNAFNetworkConfig : NSObject<LNNetworkConfigAdapter>

+ (instancetype)sharedInstance;


@end

