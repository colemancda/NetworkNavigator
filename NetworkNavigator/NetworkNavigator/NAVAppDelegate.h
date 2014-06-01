//
//  NAVAppDelegate.h
//  NetworkNavigator
//
//  Created by Alsey Coleman Miller on 5/31/14.
//  Copyright (c) 2014 ColemanCDA. All rights reserved.
//

#import <Cocoa/Cocoa.h>

extern NSString const* NetworkNavigatorErrorDomain;

@interface NAVAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (weak) IBOutlet NSBox *box;

@property (nonatomic) NSViewController *viewController;

@end
