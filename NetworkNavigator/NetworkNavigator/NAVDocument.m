//
//  NAVDocument.m
//  NetworkNavigator
//
//  Created by Alsey Coleman Miller on 5/30/14.
//  Copyright (c) 2014 ColemanCDA. All rights reserved.
//

#import "NAVDocument.h"
#import "NAVStore.h"

static void *KVOContext = &KVOContext;

@interface NAVDocument ()

@property (nonatomic) NAVStore *store;

@property (nonatomic) NSGScene *scene;

@end

@implementation NAVDocument

-(void)dealloc
{
    [self removeObserver:self
              forKeyPath:@"urlTextField.stringValue"
                 context:KVOContext];
}

- (id)init
{
    self = [super init];
    if (self) {
        
        // Add your subclass-specific initialization here.
        
        // KVO
        
        [self addObserver:self
               forKeyPath:@"urlTextField.stringValue"
                  options:NSKeyValueObservingOptionNew
                  context:KVOContext];
        
        
        
    }
    return self;
}

-(BOOL)readFromURL:(NSURL *)url ofType:(NSString *)typeName error:(NSError *__autoreleasing *)outError
{
    NSLog(@"read");
    
    // parse URL and check if scene is specified
    
    if (url.path) {
        
        // scene should be specified
        
        if (url.pathComponents.count == 2) {
            
        }
    }
    
    return NO;
}

-(id)initWithContentsOfURL:(NSURL *)url ofType:(NSString *)typeName error:(NSError *__autoreleasing *)outError
{
    self = [super initWithContentsOfURL:url ofType:typeName error:outError];
    
    if (self) {
        
        NSLog(@"hey");
        
    }
    
    return self;
}

-(id)initForURL:(NSURL *)urlOrNil withContentsOfURL:(NSURL *)contentsURL ofType:(NSString *)typeName error:(NSError *__autoreleasing *)outError
{
    
    
    return nil;
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"NAVDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
    
}

+ (BOOL)autosavesInPlace
{
    return NO;
}

#pragma mark - Load document

-(void)loadSceneWithURL:(NSURL *)url
        sceneResourceID:(NSNumber *)sceneResourceID
{
    
    
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == KVOContext) {
        
        if ([keyPath isEqualToString:@"urlTextField.stringValue"]) {
            
            // self.store = [[NAVStore alloc] init];
            
        }
        
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
