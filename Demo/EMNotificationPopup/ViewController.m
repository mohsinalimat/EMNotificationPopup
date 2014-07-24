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

- (IBAction)showCustomPopup:(id)sender {
    UIView *simpleView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 100.0f)];
    simpleView.backgroundColor = [UIColor purpleColor];
    
    
    UIButton *dismissMe = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 70.0f, 100.0f, 30.0f)];
    dismissMe.backgroundColor = [UIColor grayColor];
    [simpleView addSubview:dismissMe];
    
    _notificationPopup = [[EMNotificationPopup alloc] initWithView:simpleView];
    _notificationPopup.delegate = self;
    [_notificationPopup showWithEnterDirection:EMNotificationPopupToRight andExitDirection:EMNotificationPopupToDown];
    
    [dismissMe addTarget:self action:@selector(dismissCustomView) forControlEvents:UIControlEventTouchDown];
}

#pragma mark - EMNotificationPopupDelegate
- (void) emActionClicked {
    [_notificationPopup dismissWithAnimation:YES];
}

- (void) dismissCustomView {
    [_notificationPopup dismissWithAnimation:YES];
}

@end