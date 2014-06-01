//
//  NAVSceneViewController.m
//  NetworkNavigator
//
//  Created by Alsey Coleman Miller on 5/31/14.
//  Copyright (c) 2014 ColemanCDA. All rights reserved.
//

#import "NAVSceneViewController.h"
#import "NAVAppDelegate.h"

static void *KVOContext = &KVOContext;

@interface NAVSceneViewController ()

@property (nonatomic) NAVStore *store;

@property (nonatomic) NSGScene *scene;

@end

@implementation NAVSceneViewController (ShowError)

-(void)showErrorWithLocalizedDescription:(NSString *)errorDescription;
{
    self.sceneView.scene = [SCNScene scene];
    
    self.sceneView.backgroundColor = [NSColor blackColor];
    
    SCNNode *errorTextNode = [SCNNode nodeWithGeometry:[SCNText textWithString:errorDescription
                                                                extrusionDepth:1.0]];
    
    [self.sceneView.scene.rootNode addChildNode:errorTextNode];
}

@end

@implementation NAVSceneViewController

-(void)dealloc
{
    [self removeObserver:self
              forKeyPath:@"urlTextField.stringValue"
                 context:KVOContext];
}

- (id)init
{
    self = [self initWithNibName:NSStringFromClass([self class]) bundle:nil];
    if (self) {
        
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
        
        // KVO
        
        [self addObserver:self
               forKeyPath:@"urlTextField.stringValue"
                  options:NSKeyValueObservingOptionNew
                  context:KVOContext];
    }
    return self;
}

#pragma mark - Load document

-(void)loadSceneWithURL:(NSURL *)url
        sceneResourceID:(NSNumber *)sceneResourceID
{
    [self showErrorWithLocalizedDescription:NSLocalizedString(@"Invalid URL",
                                                              @"Invalid URL")];
    
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == KVOContext) {
        
        if ([keyPath isEqualToString:@"urlTextField.stringValue"]) {
            
            NSURL *url = [NSURL URLWithString:self.urlTextField.stringValue];
            
            // parse URL and check if scene is specified
            
            if (url.path && url.pathComponents.count == 2 && url.baseURL) {
                
                // scene should be specified
                
                NSString *scenePathComponent = url.pathComponents.firstObject;
                
                NSString *sceneResourceIDString = url.pathComponents[1];
                
                if (![scenePathComponent isEqualToString:[NSGScene resourcePath]]) {
                    
                    [self showErrorWithLocalizedDescription:NSLocalizedString(@"Invalid URL",
                                                                              @"Invalid URL")];
                    
                    return;
                }
                
                [self loadSceneWithURL:url.baseURL
                       sceneResourceID:[NSNumber numberWithInteger:sceneResourceIDString.integerValue]];
                
            }
            
            else {
                
                [self loadSceneWithURL:url
                       sceneResourceID:nil];
            }
            
        }
        
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
