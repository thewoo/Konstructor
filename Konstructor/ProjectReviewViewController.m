//
//  ProjectReviewViewController.m
//  Konstructor
//
//  Created by Jorge Pardo on 17/04/13.
//  Copyright (c) 2013 TreeNovum. All rights reserved.
//

#import "ProjectReviewViewController.h"

@interface ProjectReviewViewController ()

@property (nonatomic, copy) NSArray *projectInfoArray;
@property (nonatomic, copy) NSArray *economicInfoArray;
@property (nonatomic, copy) NSArray *manPowerInfoArray;
@property (nonatomic, copy) NSArray *otherExpensesArray;

@property (nonatomic, weak) IBOutlet UITableView *reviewsTableView;

@end

@implementation ProjectReviewViewController


#pragma mark UITableView's DataSource & Delegate.

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    int numberOfRows = 0;
    
    if (section == 1) {
        numberOfRows = [self.projectInfoArray count];
        
    } else if (section == 2) {
        numberOfRows = [self.manPowerInfoArray count];
        
    } else if (section == 3) {
        numberOfRows = [self.economicInfoArray count];
    }
    
    
    return numberOfRows;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    if ([indexPath section] == 1) {
        cell.textLabel.text = [self.projectInfoArray objectAtIndex:[indexPath row]];
        
    } else if ([indexPath section] == 2) {
        cell.textLabel.text = [self.manPowerInfoArray objectAtIndex:[indexPath row]];
        
    } else if ([indexPath section] == 3) {
        cell.textLabel.text = [self.economicInfoArray objectAtIndex:[indexPath row]];
    }
    
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString *headerString;
    
    
    if (section == 1) {
        headerString = @"Información General";
        
    } else if (section == 2) {
        headerString = @"Trabajadores Propios";
        
    } else if (section == 3) {
        headerString = @"Información Económica";
    }
    
    
    return headerString;
}



#pragma mark UIViewController's.

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.projectInfoArray = [[NSArray alloc] initWithObjects:@"Nombre: Dirección de la Obra", @"Cliente: Nombre del Cliente", @"Fecha de Inicio: 22/21/33", @"Fecha Prevista de Finalización: 21/21/21", @"Comisión: 3.000 € Pepito", nil];
    self.manPowerInfoArray = [[NSArray alloc] initWithObjects:@"Trabajadores asignados: 5", @"Total a pagar: 19.000 €", nil];
    self.economicInfoArray = [[NSArray alloc] initWithObjects:@"Presupuesto: 15.000.000 €", @"Entregas (Total): 7.000 €", @"Otros Gastos: 12.032" , nil];
    
}


@end
