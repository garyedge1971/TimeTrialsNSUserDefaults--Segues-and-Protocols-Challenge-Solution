//
//  SignInViewController.h
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Robert Finch on 02/05/2014.
//  Copyright (c) 2014 Robert Finch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateAccountViewController.h"

@interface SignInViewController : UIViewController <CreateAccountViewControllerDelegate>

- (IBAction)createAccountButtonPressed:(UIBarButtonItem *)sender;
- (IBAction)loginButtonPressed:(UIButton *)sender;

@end
