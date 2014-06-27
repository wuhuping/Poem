//
//  CoreDataService.h
//  Poem
//
//  Created by wuhuping on 14-6-27.
//  Copyright (c) 2014年 wuhuping. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Poem;
@interface CoreDataService : NSObject

+ (id)sharedService;

- (void)insertPoem:(void(^)(Poem *poem))block;

- (void)saveContext;
@end
