//
//  Common.m
//  Poem
//
//  Created by wuhuping on 14-7-1.
//  Copyright (c) 2014年 wuhuping. All rights reserved.
//

#import "Common.h"

@implementation Common

+ (CGSize)sizeOfString:(NSString *)str
                  font:(UIFont *)font
{
    if (kVersion < 7.0) {
        CGSize size = [str sizeWithFont:font constrainedToSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
        return size;
    }else {
        CGSize size = CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX);
        NSDictionary *attibutes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
        CGRect rect = [str boundingRectWithSize:size
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:attibutes
                                        context:NULL];
        return rect.size;
    }
}
@end
