//
//  OpenLibraDesktopAppDelegate.h
//  OpenLibraDesktop
//
//  Created by Víctor Berga on 21/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface OpenLibraDesktopAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
