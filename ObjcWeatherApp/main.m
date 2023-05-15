//
//  main.m
//  ObjcWeatherApp
//
//  Created by Дмитрий Дудкин on 12.05.2023.
//

#import <Foundation/Foundation.h>
#import "WeatherService.h"

void getWeather(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while (YES) {
            getWeather();
        }
        
    }
    return 0;
}

void getWeather(void) {
    NSLog(@"Enter city name");
    
    char cityName[56];
    
    scanf("%s", cityName);
    
    NSLog(@"Your choice");
    NSLog(@"%s", cityName);
    
    NSString *cityNameString = [[NSString alloc] initWithBytes:cityName length:strlen(cityName) encoding:NSUTF8StringEncoding];

    WeatherService *service = [[WeatherService alloc] init];
    
    NSString * weather = [service getWeather:cityNameString];
    
    NSLog(@"%@", weather);
}
