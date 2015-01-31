//
//  TTProjects.m
//  Time-Tracker
//
//  Created by Kevin Lambert on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "TTProjects.h"
#import "TTEntries.h"

#import "TTProjectController.h"

@interface TTProjects ()

@property (nonatomic, strong) TTEntries *currentEntry;

@end

@implementation TTProjects

-(id)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        self.title = dictionary[@"title"];
        
        NSMutableArray *entries = [NSMutableArray new];
        for (NSDictionary *entry in dictionary[entries]) {
            [entries addObject:[[TTEntries alloc] initWithDictionary:entry]];
        }
        
        self.entries = entries;
            
        }
    return self;
    
}

- (NSDictionary *)projectDictionary {
    
    NSMutableDictionary *projectDictionary = [NSMutableDictionary new];
    if (self.title) {
        [projectDictionary setObject:self.title forKey:@"title"];
    }
    
    NSMutableArray *entries = [NSMutableArray new];
    for (TTEntries *entry in self.entries) {
        [entries addObject:[entry entryDictionary]];
    }
    [projectDictionary setObject:entries forKey:entries];
    
    return projectDictionary;
}

-(void)addEntry:(TTEntries *)entry {
    
    if (!entry) {
        return;
    }
    
    NSMutableArray *mutableEntries = [[NSMutableArray alloc] initWithArray:self.entries];
    [mutableEntries addObject:entry];
    
    self.entries = mutableEntries;
    
}

-(void)removeEntry:(TTEntries *)entry {
    
    if (!entry) {
        return;
    }
    
    NSMutableArray *mutableEntries = self.entries.mutableCopy;
    [mutableEntries removeObject:entry];
    
    self.entries = mutableEntries;
    
}

- (void)startNewEntry {
    
    TTEntries *entry = [TTEntries new];
    entry.startTime = [NSDate date];
    
    self.currentEntry = entry;
    
    [self addEntry:entry];
    
}

- (void)endCurrentEntry {
    
    self.currentEntry.endTime = [NSDate date];
    [self synchronize];
    
}

- (void)synchronize {
    
    [[TTProjectController sharedInstance] synchronize];
    
}

- (NSString *)projectTime {
    
    NSInteger totalHours = 0;
    NSInteger totalMinutes = 0;
    
    for (TTEntries *entry in self.entries) {
        
        NSTimeInterval distanceBetweenDates = [entry.endTime timeIntervalSinceDate:entry.startTime];
        
        // First we'll see how many hours
        double secondsInAnHour = 3600;
        NSInteger hoursBetweenDates = distanceBetweenDates / secondsInAnHour;
        
        // We need to subtract out the hours and then see how many minutes
        double secondsInAMinute = 60;
        NSInteger minutesBetweenDates = (distanceBetweenDates - (hoursBetweenDates * secondsInAnHour)) / secondsInAMinute;
        
        totalHours += hoursBetweenDates;
        totalMinutes += minutesBetweenDates;
        
    }
    
    // If the hour or minute total is less than 10, we want a 0 before it in the string
    
    NSString *hourString = totalHours < 10 ? [NSString stringWithFormat:@"0%ld", (long)totalHours] : [NSString stringWithFormat:@"%ld", (long)totalHours];
    
    NSString *minuteString = totalMinutes < 10 ? [NSString stringWithFormat:@"0%ld", (long)totalMinutes] : [NSString stringWithFormat:@"%ld", (long)totalMinutes];
    
    return [NSString stringWithFormat:@"%@:%@", hourString, minuteString];
}

@end
