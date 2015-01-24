//
//  TTListViewController.m
//  Time-Tracker
//
//  Created by Kevin Lambert on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "TTListViewController.h"

@interface TTListViewController ()

@property (nonatomic, strong) UITableView *listTableView;

@end

@implementation TTListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.listTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.listTableView];
    
    self.listTableView.dataSource = self;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
