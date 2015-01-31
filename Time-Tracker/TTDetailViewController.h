//
//  TTDetailViewController.h
//  Time-Tracker
//
//  Created by Kevin Lambert on 1/27/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TTProjects;

@interface TTDetailViewController : UIViewController

@property (nonatomic, strong) TTProjects *project;

@end
