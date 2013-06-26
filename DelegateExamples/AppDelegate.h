//
//  AppDelegate.h
//  DelegateExamples
//
//  Created by Gabriel Massana on 26/06/2013.
//  Copyright (c) 2013 Gabriel Massana. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@end
