//
//  ApiKeys.h
//  ObjcWeatherApp
//
//  Created by Дмитрий Дудкин on 15.05.2023.
//

#ifndef ApiKeys_h
#define ApiKeys_h

/*
 enum with query parameters
 */

typedef NS_ENUM(NSInteger, ApiParameters) {
    Key = 0,
    City,
};

static NSString *const ApiParametersValue[] = {
    @"key",
    @"q"
};

NSString *stringForEnumValue(ApiParameters enumValue) {
    return ApiParametersValue[enumValue];
}

#endif /* ApiKeys_h */
