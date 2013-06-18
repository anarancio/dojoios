//
//  DojoNetworkUtils.m
//  dojoiOS
//
//  Created by Alejandro Narancio on 6/15/13.
//  Copyright (c) 2013 Alejandro Narancio. All rights reserved.
//

#import "DojoNetworkUtils.h"
#import <CFNetwork/CFNetwork.h>
#import <netinet/in.h>
#import <netdb.h>
#import <ifaddrs.h>
#import <arpa/inet.h>
#import <net/ethernet.h>
#import <net/if_dl.h>

@implementation DojoNetworkUtils

+(NSArray*) findIPFromUrl: (NSString*) url {
    CFHostRef hostRef = CFHostCreateWithName(kCFAllocatorDefault, (__bridge CFStringRef)url);
    
    BOOL success = CFHostStartInfoResolution(hostRef, kCFHostAddresses, nil);
    if (!success) {
        // something went wrong
        return nil;
    }
    CFArrayRef addressesRef = CFHostGetAddressing(hostRef, nil);
    if (addressesRef == nil) {
        // couldn't found any address
        return nil;
    }
    
    // Convert these addresses into strings.
    char ipAddress[INET6_ADDRSTRLEN];
    NSMutableArray *addresses = [NSMutableArray array];
    CFIndex numAddresses = CFArrayGetCount(addressesRef);
    for (CFIndex currentIndex = 0; currentIndex < numAddresses; currentIndex++) {
        struct sockaddr *address = (struct sockaddr *)CFDataGetBytePtr(CFArrayGetValueAtIndex(addressesRef, currentIndex));
        if (address == nil) {
            return nil;
        }
        getnameinfo(address, address->sa_len, ipAddress, INET6_ADDRSTRLEN, nil, 0, NI_NUMERICHOST);
        if (ipAddress == nil) {
            return nil;
        }
        [addresses addObject:[NSString stringWithCString:ipAddress encoding:NSASCIIStringEncoding]];
    }
    
    return addresses;
}

@end
