//
//  NAVSceneViewController.h
//  NetworkNavigator
//
//  Created by Alsey Coleman Miller on 5/31/14.
//  Copyright (c) 2014 ColemanCDA. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <SceneKit/SceneKit.h>
#import <NetworkSceneGraph/NetworkSceneGraph.h>
@class NAVStore;

typedef NS_ENUM(NSInteger, NAVSceneViewControllerError) {
    
    NAVSceneViewControllerInvalidURLError /** Invalid NetworkSceneGraph URL */
    
    
};

@interface NAVSceneViewController : NSViewController

#pragma mark - IB Outlets

@property (weak) IBOutlet NSTextField *urlTextField;

@property (weak) IBOutlet SCNView *sceneView;

#pragma mark - Properties

@property (nonatomic, readonly) NAVStore *store;

#pragma mark - Load document

-(void)loadSceneWithURL:(NSURL *)url
        sceneResourceID:(NSNumber *)sceneResourceID;

#pragma mark -


@end
