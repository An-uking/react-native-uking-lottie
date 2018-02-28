//
//  RCTLottie.m
//  RCTLottie
//
//  Created by uking on 2018/3/1.
//  Copyright © 2018年 uking. All rights reserved.
//
#import "RCTLottieView.h"
#import "RCTLottieViewManager.h"
#import "RCTBridge.h"
#import "RCTUIManager.h"
#import "Lottie.h"

@implementation RCTLottieViewManager

RCT_EXPORT_MODULE(LottieAnimationView)

- (UIView *)view
{
    return [RCTLottieView new];
}

+ (BOOL)requiresMainQueueSetup
{
    return YES;
}

- (NSDictionary *)constantsToExport
{
    return @{
             @"VERSION": @1,
             };
}

RCT_EXPORT_VIEW_PROPERTY(resizeMode, NSString)
RCT_EXPORT_VIEW_PROPERTY(sourceJson, NSString);
RCT_EXPORT_VIEW_PROPERTY(sourceName, NSString);
RCT_EXPORT_VIEW_PROPERTY(progress, CGFloat);
RCT_EXPORT_VIEW_PROPERTY(loop, BOOL);
RCT_EXPORT_VIEW_PROPERTY(speed, CGFloat);

RCT_EXPORT_METHOD(play:(nonnull NSNumber *)reactTag
                  fromFrame:(nonnull NSNumber *) startFrame
                  toFrame:(nonnull NSNumber *) endFrame)
{
    [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
        id view = viewRegistry[reactTag];
        if (![view isKindOfClass:[RCTLottieView class]]) {
            RCTLogError(@"Invalid view returned from registry, expecting LottieContainerView, got: %@", view);
        } else {
            RCTLottieView *lottieView = (RCTLottieView *)view;
            if ([startFrame intValue] != -1 && [endFrame intValue] != -1) {
                [lottieView playFromFrame:startFrame toFrame:endFrame];
            } else {
                [lottieView play];
            }
        }
    }];
}

RCT_EXPORT_METHOD(reset:(nonnull NSNumber *)reactTag)
{
    [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
        id view = viewRegistry[reactTag];
        if (![view isKindOfClass:[RCTLottieView class]]) {
            RCTLogError(@"Invalid view returned from registry, expecting LottieContainerView, got: %@", view);
        } else {
            RCTLottieView *lottieView = (RCTLottieView *)view;
            [lottieView reset];
        }
    }];
}

@end

