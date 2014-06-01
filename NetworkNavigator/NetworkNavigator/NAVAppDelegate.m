//
//  NAVAppDelegate.m
//  NetworkNavigator
//
//  Created by Alsey Coleman Miller on 5/31/14.
//  Copyright (c) 2014 ColemanCDA. All rights reserved.
//

#import "NAVAppDelegate.h"
#import "NAVSceneViewController.h"

NSString const* NetworkNavigatorErrorDomain = @"com.ColemanCDA.NetworkNavigator.ErrorDomain";

static void *KVOContext = &KVOContext;

@implementation NAVAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    // KVO
    
    [self addObserver:self
           forKeyPath:@"viewController"
              options:NSKeyValueObservingOptionNew
              context:KVOContext];
    
    // set view controller
    
    self.viewController = (NSViewController *)[[NAVSceneViewController alloc] init];
}

-(void)applicationWillTerminate:(NSNotification *)notification
{
    
    [self removeObserver:self
              forKeyPath:@"viewController"
                 context:KVOContext];
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == KVOContext) {
        
        if ([keyPath isEqualToString:@"viewController"]) {
            
            self.box.contentView = self.viewController.view;
        }
        
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
