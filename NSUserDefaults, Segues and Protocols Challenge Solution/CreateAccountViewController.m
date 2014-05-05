//
//  CreateAccountViewController.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Robert Finch on 02/05/2014.
//  Copyright (c) 2014 Robert Finch. All rights reserved.
//

#import "CreateAccountViewController.h"
#import "UserAccount.h"

@interface CreateAccountViewController ()

@end

@implementation CreateAccountViewController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)createButtonPressed:(UIButton *)sender {
//    NSLog(@"Username text field has %@",self.userNameTextField.text);
    if ([self.userNameTextField.text isEqualToString:@""]) {
        UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Missing Username" message:@"Please enter a username" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [errorAlert show];
        return;
    }
    if ([self.passwordTextField.text isEqualToString:@""]) {
        UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Missing Password" message:@"Please enter a password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [errorAlert show];
        return;
    }
    if ([self.confirmPasswordTextField.text isEqualToString:@""]) {
        UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Confirm Password" message:@"Please confirm your password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [errorAlert show];
        return;
    }
    if (![self.passwordTextField.text isEqualToString:self.confirmPasswordTextField.text]) {
        UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Passwords No Matchy" message:@"The entered passwords do not match" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [errorAlert show];
        self.passwordTextField.text = @"";
        self.confirmPasswordTextField.text = @"";
        //set focus back to passwordTextField
        [self.passwordTextField becomeFirstResponder];
        return;
    }
    if ([self.delegate doesAccountExistAlready:self.userNameTextField.text]) {
        UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Username Exists" message:@"That username already exists" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [errorAlert show];
        self.userNameTextField.text = @"";
        [self.userNameTextField becomeFirstResponder];
        return;
    }
    [self.delegate didCreateAccount];
}

- (IBAction)cancelButtonPressed:(UIButton *)sender {
    [self.delegate didCancel];
}
@end
