//
//  ViewController.m
//  TEST_SUBVIEWS
//
//  Created by Colas on 30/04/2015.
//  Copyright (c) 2015 cassiopeia. All rights reserved.
//

#import "ViewController.h"
#import "ColorViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (nonatomic, strong, readwrite) ColorViewController * colorVC ;
@end

@implementation ViewController

+ (void)fillView:(UIView *)bigView
        withView:(UIView *)view
{
    view.translatesAutoresizingMaskIntoConstraints = NO ;
    //     view.translatesAutoresizingMaskIntoConstraints = YES ;
    
    view.frame = bigView.bounds ;
    
    [bigView addSubview:view] ;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.colorVC = [ColorViewController new] ;
    
    UIView * newView = [UIView new] ;
    newView.backgroundColor = [UIColor blackColor] ;
    
    [[self class] fillView:self.mainView
                  withView:self.colorVC.view] ;
}



- (IBAction)log:(id)sender {
    UIView * view = [[self.mainView subviews] firstObject] ;
    
   NSLog(@"%@",view) ;
}

- (IBAction)fillWithNormalView:(id)sender
{
    for (UIView * view in [self.mainView subviews])
    {
        [view removeFromSuperview] ;
    }
    
    UIView * newView = [UIView new] ;
    newView.backgroundColor = [UIColor blackColor] ;
    
    [ViewController fillView:self.mainView
                    withView:newView] ;
}

@end
