//
//  RCTLottie.m
//  RCTLottie
//
//  Created by uking on 2018/3/1.
//  Copyright © 2018年 uking. All rights reserved.
//

#import "RCTLottieView.h"
#import "UIView+React.h"


@implementation RCTLottieView {
    LOTAnimationView *_animationView;
}

- (void)reactSetFrame:(CGRect)frame
{
    [super reactSetFrame:frame];
    if (_animationView != nil) {
        [_animationView reactSetFrame:frame];
    }
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    if (_animationView != nil) {
        _animationView.animationProgress = _progress;
    }
}

- (void)setSpeed:(CGFloat)speed {
    _speed = speed;
    if (_animationView != nil) {
        _animationView.animationSpeed = _speed;
    }
}

- (void)setLoop:(BOOL)loop {
    _loop = loop;
    if (_animationView != nil) {
        _animationView.loopAnimation = _loop;
    }
}

- (void)setResizeMode:(NSString *)resizeMode {
    if ([resizeMode isEqualToString:@"cover"]) {
        [self setContentMode:UIViewContentModeScaleAspectFill];
    } else if ([resizeMode isEqualToString:@"contain"]) {
        [self setContentMode:UIViewContentModeScaleAspectFit];
    } else if ([resizeMode isEqualToString:@"center"]) {
        [self setContentMode:UIViewContentModeCenter];
    }
}

- (void)setSourceJson:(NSString *)jsonString {
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData
                                                         options:kNilOptions
                                                           error:nil];
    [self replaceAnimationView:[LOTAnimationView animationFromJSON:json]];
}

- (void)setSourceName:(NSString *)name {
    [self replaceAnimationView:[LOTAnimationView animationNamed:name]];
}

- (void)play {
    if (_animationView != nil) {
        [_animationView play];
    }
}

- (void)playFromFrame:(NSNumber *)startFrame
              toFrame:(NSNumber *)endFrame {
    if (_animationView != nil) {
        [_animationView playFromFrame:startFrame
                              toFrame:endFrame withCompletion:nil];
    }
}

- (void)reset {
    if (_animationView != nil) {
        _animationView.animationProgress = 0;
        [_animationView pause];
    }
}

# pragma mark Private

- (void)replaceAnimationView:(LOTAnimationView *)next {
    if (_animationView != nil) {
        [_animationView removeFromSuperview];
    }
    _animationView = next;
    [self addSubview: next];
    [_animationView reactSetFrame:self.frame];
    [_animationView setContentMode:UIViewContentModeScaleAspectFit];
    [self applyProperties];
}

- (void)applyProperties {
    _animationView.animationProgress = _progress;
    _animationView.animationSpeed = _speed;
    _animationView.loopAnimation = _loop;
}

@end


