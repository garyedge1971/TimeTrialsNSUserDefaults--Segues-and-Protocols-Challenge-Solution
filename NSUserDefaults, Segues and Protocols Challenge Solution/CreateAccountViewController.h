//
//  CreateAccountViewController.h
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Robert Finch on 02/05/2014.
//  Copyright (c) 2014 Robert Finch. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CreateAccountViewControllerDelegate <NSObject>
-(void) didCreateAccount;
-(void) didCancel;

@end

@interface CreateAccountViewController : UIViewController

#define USER_NAME @"username"
#define USER_PASSWORD @"password"

@property (weak, nonatomic) id <CreateAccountViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordTextField;
- (IBAction)createButtonPressed:(UIButton *)sender;
- (IBAction)cancelButtonPressed:(UIButton *)sender;

@end
