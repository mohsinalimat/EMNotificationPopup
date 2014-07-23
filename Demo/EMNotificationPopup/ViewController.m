//
//  ViewController.m
//  EMNotificationPopup
//
//  Created by Ennio Masi on 23/07/14.
//  Copyright (c) 2014 Ennio Masi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize notificationPopup = _notificationPopup;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)showFromTop:(id)sender {
    _notificationPopup = [[EMNotificationPopup alloc] initWithImage:[UIImage imageNamed:@"alert_image"] andTitle:@"Hi, this is an alert message!" andSubTitle:@"Sorry for this message :)" andButtonTitle:@"OK"];
    _notificationPopup.delegate = self;
    [_notificationPopup showWithEnterDirection:EMNotificationPopupToDown andExitDirection:EMNotificationPopupToDown];
}

- (IBAction)showFromRight:(id)sender {
    _notificationPopup = [[EMNotificationPopup alloc] initWithImage:[UIImage imageNamed:@"alert_image"] andTitle:@"Hi, this is an alert message!" andSubTitle:@"Sorry for this message :)" andButtonTitle:@"OK"];
    _notificationPopup.delegate = self;
    
    [_notificationPopup showWithEnterDirection:EMNotificationPopupToLeft andExitDirection:EMNotificationPopupToLeft];
}

- (IBAction)showFromBottom:(id)sender {
    _notificationPopup = [[EMNotificationPopup alloc] initWithImage:[UIImage imageNamed:@"alert_image"] andTitle:@"Hi, this is an alert message!" andSubTitle:@"Sorry for this message :)" andButtonTitle:@"OK"];
    _notificationPopup.delegate = self;
    
    [_notificationPopup showWithEnterDirection:EMNotificationPopupToTop andExitDirection:EMNotificationPopupToTop];
}

- (IBAction)showFromLeft:(id)sender {
    _notificationPopup = [[EMNotificationPopup alloc] initWithImage:[UIImage imageNamed:@"alert_image"] andTitle:@"Hi, this is an alert message!" andSubTitle:@"Sorry for this message :)" andButtonTitle:@"OK"];
    _notificationPopup.delegate = self;
    
    [_notificationPopup showWithEnterDirection:EMNotificationPopupToRight andExitDirection:EMNotificationPopupToRight];
}

#pragma mark - EMNotificationPopupDelegate
- (void) emActionClicked {
    [_notificationPopup dismissWithAnimation:YES];
}

@end