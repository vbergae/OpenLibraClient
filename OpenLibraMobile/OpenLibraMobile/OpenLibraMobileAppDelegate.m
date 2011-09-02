//
//  OpenLibraMobileAppDelegate.m
//  OpenLibraMobile
//
//  Created by Víctor Berga on 27/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OpenLibraMobileAppDelegate.h"

@implementation OpenLibraMobileAppDelegate

@synthesize window  = _window;
@synthesize books   = _books;

- (BOOL)application:(UIApplication *)application 
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    OpenLibraClient *client = [[[OpenLibraClient alloc] init] autorelease];
    [client setDelegate:self];
    
    // Example: 10 Last books added
    [client.criteria setOrder:OrderNewest];
    [client.criteria setMaxItems:10];
    
    // Example: Book with id: 589
    // [client.criteria setField:FieldId withValue:@"589"];

    // Example: All books of author: Rebecca Murphey
    // [client.criteria setField:FieldAuthor withValue:@"Rebecca Murphey"];
    
    // Example: 20 most viewed books
    // [client.criteria setCollection:CollectionMostViewed];
    // [client.criteria setMaxItems:20];
    
    [client fetchRequest];
    
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark -
#pragma mark Memory Management

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

#pragma mark -
#pragma mark OpenLibraDelegate

- (void)willStartConnection:(OpenLibraClient *)client
{
    NSLog(@"OpenLibraClient will start connection", nil);
}

- (void)openLibraClient:(OpenLibraClient *)client 
     didStartConnection:(NSURLConnection *)connection
{
    NSLog(@"OpenLibraClient did start connection", nil);
}

- (void)openLibraClient:(OpenLibraClient *)client 
didFailConnectionWithError:(NSError *)error
{
    NSLog(@"OpenLibraClient did fail with error: %@", error);    
}

- (void)openLibraClientDidFinishLoading:(OpenLibraClient *)client
{
    if ([client.books count] > 0) {
        _books = client.books;
        
        for (Book *book in _books) {
            NSLog(@"Book: %@", book);
        }        
    } else {
        NSLog(@"No results for parameters: %@", 
              client.criteria.requestParameters);
    }

}

#pragma mark -

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
