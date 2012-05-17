//
//  SPWKAppDelegate.m
//  QuartzPatternBugDemo
//
//  Created by Johannes Fahrenkrug on 17.05.12.
//  Copyright (c) 2012 Springenwerk. All rights reserved.
//

#import "SPWKAppDelegate.h"
#import "SPWKDocumentView.h"

@implementation SPWKAppDelegate

@synthesize window = _window;
@synthesize scrollView = _scrollView;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // When wantsLayer is YES, the pattern is drawn.
    // When wantsLayer is NO, no pattern is drawn
    _scrollView.wantsLayer = YES;
    
    SPWKDocumentView *docView = [[SPWKDocumentView alloc] initWithPageSize:CGSizeMake(600, 800) pages:5];
    
    [_scrollView setDocumentView:docView];
}

@end
