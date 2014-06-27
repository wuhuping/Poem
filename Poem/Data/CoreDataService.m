//
//  CoreDataService.m
//  Poem
//
//  Created by wuhuping on 14-6-27.
//  Copyright (c) 2014年 wuhuping. All rights reserved.
//

#import "CoreDataService.h"
#import <CoreData/CoreData.h>
#import "Poem.h"
@interface CoreDataService ()

//数据对象模型
@property (strong, nonatomic) NSManagedObjectModel *mangedObjectModel;

//上下文对象
@property (strong, nonatomic) NSManagedObjectContext *mangedObjectContext;

//持久性存储区
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end
@implementation CoreDataService

+ (id)sharedService
{
    static CoreDataService *service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[CoreDataService alloc] init];
    });
    return service;
}

- (void)insertPoem:(void(^)(Poem *poem))block
{
    Poem *poem = [Poem insertObjectInMangedObjectContext:self.mangedObjectContext];
    
    block(poem);
}



- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.mangedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark -
#pragma mark CoreData
- (NSManagedObjectContext *)mangedObjectContext
{
    if (_mangedObjectContext != nil) {
        return _mangedObjectContext;
    }
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _mangedObjectContext = [[NSManagedObjectContext alloc] init];
        [_mangedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _mangedObjectContext;
}

- (NSManagedObjectModel *)mangedObjectModel
{
    if (_mangedObjectModel != nil) {
        return _mangedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Poem" withExtension:@"momd"];
    _mangedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _mangedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Poem.sqlite"];
    
    NSError *error;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self mangedObjectModel]];
    
    // Allow inferred migration from the original version of the application.
    NSDictionary *options = @{NSMigratePersistentStoresAutomaticallyOption : @YES, NSInferMappingModelAutomaticallyOption : @YES};
    
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil
                                                             URL:storeURL options:options error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
