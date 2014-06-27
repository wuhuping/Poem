//
//  PoemTests.m
//  PoemTests
//
//  Created by wuhuping on 14-6-23.
//  Copyright (c) 2014年 wuhuping. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PoemService.h"
@interface PoemTests : XCTestCase
{
    PoemService *_poemService;
}
@end

@implementation PoemTests

- (void)setUp
{
    [super setUp];
    
    _poemService = [[PoemService alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    _poemService = nil;
    
    [super tearDown];
}

- (void)testMenuFetch
{
    [_poemService fetchPoemMenu:^(BOOL isSuccess, id responseObject) {
        
    }];
}


@end
