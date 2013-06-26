//
//  ScrollViewViewController.m
//  DelegateExamples
//
//  Created by Gabriel Massana on 26/06/2013.
//  Copyright (c) 2013 Gabriel Massana. All rights reserved.
//

#import "ScrollViewViewController.h"

@interface ScrollViewViewController ()

@end

@implementation ScrollViewViewController
{
    UILabel *labelNumber;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton setFrame:CGRectMake(5 , 5, 50, 30)];
    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    UIScrollView *scrollViewDemo = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 40, 320, 420)];
    [scrollViewDemo setBackgroundColor:[UIColor lightGrayColor]];
    scrollViewDemo.delegate = self;
    [self.view addSubview:scrollViewDemo];
    
    labelNumber = [[UILabel alloc]initWithFrame:CGRectMake(80, 5, 220, 30)];
    [labelNumber setFont:[UIFont fontWithName:@"Helvetica" size:25]];
    [labelNumber setTextAlignment:NSTextAlignmentCenter];
    [labelNumber setText:@"1"];
    [self.view addSubview:labelNumber];
    
    
    CGRect screenRect = [[UIScreen mainScreen]bounds];
    if((UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad) && screenRect.size.height > 480)
    {
        [scrollViewDemo setFrame:CGRectMake(0, 40, 320, 420+88)];
    }
    
    
    int position = 20;
    for (int i = 1; i < 6 ; i++)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(position, 100, 280, 220)];
        [label setFont:[UIFont fontWithName:@"Helvetica" size:155]];
        [label setBackgroundColor:[UIColor darkGrayColor]];
        [label setText:[NSString stringWithFormat:@"%d",i]];
        [label setTextAlignment:NSTextAlignmentCenter];
        [scrollViewDemo addSubview:label];
        
        position +=320;
    }
    [scrollViewDemo setContentSize:CGSizeMake(position-20, 420)];
    [scrollViewDemo setPagingEnabled:YES];
}
#pragma mark Button

- (void) backButtonClicked: (id) sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark UIScrollViewDelegate


- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int position = (scrollView.contentOffset.x/320) + 1;
    [labelNumber setText:[NSString stringWithFormat:@"%d", position]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
