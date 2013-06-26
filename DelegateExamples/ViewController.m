//
//  ViewController.m
//  DelegateExamples
//
//  Created by Gabriel Massana on 26/06/2013.
//  Copyright (c) 2013 Gabriel Massana. All rights reserved.
//

#import "ViewController.h"
#import "WebViewViewController.h"
#import "ScrollViewViewController.h"

#define TAG_ALERTVIEW_WEBVIEW 950

@interface ViewController ()

@end

@implementation ViewController
{
    UITextField *textFieldDemo;
    UIButton *buttonWeb;
    UIButton *buttonScrollView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    textFieldDemo = [[UITextField alloc]initWithFrame:CGRectMake(20, 40, 210, 50)];
    [textFieldDemo setBorderStyle:UITextBorderStyleRoundedRect];
    [textFieldDemo setPlaceholder:@"Type And Click Done"];
    [textFieldDemo setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [textFieldDemo setTextColor:[UIColor redColor]];
    textFieldDemo.delegate = self;
    [self.view addSubview:textFieldDemo];
    
    UIButton *buttonTextField = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonTextField setFrame:CGRectMake(240, 40, 60, 50)];
    [buttonTextField setTitle:@"DONE" forState:UIControlStateNormal];
    [buttonTextField addTarget:self action:@selector(buttonTextFieldClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonTextField];
    
    buttonWeb = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonWeb setFrame:CGRectMake(20, 110, 280, 50)];
    [buttonWeb setTitle:@"GoToWeb With UIAlert Delegate" forState:UIControlStateNormal];
    [buttonWeb addTarget:self action:@selector(buttonWebClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonWeb];
    
    buttonScrollView = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonScrollView setFrame:CGRectMake(20, 180, 280, 50)];
    [buttonScrollView setTitle:@"GoToScrollView With UIAlert" forState:UIControlStateNormal];
    [buttonScrollView addTarget:self action:@selector(buttonScrollViewClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonScrollView];
    
}

#pragma mark Buttons

- (void) buttonWebClicked: (id) sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"Open WebView?" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", @"CANCEL", nil];
    [alert setTag:TAG_ALERTVIEW_WEBVIEW];
    [alert show];
}


- (void) buttonScrollViewClicked: (id) sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"You are going directly to our ScrollView" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    
    ScrollViewViewController *scrollViewViewController = [[ScrollViewViewController alloc]initWithNibName:@"ScrollViewViewController" bundle:nil];
    scrollViewViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:scrollViewViewController animated:YES completion:nil];
}

- (void) buttonTextFieldClicked: (id) sender
{
    [textFieldDemo resignFirstResponder];
}


#pragma mark UIAlertViewDelegate

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == TAG_ALERTVIEW_WEBVIEW)
    {
        if (buttonIndex == 0)
        {
            WebViewViewController *webViewViewController = [[WebViewViewController alloc]initWithNibName:@"WebViewViewController" bundle:nil];
            webViewViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
            [self presentViewController:webViewViewController animated:YES completion:nil];
        }
    }
}


#pragma mark UITextFieldDelegate

- (void) textFieldDidEndEditing:(UITextField *)textField
{
    [textFieldDemo setTextColor:[UIColor blackColor]];
}

- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    [textFieldDemo setTextColor:[UIColor redColor]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
