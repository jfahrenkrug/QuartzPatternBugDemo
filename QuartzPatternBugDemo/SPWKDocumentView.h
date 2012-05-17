//
//  SPWKDocumentView.h
//  QuartzPatternBugDemo
//
//  Created by Johannes Fahrenkrug on 17.05.12.
//  Copyright (c) 2012 Springenwerk. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SPWKDocumentView : NSView

- (id)initWithPageSize:(CGSize)pageSize pages:(int)pages;

@property (assign) CGSize pageSize;
@property (assign) int numberOfPages;

@end
