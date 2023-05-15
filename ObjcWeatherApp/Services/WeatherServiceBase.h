//
//  WeatherServiceBase.h
//  ObjcWeatherApp
//
//  Created by Дмитрий Дудкин on 15.05.2023.
//

#ifndef WeatherServiceBase_h
#define WeatherServiceBase_h

@protocol WeatherServiceBase <NSObject>

- (void)getWeather:(NSString *)city callback:(void (^)(BOOL , NSString *))callback;

@end


#endif /* WeatherServiceBase_h */
