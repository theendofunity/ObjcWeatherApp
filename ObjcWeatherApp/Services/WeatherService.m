//
//  WeatherService.m
//  ObjcWeatherApp
//
//  Created by Дмитрий Дудкин on 12.05.2023.
//

#import <Foundation/Foundation.h>
#import "WeatherService.h"
#import "Constants.h"
#import "WeatherData.h"
#import "ApiParameters.h"

@implementation WeatherService


- (void)getWeather:(NSString *)city callback:(void (^)(BOOL , NSString *))callback {
    NSURL *url = [WeatherService getUrl:city];
    
    // Create a URL request object with the URL
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];

    // Set the HTTP method (GET, POST, PUT, DELETE, etc.)
    [request setHTTPMethod:@"GET"];

    // Create a session configuration object
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];

    // Create a session object with the configuration
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];

    // Create a data task with the request
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            // Handle the error
            callback(NO, error.description);
            return;
        }
        
        // Process the response data
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        WeatherData *weatherData = [ [WeatherData alloc] initWithData:json ];
        
        callback(YES, weatherData.formatWeather);
    }];

    // Start the data task
    [task resume];
}

+ (NSURL *)getUrl:(NSString *)cityName {
    NSString *baseURL = baseUrl;

    NSDictionary *items = @{
        stringForEnumValue(Key) : apiKey,
        stringForEnumValue(City) : cityName,
    };

    NSURL *URL = [[NSURL alloc] initWithBaseURL:baseURL queryComponents:items ];
    
    return URL;
}

@end

/*
 http://api.weatherapi.com/v1/current.json?key=891130e155144fc4886133819231205&q=London&aqi=no

 {
     "location": {
         "name": "London",
         "region": "City of London, Greater London",
         "country": "United Kingdom",
         "lat": 51.52,
         "lon": -0.11,
         "tz_id": "Europe/London",
         "localtime_epoch": 1684136605,
         "localtime": "2023-05-15 8:43"
     },
     "current": {
         "last_updated_epoch": 1684135800,
         "last_updated": "2023-05-15 08:30",
         "temp_c": 11.0,
         "temp_f": 51.8,
         "is_day": 1,
         "condition": {
             "text": "Partly cloudy",
             "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
             "code": 1003
         },
         "wind_mph": 11.9,
         "wind_kph": 19.1,
         "wind_degree": 340,
         "wind_dir": "NNW",
         "pressure_mb": 1019.0,
         "pressure_in": 30.09,
         "precip_mm": 0.0,
         "precip_in": 0.0,
         "humidity": 76,
         "cloud": 75,
         "feelslike_c": 8.8,
         "feelslike_f": 47.8,
         "vis_km": 10.0,
         "vis_miles": 6.0,
         "uv": 3.0,
         "gust_mph": 14.8,
         "gust_kph": 23.8
     }
 }
 */
