//
//  WorkingSheetViewController.m
//  Konstructor
//
//  Created by Jorge Pardo on 18/04/13.
//  Copyright (c) 2013 TreeNovum. All rights reserved.
//

#import "WorkingSheetViewController.h"
#import "TestViewController.h"

@interface WorkingSheetViewController ()

@end

@implementation WorkingSheetViewController


#pragma mark UIViewController's.

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.navigationController pushViewController:[[TestViewController alloc] initWithNibName:@"TestViewController" bundle:nil] animated:YES];
}


@end
