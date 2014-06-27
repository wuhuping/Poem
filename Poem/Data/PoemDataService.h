//
//  PoemDataService.h
//  Poem
//
//  Created by wuhuping on 14-6-23.
//  Copyright (c) 2014年 wuhuping. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
@interface PoemDataService : NSObject

- (void)fetchPoemMenu:(void(^)(AFHTTPRequestOperation *operation, id responseObject))success
                 fail:(void(^)(AFHTTPRequestOperation *operation, NSError *error))fail;
- (void)fetchPoemContentByID:(NSString *)poemID
                     success:(void(^)(AFHTTPRequestOperation *operation, id responseObject))success
                        fail:(void(^)(AFHTTPRequestOperation *operation, NSError *error))fail;
@end
