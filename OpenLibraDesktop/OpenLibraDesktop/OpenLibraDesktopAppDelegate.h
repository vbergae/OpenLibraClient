//  This file is part of the OpenLibraClient package.
//
//  OpenLibraDesktopAppDelegate.h
//  OpenLibraDesktop
//
//  Created by Víctor Berga on 21/08/11 <victor@victorberga.com>.
//  Copyright 2011 Víctor Berga. All rights reserved.
// 
//  For the full copyright and license information, please view the LICENSE
//  file that was distributed with this source code.

#import <Cocoa/Cocoa.h>
#import "OpenLibra.h"

@interface OpenLibraDesktopAppDelegate : NSObject 
<NSApplicationDelegate, OpenLibraDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
