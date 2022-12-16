//
//  LNNetworkConfig.m
//  LNCommonKit
//
//  Created by Lenny on 2022/12/2.
//

#import "LNNetworkConfig.h"
#import "LNNetworkManager.h"

NSString *LNRequestSerializationErrorDomain = @"LNRequestSerializationErrorDomain";
NSString *LNResponseSerializationErrorDomain = @"LNResponseSerializationErrorDomain";


NSString *LNHTTPMethodWithType(LNHTTPMethodType type){
    switch (type) {
        case LNHTTPMethodTypeGet:
            return @"GET";
            break;
        case LNHTTPMethodTypePost:
            return @"POST";
            break;
        case LNHTTPMethodTypePut:
            return @"PUT";
            break;
        case LNHTTPMethodTypeDelete:
            return @"DELETE";
            break;
        case LNHTTPMethodTypeHead:
            return @"HEAD";
            break;
        case LNHTTPMethodTypePatch:
            return @"PATCH";
            break;
        default:
            return nil;
            break;
    }
    return @"GET";
}

NSString *LNURLPathWithBaseURLAppendPath(NSString *host, NSString *path)
{
    if (!path) {
        path = @"";
    }else if (![path hasPrefix:@"/"]) {
        path = [@"/" stringByAppendingString:path];
    }
    return [NSString stringWithFormat:@"%@%@", host, path];
}


@implementation LNNetworkConfig

+ (instancetype)sharedInstance
{
    static LNNetworkConfig *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
    });
    return  instance;
}

@synthesize baseURL = _baseURL;

@synthesize commonParameters = _commonParameters;

@synthesize commonUserInfo = _commonUserInfo;

@synthesize commonHeaders = _commonHeaders;


- (NSString *)baseURL
{
    if (!_baseURL) {
        _baseURL = @"https://www.baidu.com";
    }
    return _baseURL;
}

- (NSDictionary *)_commonParameters
{
    if (!_commonParameters) {
        _commonParameters = @{};
    }
    return _commonParameters;
}

- (NSDictionary *)commonHeaders
{
    if (!_commonHeaders) {
        _commonHeaders =  @{};
    }
    return _commonHeaders;
}

- (NSDictionary *)commonUserInfo
{
    if (!_commonUserInfo) {
        _commonUserInfo = @{};
    }
    return _commonUserInfo;
}

- (void)configNetWorkManager
{
    
}

+(void)load
{
    [LNNetworkManager sharedInstance].httpClient = (id)[self sharedInstance];
}

@end
