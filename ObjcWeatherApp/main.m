//
//  main.m
//  ObjcWeatherApp
//
//  Created by Дмитрий Дудкин on 12.05.2023.
//

#import <Foundation/Foundation.h>
#import "WeatherService.h"

void getWeather(void);
dispatch_semaphore_t semaphore;

int main(int argc, const char * argv[]) {
    semaphore = dispatch_semaphore_create(0);
    
    @autoreleasepool {
        while (YES) {
            getWeather();
            
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
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
    
    [service getWeather:cityNameString callback:^(BOOL, NSString *data) {
        NSLog(@"%@", data);
        
        dispatch_semaphore_signal(semaphore);
    }];
}
