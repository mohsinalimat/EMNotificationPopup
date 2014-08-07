//
//  CustomViewController.m
//  EMNotificationPopup
//
//  Created by Ennio Masi on 07/08/14.
//  Copyright (c) 2014 Ennio Masi. All rights reserved.
//

#import "CustomViewController.h"

@interface CustomViewController ()

@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)showCustomPopupOnTop:(id)sender {
    [self coreManagementWithPosition:EMNotificationPopupPositionTop];
}

- (IBAction)showCustomPopupOnBottom:(id)sender {
    [self coreManagementWithPosition:EMNotificationPopupPositionBottom];
}

- (IBAction)showCustomPopupCentered:(id)sender {
    [self coreManagementWithPosition:EMNotificationPopupPositionCenter];
}

- (void) coreManagementWithPosition: (EMNotificationPopupPosition) position {
    if (_notificationPopup.isVisible) {
        [_notificationPopup dismissWithAnimation:YES];
        _notificationPopup = NULL;
    } else {
        UIView *shownView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 250.0f, 125.0f)];
        shownView.backgroundColor = [UIColor redColor];

        UIButton *closeMe = [[UIButton alloc] initWithFrame:CGRectMake(shownView.frame.size.width - 25.0f, 3.0f, 22.0f, 22.0f)];
        closeMe.backgroundColor = [UIColor clearColor];
        [closeMe setBackgroundImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        [closeMe addTarget:self action:@selector(dismissMe) forControlEvents:UIControlEventTouchDown];
        [shownView addSubview:closeMe];
        
        _notificationPopup = [[EMNotificationPopup alloc] initWithView:shownView enterDirection:EMNotificationPopupToRight exitDirection:EMNotificationPopupToRight popupPosition:position];
        _notificationPopup.delegate = self;
        
        [_notificationPopup show];
    }
}

- (void) dismissMe {
    [_notificationPopup dismissWithAnimation:YES];
}

#pragma mark - EMNotificationPopupDelegate
- (void) emNotificationPopupActionClicked {
    [_notificationPopup dismissWithAnimation:YES];
}

- (void) dismissCustomView {
    [_notificationPopup dismissWithAnimation:YES];
}
@end