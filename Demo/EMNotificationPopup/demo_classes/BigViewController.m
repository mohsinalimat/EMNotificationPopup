//
//  BigViewController.m
//  EMNotificationPopup
//
//  Created by Ennio Masi on 07/08/14.
//  Copyright (c) 2014 Ennio Masi. All rights reserved.
//

#import "BigViewController.h"

@interface BigViewController ()

@end

@implementation BigViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)showBigPopupOnTop:(id)sender {
    [self coreManagementWithPosition:EMNotificationPopupPositionTop andType:EMNotificationPopupBig];
}

- (IBAction)showBigPopupOnBottom:(id)sender {
    [self coreManagementWithPosition:EMNotificationPopupPositionBottom andType:EMNotificationPopupBig];
}

- (IBAction)showBigPopupCentered:(id)sender {
    [self coreManagementWithPosition:EMNotificationPopupPositionCenter andType:EMNotificationPopupBig];
}

- (IBAction)showBigPopupCenteredWithButton:(id)sender {
    [self coreManagementWithPosition:EMNotificationPopupPositionCenter andType:EMNotificationPopupBigButton];
}

- (void) coreManagementWithPosition: (EMNotificationPopupPosition) position andType:(EMNotificationPopupType) notificationPopupType {
    if (_notificationPopup.isVisible) {
        [_notificationPopup dismissWithAnimation:YES];
        _notificationPopup = NULL;
    } else {
        _notificationPopup = [[EMNotificationPopup alloc] initWithType:notificationPopupType enterDirection:EMNotificationPopupToDown exitDirection:EMNotificationPopupToLeft popupPosition:position];
        _notificationPopup.delegate = self;
        
        _notificationPopup.title = @"Sorry for this Alert message :)";
        _notificationPopup.subtitle = @"Awesome message :)";
        _notificationPopup.image = [UIImage imageNamed:@"alert_image"];
        
        if (notificationPopupType == EMNotificationPopupBigButton)
            _notificationPopup.actionTitle = @"OK";
        
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