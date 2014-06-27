//
//  AnimationHelper.h
//  Poem
//
//  Created by wuhuping on 14-6-23.
//  Copyright (c) 2014年 wuhuping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnimationHelper : NSObject

+ (CAAnimation *)animationWithOpacity:(CGFloat)fromValue
                              toValue:(CGFloat)toValue
                             duration:(CGFloat)duration;

+ (CAAnimation *)animationWithPosition:(CGPoint)fromValue
                               toValue:(CGPoint)toValue
                              duration:(CGFloat)duration;

+ (CAAnimationGroup *)animtaionGroupWithAnimations:(NSArray*)animations;
@end
