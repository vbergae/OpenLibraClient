//  This file is part of the OpenLibraClient package.
//
//  OpenLibraDesktopAppDelegate.m
//  OpenLibraDesktop
//
//  Created by Víctor Berga on 21/08/11 <victor@victorberga.com>.
//  Copyright 2011 Víctor Berga. All rights reserved.
// 
//  For the full copyright and license information, please view the LICENSE
//  file that was distributed with this source code.

#import "OpenLibraDesktopAppDelegate.h"

@implementation OpenLibraDesktopAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    OpenLibraClient *cr = [[[OpenLibraClient alloc] init] autorelease];
    [cr setDelegate:self];
    //[cr.criteria setField:FieldId withValue:@"589"];
    [cr fetchRequest];
}

#pragma mark -
#pragma mark OpenLibraDelegate;

- (void)willStartConnection:(OpenLibraClient *)client
{
    NSLog(@"OpenLibraClient will start connection: %@", client);
}

- (void)openLibraClient:(OpenLibraClient *)client 
     didStartConnection:(NSURLConnection *)connection
{
    NSLog(@"OpenLibraClient did start connection: %@", client);
}

- (void)openLibraClientDidFinishLoading:(OpenLibraClient *)client
{
    NSLog(@"OpenLibraClient did finish loading: %@", client);    
    NSLog(@"Books: %@", [client books]);
}

- (void)openLibraClient:(OpenLibraClient *)client 
didFailConnectionWithError:(NSError *)error
{
    NSLog(@"Connection error: %@", error);
}

@end
