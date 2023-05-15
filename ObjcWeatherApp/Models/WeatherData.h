//
//  WeatherData.h
//  ObjcWeatherApp
//
//  Created by Дмитрий Дудкин on 15.05.2023.
//

#ifndef WeatherData_h
#define WeatherData_h

#import <Foundation/Foundation.h>

@interface WeatherData : NSObject

@property NSString *name;
@property float currentWeather;

- (instancetype)initWithData:(NSDictionary *)data NS_DESIGNATED_INITIALIZER;

- (NSString *) formatWeather;

@end

#endif /* WeatherData_h */
