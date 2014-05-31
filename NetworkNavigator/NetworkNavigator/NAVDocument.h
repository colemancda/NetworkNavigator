//
//  NAVDocument.h
//  NetworkNavigator
//
//  Created by Alsey Coleman Miller on 5/30/14.
//  Copyright (c) 2014 ColemanCDA. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <SceneKit/SceneKit.h>
#import <NetworkSceneGraph/NetworkSceneGraph.h>
@class NAVStore;

@interface NAVDocument : NSDocument

#pragma mark - IB Outlets

@property (weak) IBOutlet NSTextField *urlTextField;

@property (weak) IBOutlet SCNView *sceneView;

#pragma mark - Properties

@property (nonatomic, readonly) NAVStore *store;

@property (nonatomic, readonly) NSGScene *scene;

@end
