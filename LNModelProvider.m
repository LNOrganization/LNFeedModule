//
//  LNModelProvider.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/9/3.
//

#import "LNModelProvider.h"

@interface LNModelProvider ()
@end

@implementation LNModelProvider

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)setRequest:(LNHTTPRequest *)request
{
    _request = request;
    _request.delegate = (id)self;
}

@end
