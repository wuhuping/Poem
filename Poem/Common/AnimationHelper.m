//
//  AnimationHelper.m
//  Poem
//
//  Created by wuhuping on 14-6-23.
//  Copyright (c) 2014年 wuhuping. All rights reserved.
//

#import "AnimationHelper.h"

@implementation AnimationHelper

+ (CABasicAnimation *)animationWithkeyPath:(NSString *)keyPath
                                fromValule:(id)fromValue
                                   toValue:(id)toValue
                                  duration:(CGFloat)duration
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keyPath];
    [animation setDuration:duration];
    animation.fromValue = fromValue;
    animation.toValue = toValue;
    
    return animation;
}

+ (CAAnimationGroup *)animtaionGroupWithAnimations:(NSArray*)animations
{
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations =  animations;
    
    return group;
}

+ (CAAnimation *)animationWithOpacity:(CGFloat)fromValue
                              toValue:(CGFloat)toValue
                             duration:(CGFloat)duration
{
    return [AnimationHelper animationWithkeyPath:@"opacity"
                                      fromValule:[NSNumber numberWithFloat:fromValue]
                                         toValue:[NSNumber numberWithFloat:toValue]
                                        duration:duration];
}

+ (CAAnimation *)animationWithPosition:(CGPoint)fromValue
                               toValue:(CGPoint)toValue
                              duration:(CGFloat)duration
{
    CABasicAnimation *xPositionAnimation = [AnimationHelper animationWithkeyPath:@"position.x"
                                                                      fromValule:[NSNumber numberWithFloat:fromValue.x]
                                                                         toValue:[NSNumber numberWithFloat:toValue.x]
                                                                        duration:duration];
    CABasicAnimation *yPositionAnimation = [AnimationHelper animationWithkeyPath:@"position.y"
                                                                      fromValule:[NSNumber numberWithFloat:fromValue.y]
                                                                         toValue:[NSNumber numberWithFloat:toValue.y]
                                                                        duration:duration];
    CAAnimationGroup *group = [AnimationHelper animtaionGroupWithAnimations:[NSArray arrayWithObjects:xPositionAnimation, yPositionAnimation, nil]];
    
    return group;
}
@end
