ENotificationPopup
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
pod 'EMNotificationPopup', '~> 0.2.3'
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

@property (nonatomic, strong) NSString *actionTitle;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *title;

// Init default View
- (id) initWithType: (EMNotificationPopupType) type enterDirection:(EMNotificationPopupDirection) enter exitDirection:(EMNotificationPopupDirection) exit popupPosition: (EMNotificationPopupPosition) position;

// Init custom view
- (id) initWithView:(UIView *)view enterDirection:(EMNotificationPopupDirection) enter exitDirection:(EMNotificationPopupDirection) exit popupPosition: (EMNotificationPopupPosition) position;

// Actions on the popup view
- (void) dismissWithAnimation:(BOOL) animate;
- (void) show;
- (BOOL) isVisible;

// (new in 0.2.2) Customize the bounce power
- (void) setBouncePower:(NSInteger) bouncePower;

// Customize the default view
- (void) setPopupActionBackgroundColor: (UIColor *) color;
- (void) setPopupActionTitleColor: (UIColor *) color;
- (void) setPopupBorderColor: (UIColor *)color;
- (void) setPopupBackgroundColor:(UIColor *)color;
- (void) setPopupSubtitleColor:(UIColor *)color;
- (void) setPopupTitleColor:(UIColor *)color;
@end
```
    
### EMNotificationPopupDelegate Protocol

```objective-c
@protocol EMNotificationPopupDelegate
- (void) emNotificationPopupActionClicked;
@end
```

## How to use it?
### Example - Use the default popup view
```objective-c
    EMNotificationPopup *notificationPopup = [[EMNotificationPopup alloc] initWithImage:[UIImage imageNamed:@"alert_image"] andTitle:@"Hi, this is an alert message!" andSubTitle:@"Sorry for this message :)" andButtonTitle:@"OK"];
    notificationPopup.delegate = self;
    [notificationPopup showWithEnterDirection:EMNotificationPopupToDown andExitDirection:EMNotificationPopupToLeft];
```

### Example - Use default views
An example about the use of a "Big" Notification Popup. This is a big (taller than larger) notification that is able to show an image, a title and a subtitle.
If you instantiate a EMNotificationPopupBigButton you can customize the action button title and color. This button is used to dismiss the view.

```objective-c
    _notificationPopup = [[EMNotificationPopup alloc] initWithType:notificationPopupType enterDirection:EMNotificationPopupToDown exitDirection:EMNotificationPopupToLeft popupPosition:position];
    _notificationPopup.delegate = self;
    
    _notificationPopup.title = @"Sorry for this Alert message :)";
    _notificationPopup.subtitle = @"Awesome message :)";
    _notificationPopup.image = [UIImage imageNamed:@"alert_image"];
    
    if (notificationPopupType == EMNotificationPopupBigButton)
        _notificationPopup.actionTitle = @"OK";
    
    [_notificationPopup show];
```

An example about the use of a "Slim" Notification Popup. This is a slim rectangular notification that is able to show just a title.

```objective-c
    _notificationPopup = [[EMNotificationPopup alloc] initWithType:EMNotificationPopupSlim enterDirection:EMNotificationPopupToDown exitDirection:EMNotificationPopupToLeft popupPosition:position];
    _notificationPopup.delegate = self;
    
    _notificationPopup.title = @"Sorry for this Alert message :)";
    
    [_notificationPopup show];
```

Both views can be easily customized using the following methods:
```objective-c
- (void) setPopupActionBackgroundColor: (UIColor *) color;
- (void) setPopupActionTitleColor: (UIColor *) color;
- (void) setPopupBorderColor: (UIColor *)color;
- (void) setPopupBackgroundColor:(UIColor *)color;
- (void) setPopupSubtitleColor:(UIColor *)color;
- (void) setPopupTitleColor:(UIColor *)color;
```



### Example - Use a custom view
```objective-c
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
```

## Apps using EMNotificationPopup 
  [Twists&Turns](https://itunes.apple.com/au/app/twists-and-turns/id909597408?l=it&ls=1&mt=8)

  [My Soldier for Battlefield 4](https://itunes.apple.com/us/app/my-soldier-for-battlefield-4/id718845676)
 
## Help me improving this!
How? Simply feel free to fork the project and improve it!

If you would like to contact me:
Twitter: [ennioma](https://twitter.com/ennioma).
Email: ennio.masi@gmail.com
