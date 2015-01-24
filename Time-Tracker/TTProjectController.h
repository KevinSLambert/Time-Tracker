//
//  TTProjectController.h
//  Time-Tracker
//
//  Created by Kevin Lambert on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTProjects.h"

@interface TTProjectController : NSObject

@property (readonly, nonatomic, strong) NSArray *projects;

+ (TTProjectController *)sharedInstance;

-(void)addProject:(TTProjects *)project;
-(void)removeProject:(TTProjects *)project;

-(void)synchronize;

@end
