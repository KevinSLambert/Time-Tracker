//
//  TTDetailViewController.m
//  Time-Tracker
//
//  Created by Kevin Lambert on 1/27/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "TTDetailViewController.h"
#import "TTProjectController.h"

@interface TTDetailViewController ()<UITableViewDelegate, UITextFieldDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TTDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleField.text = self.project.title;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.titleField.delegate = self;
    self.timeLabel.text = [self.project projectTime];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addButton:(id)sender {
    
}

- (IBAction)clockInButton:(id)sender {
    
    [self.project startNewEntry];
    [self.tableView reloadData];

}

- (IBAction)clockOutButton:(id)sender {
    
    [self.project endCurrentEntry];
    [self.tableView reloadData];
    
}

- (IBAction)reportButton:(id)sender {
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    self.project.title = textField.text;
    [[TTProjectController sharedInstance] synchronize];
    
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.project.entries count];
    
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EntryCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"EntryCell"];
    }
    
    TTEntries *entry = [self.project entries][indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", entry.startTime, entry.endTime];
    
    return cell;
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
