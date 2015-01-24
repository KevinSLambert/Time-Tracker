//
//  TTProjectController.m
//  Time-Tracker
//
//  Created by Kevin Lambert on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "TTProjectController.h"


@interface TTProjectController ()

@property (nonatomic, strong) NSArray *projects;

@end

@implementation TTProjectController

+ (TTProjectController *)sharedInstance {
    static TTProjectController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[TTProjectController alloc] init];
        
        [sharedInstance loadFromDefaults];
    });
    return sharedInstance;
}

-(void)addProject:(TTProjects *)project{
    
    if (!project) {
        return;
    }
    
    NSMutableArray *mutableProject = [[NSMutableArray alloc] initWithArray:self.projects];
    [mutableProject addObject:project];
    
    self.projects = mutableProject;
    
}

-(void)removeProject:(TTProjects *)project{
    
    if (!project) {
        return;
    }
    
    NSMutableArray *mutableProject = self.projects.mutableCopy;
    [mutableProject removeObject:project];
    
    self.projects = mutableProject;
    
}

-(void)loadFromDefaults {
    
    NSArray *projectDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:@"projectList"];
    
    NSMutableArray *projects = [NSMutableArray new];
    
    
    
    self.projects = projects;
}

-(void)synchronize{
    
    NSMutableArray *projectDictionaries = [NSMutableArray new];
    
    
    
    [[NSUserDefaults standardUserDefaults] setObject:projectDictionaries forKey:@"projectList"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

@end














