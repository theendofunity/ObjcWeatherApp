//
//  WeatherService.h
//  ObjcWeatherApp
//
//  Created by Дмитрий Дудкин on 12.05.2023.
//

#ifndef WeatherService_h
#define WeatherService_h

#import "WeatherServiceBase.h"
#import "NSURL+Query.h"

@interface WeatherService: NSObject <WeatherServiceBase>

+ (NSURL *) getUrl: (NSString *) cityName;

- (void)getWeather:(NSString *)city callback:(void (^)(BOOL , NSString *))callback;

@end

#endif /* WeatherService_h */
