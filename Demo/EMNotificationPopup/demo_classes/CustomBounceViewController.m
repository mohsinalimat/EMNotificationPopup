//
//  CustomBounceViewController.m
//  EMNotificationPopup
//
//  Created by Ennio Masi on 18/11/14.
//  Copyright (c) 2014 Ennio Masi. All rights reserved.
//

#import "CustomBounceViewController.h"

@interface CustomBounceViewController ()

@end

@implementation CustomBounceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)showPopupWithoutBounce:(id)sender {
    [self generatePopup];
    [_notificationPopup setBouncePower:EMNotificationPopupNoBounce];
    [_notificationPopup show];
}

- (IBAction)showPopupWithWeakBounce:(id)sender {
    [self generatePopup];
    [_notificationPopup setBouncePower:EMNotificationPopupBounceWeak];
    [_notificationPopup show];
}

- (IBAction)showPopupWithMediumBounce:(id)sender {
    [self generatePopup];
    [_notificationPopup setBouncePower:EMNotificationPopupBounceMedium];
    [_notificationPopup show];
}

- (IBAction)showPopupWithStrongBounce:(id)sender {
    [self generatePopup];
    [_notificationPopup setBouncePower:EMNotificationPopupBounceStrong];
    [_notificationPopup show];
}

- (void) dismissMe {
    [_notificationPopup dismissWithAnimation:YES];
}

- (void) generatePopup {
    _notificationPopup = [[EMNotificationPopup alloc] initWithType:EMNotificationPopupBigButton enterDirection:EMNotificationPopupToDown exitDirection:EMNotificationPopupToRight popupPosition:EMNotificationPopupPositionCenter];
    _notificationPopup.delegate = self;
    
    _notificationPopup.title = @"Sorry for this Alert message :)";
    _notificationPopup.subtitle = @"Awesome message :)";
    _notificationPopup.image = [UIImage imageNamed:@"alert_image"];
    _notificationPopup.actionTitle = @"OK";
}

#pragma mark - EMNotificationPopupDelegate
- (void) emNotificationPopupActionClicked {
    [_notificationPopup dismissWithAnimation:YES];
}

- (void) dismissCustomView {
    [_notificationPopup dismissWithAnimation:YES];
}
@end