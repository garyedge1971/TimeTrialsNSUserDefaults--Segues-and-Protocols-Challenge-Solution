//
//  RTFViewController.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Robert Finch on 02/05/2014.
//  Copyright (c) 2014 Robert Finch. All rights reserved.
//

#import "RTFViewController.h"


@interface RTFViewController ()

@end

@implementation RTFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.untitledLabel1.text = self.loggedUserInAccount.username;
    self.untitledLabel2.text = self.loggedUserInAccount.password;
}

//Lazy instantiation of logged in user account
-(UserAccount *)loggedUserInAccount{
    if (!_loggedUserInAccount) {
        _loggedUserInAccount = [[UserAccount alloc] init];
    }
    return _loggedUserInAccount;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
