//
//  SignInViewController.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Robert Finch on 02/05/2014.
//  Copyright (c) 2014 Robert Finch. All rights reserved.
//

#import "SignInViewController.h"
#import "CreateAccountViewController.h"

@interface SignInViewController ()

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
-(void) didCreateAccount
{

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
    CreateAccountViewController *createAccountVC = segue.destinationViewController;
    createAccountVC.delegate = self;
}


- (IBAction)createAccountButtonPressed:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"toCreateAccountViewController" sender:sender];
}

- (IBAction)loginButtonPressed:(UIButton *)sender {
    [self performSegueWithIdentifier:@"toViewController" sender:sender];
}
@end
