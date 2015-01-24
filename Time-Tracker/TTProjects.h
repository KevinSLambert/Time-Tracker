//
//  TTProjects.h
//  Time-Tracker
//
//  Created by Kevin Lambert on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTEntries.h"

@interface TTProjects : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *entries;

-(void)addEntry:(TTEntries *)entry;
-(void)removeEntry:(TTEntries *)entry;


@end
