//
//  RCTLottieView.h
//  RCTLottie
//
//  Created by uking on 2018/3/1.
//  Copyright © 2018年 uking. All rights reserved.
//


#import "RCTView.h"
#import "Lottie.h"

@interface RCTLottieView : RCTView

@property (nonatomic, assign) BOOL loop;
@property (nonatomic, assign) CGFloat speed;
@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, strong) NSDictionary *sourceJson;
@property (nonatomic, strong) NSString *sourceName;

- (void)play;
- (void)playFromFrame:(NSNumber *)startFrame
              toFrame:(NSNumber *)endFrame;
- (void)reset;

@end

