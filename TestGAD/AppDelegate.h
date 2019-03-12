//
//  AppDelegate.h
//  TestGAD
//
//  Created by Piklu Majumder-401 on 3/8/19.
//  Copyright © 2019 Piklu Majumder-401. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property(strong,nonatomic) UIView * windowRootView;
@property(strong,nonatomic) UIViewController * rootViewcontrollerForBannerAd;
@property (strong, nonatomic) UIWindow *window;
+(AppDelegate *)shared;


@end

