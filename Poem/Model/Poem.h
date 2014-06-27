//
//  Poem.h
//  Poem
//
//  Created by wuhuping on 14-6-23.
//  Copyright (c) 2014年 wuhuping. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#ifdef CoreData
typedef NSManagedObject superClass;
#else
typedef NSObject superClass;
#endif

@interface Poem :superClass

@property (nonatomic, retain) NSString * poemTitle;
@property (nonatomic, retain) NSString * poemAuthor;
@property (nonatomic, retain) NSString * poemContent;
@property (nonatomic, retain) NSString * poemAppreciation;
@property (nonatomic, retain) NSString * poemAuthorInfo;
@property (nonatomic, retain) NSString * poemTime;
@property (nonatomic, retain) NSString * poemType;
@property (nonatomic, retain) NSString * timeParse;
@property (nonatomic, retain) NSString * userIp;
@property (nonatomic, retain) NSString * poemID;


+ (id)insertObjectInMangedObjectContext:(NSManagedObjectContext*)context;
@end
