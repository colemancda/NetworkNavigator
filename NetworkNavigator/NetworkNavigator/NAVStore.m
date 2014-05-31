//
//  NAVStore.m
//  NetworkNavigator
//
//  Created by Alsey Coleman Miller on 5/31/14.
//  Copyright (c) 2014 ColemanCDA. All rights reserved.
//

#import "NAVStore.h"

@implementation NAVStore

-(instancetype)initWithOptions:(NSDictionary *)options
{
    self = [super initWithOptions:options];
    
    if (self) {
        
        NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.model];
        
        NSError *pscError;
        
        if (![psc addPersistentStoreWithType:NSInMemoryStoreType
                               configuration:nil
                                         URL:nil
                                     options:nil
                                       error:&pscError]) {
            
            [NSException raise:NSInternalInconsistencyException
                        format:@"Could not create In-Memory Persistent Store. (%@)", pscError.localizedDescription];
            
            return nil;
        }
        
        self.context.persistentStoreCoordinator = psc;
        
        self.mainContext.persistentStoreCoordinator = psc;
        
        // syncronize contexts
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(managedObjectContextDidSaveNotification:)
                                                     name:NSManagedObjectContextDidSaveNotification
                                                   object:self.context];
        
    }
    
    return self;
}

#pragma mark - Notifications

-(void)managedObjectContextDidSaveNotification:(NSNotification *)notification
{
    [self.mainContext performBlock:^{
       
        [_mainContext mergeChangesFromContextDidSaveNotification:notification];
        
    }];
}

@end
