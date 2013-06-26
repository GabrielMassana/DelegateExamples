//
//  WebViewViewController.m
//  DelegateExamples
//
//  Created by Gabriel Massana on 26/06/2013.
//  Copyright (c) 2013 Gabriel Massana. All rights reserved.
//

#import "WebViewViewController.h"

@interface WebViewViewController ()

@end

@implementation WebViewViewController
{
    UIActivityIndicatorView *activityIndicator;
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


    activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(290, 10, 20, 20)];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [activityIndicator startAnimating];
    [activityIndicator setColor:[UIColor blackColor]];
    [self.view addSubview:activityIndicator];
    
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 40, 320, 420)];
    NSURL *url = [[NSURL alloc]initWithString:@"https://iosdevelopmenttutorials.wordpress.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [webView setScalesPageToFit:YES];
    webView.delegate = self;
    [webView setBackgroundColor:[UIColor clearColor]];
    webView.scrollView.bounces = YES;
    [self.view addSubview:webView];
    
    
    CGRect screenRect = [[UIScreen mainScreen]bounds];
    if((UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad) && screenRect.size.height > 480)
    {
        [webView setFrame:CGRectMake(0, 40, 320, 420+88)];
    }

}

#pragma mark Button

- (void) backButtonClicked: (id) sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark UIWebViewDelegate

- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    [activityIndicator removeFromSuperview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
