//
//  ViewController.m
//  EMNotificationPopup
//
//  Created by Ennio Masi on 23/07/14.
//  Copyright (c) 2014 Ennio Masi. All rights reserved.
//

#import "SlimViewController.h"

@interface SlimViewController ()

@end

@implementation SlimViewController

@synthesize notificationPopup = _notificationPopup;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)showSlimPopupOnTop:(id)sender {
    [self coreManagementWithPosition:EMNotificationPopupPositionTop];
}

- (IBAction)showSlimPopupOnBottom:(id)sender {
    [self coreManagementWithPosition:EMNotificationPopupPositionBottom];
}

- (void) coreManagementWithPosition: (EMNotificationPopupPosition) position {
    if (_notificationPopup.isVisible) {
        [_notificationPopup dismissWithAnimation:YES];
        _notificationPopup = NULL;
    } else {
        _notificationPopup = [[EMNotificationPopup alloc] initWithType:EMNotificationPopupSlim enterDirection:EMNotificationPopupToDown exitDirection:EMNotificationPopupToLeft popupPosition:position];
        _notificationPopup.delegate = self;
        
        _notificationPopup.title = @"Sorry for this Alert message :)";
        
        [_notificationPopup show];
    }
}

#pragma mark - EMNotificationPopupDelegate
- (void) emNotificationPopupActionClicked {
    [_notificationPopup dismissWithAnimation:YES];
}

- (void) dismissCustomView {
    [_notificationPopup dismissWithAnimation:YES];
}

@end