EMNotificationPopup
==============================
![](https://dl.dropboxusercontent.com/u/37783784/EMNotificationPopup.gif)

EMNotificationPopup is a customizable, easy and ready to use notification Popup with nice animations.

* Built to be Universal
* Uses ARC (Automatic Reference Counting)
* Support iOS > 6.0
* T reusable component

## How to install it?
### CocoaPods
The recommended approach is to install `EMNotificationPopup` via [CocoaPods](http://cocoapods.org/).

``` bash
platform :ios, '6.0'
pod 'EMNotificationPopup', '~> 0.1'
```

And then install running
``` bash
$ pod install
```

And now open the project in Xcode from the .xcworkspace file, not from the project file

``` bash
$ open YourOwnProject.xcworkspace
```

### Source Code
Alternatively you can just copy all the files included in the folder [EMNotificationPopup](https://github.com/ennioma/EMNotificationPopup/tree/master/EMNotificationPopup) and start playing with it!

## How it works?
### EMNotificationPopup Class

```objective-c
@interface EMNotificationPopup : UIView

@property NSObject <EMNotificationPopupDelegate> *delegate;

- (id) initWithImage:(UIImage *)image andTitle:(NSString *)title andSubTitle:(NSString *) subtitle andButtonTitle:(NSString *)buttonTitle;
- (id) initWithView:(UIView *)view;

- (void) dismissWithAnimation:(BOOL) animate;
- (BOOL) isVisible;
- (void) show;
- (void) showWithEnterDirection:(EMNotificationPopupDirection)enterDirection andExitDirection:(EMNotificationPopupDirection) exitDirection;

@end
```
    
### EMNotificationPopupDelegate Protocol

```objective-c
@protocol EMNotificationPopupDelegate
- (void) emActionClicked;
@end
```

## How to use it?
### Example - Use the default popup view
```objective-c
    EMNotificationPopup *notificationPopup = [[EMNotificationPopup alloc] initWithImage:[UIImage imageNamed:@"alert_image"] andTitle:@"Hi, this is an alert message!" andSubTitle:@"Sorry for this message :)" andButtonTitle:@"OK"];
    notificationPopup.delegate = self;
    [notificationPopup showWithEnterDirection:EMNotificationPopupToDown andExitDirection:EMNotificationPopupToLeft];
```

### Example - Use a custom view
```objective-c
    UIView *simpleView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 100.0f)];
    simpleView.backgroundColor = [UIColor purpleColor];
    
    UIButton *dismissMe = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 70.0f, 100.0f, 30.0f)];
    dismissMe.backgroundColor = [UIColor grayColor];
    [simpleView addSubview:dismissMe];
    [dismissMe addTarget:self action:@selector(dismissCustomView) forControlEvents:UIControlEventTouchDown];

    _notificationPopup = [[EMNotificationPopup alloc] initWithView:simpleView];
    _notificationPopup.delegate = self;
    [_notificationPopup showWithEnterDirection:EMNotificationPopupToRight andExitDirection:EMNotificationPopupToDown];
```

## Help me improving this!
How? Simply feel free to fork the project and improve it!

If you would like to contact me:
Twitter: [ennioma](https://twitter.com/ennioma).
Email: ennio.masi@gmail.com