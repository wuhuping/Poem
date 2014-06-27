//
//  Poem.m
//  Poem
//
//  Created by wuhuping on 14-6-23.
//  Copyright (c) 2014年 wuhuping. All rights reserved.
//

#import "Poem.h"


@implementation Poem

#ifdef CoreData
@dynamic poemTitle;
@dynamic poemAuthor;
@dynamic poemContent;
@dynamic poemAppreciation;
@dynamic poemAuthorInfo;
@dynamic poemTime;
@dynamic poemType;
@dynamic timeParse;
@dynamic userIp;
@dynamic poemID;
#else
@synthesize poemTitle;
@synthesize poemAuthor;
@synthesize poemContent;
@synthesize poemAppreciation;
@synthesize poemAuthorInfo;
@synthesize poemTime;
@synthesize poemType;
@synthesize timeParse;
@synthesize userIp;
@synthesize poemID;
#endif


+ (id)insertObjectInMangedObjectContext:(NSManagedObjectContext*)context
{
    return [NSEntityDescription insertNewObjectForEntityForName:@"Poem"
                                         inManagedObjectContext:context];
}

- (id)init
{
    if (self = [super init]) {
        self.poemTitle = @"";
        self.poemAuthor = @"";
        self.poemContent = @"";
        self.poemAppreciation = @"";
        self.poemAuthorInfo = @"";
        self.poemTime = @"";
        self.poemType = @"";
        self.timeParse = @"";
        self.userIp = @"";
        self.poemID = @"";
    }
    return self;
}


@end
