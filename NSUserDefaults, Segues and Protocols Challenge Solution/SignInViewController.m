//
//  SignInViewController.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Robert Finch on 02/05/2014.
//  Copyright (c) 2014 Robert Finch. All rights reserved.
//

#import "SignInViewController.h"
#import "CreateAccountViewController.h"
#import "RTFViewController.h"
#import "UserAccount.h"

@interface SignInViewController ()

@property (strong, nonatomic) NSMutableArray *userAccounts;
@property (strong, nonatomic) UserAccount *addedUserAccount;

@end

@implementation SignInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//Lazy instantiation of added user account
-(UserAccount *)addedUserAccount{
    if (!_addedUserAccount) {
        _addedUserAccount = [[UserAccount alloc] init];
    }
    return _addedUserAccount;
}

//Lazy instantiation of user accounts
-(NSMutableArray *)userAccounts{
    if (!_userAccounts) {
        _userAccounts = [[NSMutableArray alloc] init];
    }
    return _userAccounts;
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

#pragma mark - Protocol Methods
-(BOOL) doesAccountExistAlready:(NSString *)addedUsername;
{
//    BOOL foundAccount = NO;
    for (UserAccount *userAccount in self.userAccounts) {
        if ([userAccount.username isEqualToString:addedUsername]) {
            return YES;
        }
    }
    return NO;
}
-(void) didCreateAccount:(NSString *)addedUsername didAddPassword:(NSString *)addedUserPassword;
{
    self.addedUserAccount.username = addedUsername;
    self.addedUserAccount.password = addedUserPassword;
    
    [self.userAccounts addObject:self.addedUserAccount];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void) didCancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    //Introspection
    if ([segue.destinationViewController isKindOfClass:[CreateAccountViewController class]]) {
        CreateAccountViewController *createAccountVC = segue.destinationViewController;
        createAccountVC.delegate = self;
    }
    else if ([segue.destinationViewController isKindOfClass:[RTFViewController class]])
    {
//        RTFViewController *loggedInVC = [[RTFViewController alloc] init];
        RTFViewController *loggedInVC = segue.destinationViewController;
        loggedInVC.loggedUserInAccount.username = self.usernameTextField.text;
        loggedInVC.loggedUserInAccount.password = self.passwordTextField.text;
    }

}


- (IBAction)createAccountButtonPressed:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"toCreateAccountViewController" sender:sender];
    
}

- (IBAction)loginButtonPressed:(UIButton *)sender {
//    NSLog(@"Number of user accounts = %i", self.userAccounts.count);
    for (UserAccount *userAccount in self.userAccounts) {
        if ([self.usernameTextField.text isEqualToString:userAccount.username]) {
            if ([self.passwordTextField.text isEqualToString:userAccount.password]) {
                [self performSegueWithIdentifier:@"toViewController" sender:sender];
                return;
            } else
            {
                //Password is incorrect
                UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Password Incorrect" message:@"The password you entered is incorrect." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [errorAlert show];
                return;
            }
        }
    }
    //Username not found
    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Username Unknown" message:@"Username not found. Please try again or create an account." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [errorAlert show];
    return;
}
@end
