//
//  NSString+Dojoios.m
//  dojoiOS
//
//  Created by Alejandro Narancio on 6/17/13.
//  Copyright (c) 2013 Alejandro Narancio. All rights reserved.
//

#import "NSString+Dojoios.h"

@implementation NSString (Dojoios)

- (int) lastIndexOf: (NSString*) str {
    NSRange range = [self rangeOfString:str options:NSBackwardsSearch];
    if (range.length > 0) {
        return range.location;
    } else {
        return -1;
    }
}

@end
