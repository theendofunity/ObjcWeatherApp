//
//  NSURL+Query.m
//  ObjcWeatherApp
//
//  Created by Дмитрий Дудкин on 15.05.2023.
//

#import "NSURL+Query.h"

@implementation NSURL (Query)

//+ (nonnull NSURL *)queryWithString:(nonnull NSString *)URL queryElements:(nonnull NSDictionary<NSString *,NSString *> *)queryElements {
//    NSMutableArray<NSURLQueryItem *> *mQueryItems = [NSMutableArray array];
//
//    for (NSString *key in queryElements) {
//        NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:key value:queryElements[key]];
//        [mQueryItems addObject:queryItem];
//    }
//
//    NSURLComponents *components = [NSURLComponents componentsWithURL:URL resolvingAgainstBaseURL:YES];
//    components.queryItems = [mQueryItems copy];
//
//    return components.URL;;
//}

- (NSDictionary<NSString *, NSString *> *)queryComponents {
    NSMutableDictionary *components = [NSMutableDictionary new];
    NSArray *queryItems = [self.query componentsSeparatedByString:@"&"];
    for (NSString *queryItem in queryItems) {
        NSArray *keyValue = [queryItem componentsSeparatedByString:@"="];
        if (keyValue.count == 2) {
            NSString *key = [keyValue[0] stringByRemovingPercentEncoding];
            NSString *value = [keyValue[1] stringByRemovingPercentEncoding];
            components[key] = value;
        }
    }
    return components;
}

- (instancetype)initWithBaseURL:(NSString *)baseURL queryComponents:(NSDictionary<NSString *, NSString *> *)queryComponents {
    NSURLComponents *components = [ NSURLComponents componentsWithString:baseURL ];
    NSMutableArray<NSURLQueryItem *> *queryItems = [NSMutableArray arrayWithArray:components.queryItems];
    [queryComponents enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *value, BOOL *stop) {
        [queryItems addObject:[NSURLQueryItem queryItemWithName:key value:value]];
    }];
    components.queryItems = queryItems;
    
    return components.URL;
}

@end
