//
//  PoemService.h
//  Poem
//
//  Created by wuhuping on 14-6-23.
//  Copyright (c) 2014年 wuhuping. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Poem;
@interface PoemService : NSObject

- (void)fetchPoemMenu:(void(^)(BOOL isSuccess, id responseObject))response;
- (void)fetchPoemContentBypoem:(Poem*)poem
                      response:(void(^)(BOOL isSuccess, id responseObject))response;
@end
