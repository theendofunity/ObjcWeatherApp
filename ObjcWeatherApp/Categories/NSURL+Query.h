//
//  NSURL+Query.h
//  ObjcWeatherApp
//
//  Created by Дмитрий Дудкин on 15.05.2023.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURL (Query)

//+ (NSURL *)queryWithString:(NSString *)URL queryElements:(NSDictionary<NSString *,NSString *> *)queryElements;

- (NSDictionary<NSString *, NSString *> *)queryComponents;
- (instancetype)initWithBaseURL:(NSURL *)baseURL queryComponents:(NSDictionary<NSString *, NSString *> *)queryComponents;


@end

NS_ASSUME_NONNULL_END
