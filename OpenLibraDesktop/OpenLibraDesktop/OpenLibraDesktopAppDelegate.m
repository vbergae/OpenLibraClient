//
//  OpenLibraDesktopAppDelegate.m
//  OpenLibraDesktop
//
//  Created by Víctor Berga on 21/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OpenLibraDesktopAppDelegate.h"
#import "OpenLibraClient.h"

@implementation OpenLibraDesktopAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    OpenLibraClient *cr = [[OpenLibraClient alloc] init];
    //[cr.criteria setField:FieldId withValue:@"589"];
    [cr fetchRequest];
}

@end
