//
//  NSDictionary+weather.m
//  Weather
//
//  Created by Scott on 26/01/2013.
//  Updated by Joshua Greene 16/12/2013.
//
//  Copyright (c) 2013 Scott Sherwood. All rights reserved.
//

#import "NSDictionary+weather.h"

@implementation NSDictionary (weather)

- (NSNumber *)id
{
    NSString *cc = self[@"id"];
    NSNumber *n = @([cc intValue]);
    return n;
}

-(NSString *)name
{
    return self[@"name"];
}

@end