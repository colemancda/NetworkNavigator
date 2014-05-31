//
//  NAVStore.h
//  NetworkNavigator
//
//  Created by Alsey Coleman Miller on 5/31/14.
//  Copyright (c) 2014 ColemanCDA. All rights reserved.
//

#import <NetworkObjects/NetworkObjects.h>
#import <NetworkSceneGraph/NetworkSceneGraph.h>

@interface NAVStore : NOAPICachedStore

@property (nonatomic, readonly) NSManagedObjectContext *mainContext;

@end
