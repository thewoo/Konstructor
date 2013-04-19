//
//  WorkersViewController.m
//  Konstructor
//
//  Created by Jorge Pardo on 19/04/13.
//  Copyright (c) 2013 TreeNovum. All rights reserved.
//

#import "WorkersViewController.h"
#import "WorkingSheetViewController.h"

@interface WorkersViewController ()

@property (nonatomic, copy) NSArray *workersArray;
@property (nonatomic, weak) IBOutlet UITableView *workersTableView;

-(IBAction)pushToWorkingSheet:(id)sender;

@end

@implementation WorkersViewController

#pragma mark IBActions.

-(IBAction)pushToWorkingSheet:(id)sender {
    
    WorkingSheetViewController *workingSheetViewController = [[WorkingSheetViewController alloc] initWithNibName:@"WorkingSheetViewController" bundle:nil];
    workingSheetViewController.title = @"Working Sheet";
    
    [self.navigationController pushViewController:workingSheetViewController animated:YES];
}


#pragma mark UITableView's DataSource & Delegate.

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.workersArray count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [self.workersArray objectAtIndex:[indexPath row]];
    
    return cell;
}


#pragma mark UIViewController's.

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.workersArray = @[@"Pepito: 80%", @"Juanito: 50%", @"Jaimito: 33%", @"Carlitos: 87%", @"Esteban: 65%"];
    
}


@end
