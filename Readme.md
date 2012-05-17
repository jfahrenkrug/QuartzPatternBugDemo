# Possible Quartz Pattern Drawing Bug Demo

I've noticed that drawing a pattern in an NSView subclass seems to only work when wantsLayer is set to YES. 

When it's set to NO, the pattern isn't drawn, although the code is being called!

You can try it out by setting wantsLayer to either YES or NO in SPWKAppDelegate.m.