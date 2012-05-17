//
//  SPWKDocumentView.m
//  QuartzPatternBugDemo
//
//  Created by Johannes Fahrenkrug on 17.05.12.
//  Copyright (c) 2012 Springenwerk. All rights reserved.
//

#import "SPWKDocumentView.h"

#define SPWK_DOCUMENT_VIEW_PADDING 15

@implementation SPWKDocumentView
@synthesize pageSize=_pageSize, numberOfPages=_numberOfPages;

- (id)initWithPageSize:(CGSize)pageSize pages:(int)pages {
    CGRect rect = CGRectMake(0, 0, pageSize.width + (SPWK_DOCUMENT_VIEW_PADDING * 2), 
                             ((pageSize.height + SPWK_DOCUMENT_VIEW_PADDING) * pages) + SPWK_DOCUMENT_VIEW_PADDING);
    
    if (self = [super initWithFrame:rect]) {
        _pageSize = pageSize;
        _numberOfPages = pages;
    }
    
    return self;
}

- (BOOL)isFlipped
{
    return YES;
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Draw pages
    CGContextRef context = (CGContextRef)[[NSGraphicsContext currentContext] graphicsPort];
    
    CGColorRef paperColor = CGColorCreateGenericRGB(1, 1, 1, 1);
    CGColorRef shadowColor = CGColorCreateGenericRGB(0.1, 0.1, 0.1, 0.9);
    
    CGContextSetFillColorWithColor(context, paperColor);
    
    CGContextSetShadowWithColor(context, CGSizeMake(4, -4), 3.0, shadowColor);
    
    CGFloat topOffset = 0;
    
    for (int i = 0; i < _numberOfPages; i++) {
        topOffset = (i * _pageSize.height) + (SPWK_DOCUMENT_VIEW_PADDING * (i + 1));
        CGContextFillRect(context, CGRectMake(SPWK_DOCUMENT_VIEW_PADDING, topOffset, _pageSize.width, _pageSize.height));
    }
}

@end
