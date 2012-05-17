//
//  SPWKScrollView.m
//  QuartzPatternBugDemo
//
//  Created by Johannes Fahrenkrug on 17.05.12.
//  Copyright (c) 2012 Springenwerk. All rights reserved.
//

#import "SPWKScrollView.h"

@implementation SPWKScrollView

static inline double radians (double degrees) { return degrees * M_PI/180; }

static CGColorRef CGColorCreateFromNSColor (CGColorSpaceRef colorSpace, NSColor *color)
{
    NSColor *deviceColor = [color colorUsingColorSpaceName:
                            NSDeviceRGBColorSpace];
    
    CGFloat components[4];
    [deviceColor getRed: &components[0] green: &components[1] blue:
     &components[2] alpha: &components[3]];
    
    return CGColorCreate (colorSpace, components);
}

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Code adapted from http://www.raywenderlich.com/2167/core-graphics-101-patterns
    
    // Draw background pattern
    CGContextRef context = (CGContextRef)[[NSGraphicsContext currentContext] graphicsPort];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef bgColor = CGColorCreateFromNSColor(colorSpace, [NSColor colorWithCalibratedHue:0 saturation:0 brightness:0.15 alpha:1.0]);
    CGContextSetFillColorWithColor(context, bgColor);
    CGContextFillRect(context, dirtyRect);
    
    static const CGPatternCallbacks callbacks = { 0, &LSIDrawDocumentBackgroundPattern, NULL };
    
    CGContextSaveGState(context);
    CGColorSpaceRef patternSpace = CGColorSpaceCreatePattern(NULL);
    CGContextSetFillColorSpace(context, patternSpace);
    CGColorSpaceRelease(patternSpace);
    
    CGPatternRef pattern = CGPatternCreate(NULL,
                                           dirtyRect,
                                           CGAffineTransformIdentity,
                                           24,
                                           24,
                                           kCGPatternTilingConstantSpacing,
                                           true,
                                           &callbacks);
    CGFloat alpha = 1.0;
    CGContextSetFillPattern(context, pattern, &alpha);
    CGPatternRelease(pattern);
    CGContextFillRect(context, dirtyRect);
    CGContextRestoreGState(context);
}

// Callback method that draws the background pattern
void LSIDrawDocumentBackgroundPattern (void *info, CGContextRef context) {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef dotColor = CGColorCreateFromNSColor(colorSpace, [NSColor colorWithCalibratedHue:0 saturation:0 brightness:0.07 alpha:1.0]);
    CGColorRef shadowColor = CGColorCreateGenericRGB(1, 1, 1, 0.1);
    
    CGContextSetFillColorWithColor(context, dotColor);
    CGContextSetShadowWithColor(context, CGSizeMake(0, 1), 1, shadowColor);
    
    CGContextAddArc(context, 3, 3, 4, 0, radians(360), 0);
    CGContextFillPath(context);
    
    CGContextAddArc(context, 16, 16, 4, 0, radians(360), 0);
    CGContextFillPath(context);
}

// we want a flipped coordinate system so that 0,0 is in the top left corner
- (BOOL)isFlipped {
    return YES;
}

@end
