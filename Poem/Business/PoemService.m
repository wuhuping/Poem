//
//  PoemService.m
//  Poem
//
//  Created by wuhuping on 14-6-23.
//  Copyright (c) 2014年 wuhuping. All rights reserved.
//

#import "PoemService.h"
#import "PoemDataService.h"
#import "Poem.h"
#import "CoreDataService.h"
@interface PoemService()
{
    PoemDataService *_poemDataService;
    CoreDataService *_coreDataService;
}
@end
@implementation PoemService

- (id)init
{
    if (self = [super init]) {
        _poemDataService = [[PoemDataService alloc] init];
        _coreDataService = [CoreDataService sharedService];
    }
    return self;
}

- (void)fetchPoemMenu:(void(^)(BOOL isSuccess, id responseObject))response
{
    [_poemDataService fetchPoemMenu:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSArray *poemArray = [self parseMenuResponse:responseObject];
            response(YES, poemArray);
        } fail:^(AFHTTPRequestOperation *operation, NSError *error) {
            response(NO, @"服务器出现错误");
        }];
}

- (void)fetchPoemContentBypoem:(Poem*)poem
                      response:(void(^)(BOOL isSuccess, id responseObject))response
{
    [_poemDataService fetchPoemContentByID:poem.poemID
                                   success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                       [self parseSiglePoemReponse:responseObject poem:poem];
                                       response(YES, poem);
                                   } fail:^(AFHTTPRequestOperation *operation, NSError *error) {
                                       response(NO, @"服务器出现错误");
                                   }];
}

#pragma mark -
#pragma mark - Parse
- (NSArray*)parseMenuResponse:(id)responseObject
{
    if ([responseObject isKindOfClass:[NSArray class]]) {
        NSMutableArray *poemArray = [NSMutableArray array];
        NSArray *responseArray = responseObject;
        NSUInteger count = responseArray.count;
        for (int i = 0; i < count; i ++) {
            NSDictionary *dic = responseArray[i];
            void(^assignMentBlock)(Poem *poem) = ^(Poem *poem){
                poem.poemAuthor = dic[@"poemAuthor"];
                poem.poemID = dic[@"poemId"];
                poem.poemTitle = dic[@"poemTitle"];
                poem.poemType = dic[@"poemType"];
            };
#ifdef CoreData
            [_coreDataService insertPoem:^(Poem *poem) {
                assignMentBlock(poem);
                [poemArray addObject:poem];
            }];
#else
            Poem *poem = [[Poem alloc] init];
            assignMentBlock(poem);
            [poemArray addObject:poem];
#endif
        }
        [_coreDataService saveContext];

        return poemArray;
    }
    
    return @[];
}

- (void)parseSiglePoemReponse:(id)responseObject poem:(Poem*)poem
{
    if ([responseObject isKindOfClass:[NSDictionary class]]) {
        poem.poemContent = responseObject[@"poemContent"];
        poem.poemAppreciation = responseObject[@"poemAppreciation"];
        poem.poemAuthorInfo = responseObject[@"poemAuthorInfo"];
        poem.poemTime = responseObject[@"poemTime"];
        poem.poemType = responseObject[@"type"];
    }
}

@end

