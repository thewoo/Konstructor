//
//  TestViewController.m
//  MagicTests
//
//  Created by Jorge Pardo on 18/04/13.
//  Copyright (c) 2013 TreeNovum. All rights reserved.
//

#import "TestViewController.h"


@interface TestViewController ()

@property BOOL isTapped;
@property BOOL isTranformingView;
@property BOOL onFirstHalf;
@property BOOL onWeekView;

@property (nonatomic, weak) IBOutlet UIView *draggingView;
@property (nonatomic, weak) IBOutlet UIView *calendarView;
@property (nonatomic, weak) IBOutlet UIView *transformingView;
@property (nonatomic, weak) IBOutlet UIView *weekView;

@property float previousX;
@property float previousY;


@end

@implementation TestViewController


#pragma mark Actions.

-(void)viewTapped:(UITapGestureRecognizer *)tap {
    self.isTapped = YES;
    NSLog(@"%d",self.isTapped);
    
}



#pragma mark UIViewController's.

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    self.isTapped = CGRectContainsPoint(self.draggingView.bounds, [[touches anyObject] locationInView:self.draggingView]);
    self.isTranformingView = CGRectContainsPoint(self.transformingView.bounds, [[touches anyObject] locationInView:self.transformingView]);
    
    if (self.isTranformingView) {
        
        CGRect rect = self.transformingView.bounds;
        rect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width*0.75, rect.size.height);
        
        //        UIView *rectView = [[UIView alloc] initWithFrame:rect];
        //        rectView.backgroundColor = [UIColor redColor];
        //
        //        [self.transformingView addSubview:rectView];
        
        self.onFirstHalf = CGRectContainsPoint(rect, [[touches anyObject] locationInView:self.transformingView]);
    }
    
    
    self.previousX = [[touches anyObject] locationInView:self.view].x;
    self.previousY = [[touches anyObject] locationInView:self.view].y;
    
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (self.isTapped) {
        self.draggingView.center = [[touches anyObject] locationInView:self.view];
        
        self.onWeekView = CGRectContainsPoint(self.weekView.bounds, [[touches anyObject] locationInView:self.weekView]);
        
        if (self.onWeekView) {
            
            UIView *shadowView = [[UIView alloc] initWithFrame:self.view.frame];
            shadowView.backgroundColor = [UIColor blackColor];
            shadowView.alpha = 0;
            
            [self.view addSubview:shadowView];
            
            [self.view bringSubviewToFront:self.weekView];
            [self.view bringSubviewToFront:self.draggingView];
            
            [UIView animateWithDuration:0.5 animations:^{
                
                shadowView.alpha = 0.8;
                self.weekView.frame = CGRectMake(5, self.weekView.frame.origin.y, 310, self.weekView.frame.size.height);
                self.weekView.backgroundColor = [UIColor cyanColor];
                
                self.draggingView.backgroundColor = [UIColor purpleColor];
//                self.draggingView.frame = CGRectMake(self.draggingView.frame.origin.x, self.draggingView.frame.origin.y, self.draggingView.frame.size.width, self.draggingView.frame.size.height*0.5);
                
            }];
            
            
        }
        
    }
    
    
    if (self.isTranformingView) {
        
        if (!self.onFirstHalf) {
            
            float actualX = [[touches anyObject] locationInView:self.view].x;
            
            if (actualX > self.previousX) {
                
                self.transformingView.frame = CGRectMake(self.transformingView.frame.origin.x, self.transformingView.frame.origin.y, self.transformingView.frame.size.width+(actualX - self.previousX), self.transformingView.frame.size.height);
                
                self.previousX = actualX;
                
            } else {
                
                self.transformingView.frame = CGRectMake(self.transformingView.frame.origin.x, self.transformingView.frame.origin.y, self.transformingView.frame.size.width-(self.previousX - actualX), self.transformingView.frame.size.height);
                
                self.previousX = actualX;
            }
            
            
        } else {
            
            self.transformingView.center = [[touches anyObject] locationInView:self.view];
        }
    }
    
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.isTapped = NO;
    self.isTranformingView = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

@end
