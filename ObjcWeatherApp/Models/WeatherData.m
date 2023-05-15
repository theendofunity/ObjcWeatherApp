//
//  WeatherData.m
//  ObjcWeatherApp
//
//  Created by Дмитрий Дудкин on 15.05.2023.
//

#import <Foundation/Foundation.h>
#import "WeatherData.h"

@implementation WeatherData

@synthesize name;
@synthesize currentWeather;

- (instancetype)initWithData:(NSDictionary *)data { 
    NSDictionary *location = data[@"location"];
    name = location[@"name"];
    
    NSDictionary *current = data[@"current"];
    currentWeather = [(NSNumber *)current[@"temp_c"] doubleValue];
    
    return self;
}

- (NSString *)formatWeather {
    return [NSString stringWithFormat:@"%@ - %f°C", self.name, self.currentWeather];
}

@end
