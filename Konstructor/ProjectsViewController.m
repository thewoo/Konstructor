//
//  ProjectsViewController.m
//  Konstructor
//
//  Created by Jorge Pardo on 16/04/13.
//  Copyright (c) 2013 TreeNovum. All rights reserved.
//

#import "ProjectsViewController.h"
#import "ProjectReviewViewController.h"

@interface ProjectsViewController ()

@property (nonatomic, copy) NSArray *projectsArray;
@property (nonatomic, weak) IBOutlet UITableView *projectsTableView;

@end

@implementation ProjectsViewController


#pragma mark UITableView's DataSource & Delegate.

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.projectsArray count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text = [self.projectsArray objectAtIndex:[indexPath row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ProjectReviewViewController *projectReviewController = [[ProjectReviewViewController alloc] initWithNibName:@"ProjectReviewViewController" bundle:nil];
    projectReviewController.title = @"Dirección de la Obra";
    
    [self.navigationController pushViewController:projectReviewController animated:YES];
}




#pragma mark UIViewController's.

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.projectsArray = [[NSArray alloc] initWithObjects:@"Cirilo Amorós 88", @"Guardia Civil 13", @"Fernando el Católico 53", @"Colón 24", nil];
    
}

@end
