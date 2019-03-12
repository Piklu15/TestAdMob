//
//  ViewController.m
//  TestGAD
//
//  Created by Piklu Majumder-401 on 3/8/19.
//  Copyright © 2019 Piklu Majumder-401. All rights reserved.
//

@import GoogleMobileAds;
#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()<GADBannerViewDelegate>
@property (strong, nonatomic)  GADBannerView *gADBannerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    AppDelegate * delegate = [AppDelegate shared];

    self.gADBannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
    [self positionBannerViewAtBottomOfSafeArea:self.gADBannerView];

    // Replace this ad unit ID with your own ad unit ID.
    self.gADBannerView.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
    self.gADBannerView.rootViewController = [delegate rootViewcontrollerForBannerAd];
    GADRequest *request = [GADRequest request];
    request.testDevices = @[ kGADSimulatorID ];

    [self.gADBannerView loadRequest:request];


    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

}


- (void)positionBannerViewAtBottomOfSafeArea:(UIView *_Nonnull)bannerView NS_AVAILABLE_IOS(11.0) {
    // Position the banner. Stick it to the bottom of the Safe Area.
    // Centered horizontally.

    AppDelegate * delegate = [AppDelegate shared];
    UIView * rootViewForBannerAd = [delegate windowRootView];

    self.gADBannerView.translatesAutoresizingMaskIntoConstraints = NO;
    [rootViewForBannerAd addSubview:self.gADBannerView];
    UILayoutGuide *guide = rootViewForBannerAd.safeAreaLayoutGuide;
    [NSLayoutConstraint activateConstraints:@[
                                              [self.gADBannerView.centerXAnchor constraintEqualToAnchor:guide.centerXAnchor],
                                              [self.gADBannerView.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor]
                                              ]];
}

/// Tells the delegate an ad request loaded an ad.
- (void)adViewDidReceiveAd:(GADBannerView *)adView {
    NSLog(@"adViewDidReceiveAd");
}

/// Tells the delegate an ad request failed.
- (void)adView:(GADBannerView *)adView
didFailToReceiveAdWithError:(GADRequestError *)error {
    NSLog(@"adView:didFailToReceiveAdWithError: %@", [error localizedDescription]);
}

/// Tells the delegate that a full-screen view will be presented in response
/// to the user clicking on an ad.
- (void)adViewWillPresentScreen:(GADBannerView *)adView {
    NSLog(@"adViewWillPresentScreen");
}

/// Tells the delegate that the full-screen view will be dismissed.
- (void)adViewWillDismissScreen:(GADBannerView *)adView {
    NSLog(@"adViewWillDismissScreen");
}

/// Tells the delegate that the full-screen view has been dismissed.
- (void)adViewDidDismissScreen:(GADBannerView *)adView {
    NSLog(@"adViewDidDismissScreen");
}

/// Tells the delegate that a user click will open another app (such as
/// the App Store), backgrounding the current app.
- (void)adViewWillLeaveApplication:(GADBannerView *)adView {
    NSLog(@"adViewWillLeaveApplication");
}


@end
