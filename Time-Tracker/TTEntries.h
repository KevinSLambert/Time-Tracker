//
//  TTEntries.h
//  Time-Tracker
//
//  Created by Kevin Lambert on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTEntries : NSObject

@property (nonatomic, strong) NSDate *startTime;
@property (nonatomic, strong) NSDate *endTime;

- (id)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)entryDictionary;


@end
