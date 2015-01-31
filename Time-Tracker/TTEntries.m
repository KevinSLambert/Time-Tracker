//
//  TTEntries.m
//  Time-Tracker
//
//  Created by Kevin Lambert on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "TTEntries.h"

@implementation TTEntries

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        
        self.startTime = dictionary[@"startTime"];
        self.endTime = dictionary[@"endTime"];
        
    }
    return self;
}

- (NSDictionary *)entryDictionary {
    
    NSMutableDictionary *entryDictionary = [NSMutableDictionary new];
    
    if (self.startTime) {
        [entryDictionary setObject:self.startTime forKey:@"startTime"];
    }
    if (self.endTime) {
        [entryDictionary setObject:self.endTime forKey:@"endTime"];
    }
    
    return entryDictionary;
}

@end
