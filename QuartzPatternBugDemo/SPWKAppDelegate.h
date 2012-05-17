//
//  SPWKAppDelegate.h
//  QuartzPatternBugDemo
//
//  Created by Johannes Fahrenkrug on 17.05.12.
//  Copyright (c) 2012 Springenwerk. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SPWKScrollView.h"

@interface SPWKAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet SPWKScrollView *scrollView;

@end
