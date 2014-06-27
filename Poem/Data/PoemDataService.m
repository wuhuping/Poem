//
//  PoemDataService.m
//  Poem
//
//  Created by wuhuping on 14-6-23.
//  Copyright (c) 2014年 wuhuping. All rights reserved.
//

#import "PoemDataService.h"
@interface PoemDataService()
{
    AFHTTPRequestOperationManager *_manager;
}
@end
@implementation PoemDataService

- (id)init
{
    if (self = [super init]) {
        _manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:kSerVerDomain]];
    }
    return self;
}

- (void)fetchPoemMenu:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                 fail:(void (^)(AFHTTPRequestOperation *operation, NSError *error))fail
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"macmac" forKey:@"user"];
    
    [_manager GET:@"poemcatalog"
       parameters:dic
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              success(operation, responseObject);
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              fail(operation, error);
          }];
}

- (void)fetchPoemContentByID:(NSString *)poemID
                     success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                        fail:(void (^)(AFHTTPRequestOperation *operation, NSError *error))fail
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"macmac" forKey:@"user"];
    NSString *urlString = [NSString stringWithFormat:@"poemjson/%@",poemID];
    
    [_manager GET:urlString
       parameters:dic
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              success(operation, responseObject);
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              fail(operation, error);
          }];
}
@end
