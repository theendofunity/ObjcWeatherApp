//
//  WeatherService.h
//  ObjcWeatherApp
//
//  Created by Дмитрий Дудкин on 12.05.2023.
//

#ifndef WeatherService_h
#define WeatherService_h

@interface WeatherService: NSObject

- (NSString *) getWeather: (NSString *) city;

@end

#endif /* WeatherService_h */
