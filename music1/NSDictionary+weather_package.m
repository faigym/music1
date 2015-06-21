//
//  NSDictionary+weather_package.m
//  WeatherTutorial
//
//  Created by Scott on 26/01/2013.
//  Updated by Joshua Greene 16/12/2013.
//
//  Copyright (c) 2013 Scott Sherwood. All rights reserved.
//

#import "NSDictionary+weather_package.h"

@implementation NSDictionary (weather_package)

//- (NSDictionary *)artists
//{
//    NSDictionary *dict = self[@"data"];
//    NSArray *ar = dict[@"artsits"];
//    return ar[0];
//}

- (NSDictionary *)request
{
    NSDictionary *dict = self[@"data"];
    NSArray *ar = dict[@"request"];
    return ar[0];
}

- (NSArray *)artists
{
    NSDictionary *dict = self[@"data"];
    return dict[@"artists"];
}

@end