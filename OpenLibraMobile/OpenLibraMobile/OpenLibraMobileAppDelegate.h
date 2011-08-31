//
//  OpenLibraMobileAppDelegate.h
//  OpenLibraMobile
//
//  Created by Víctor Berga on 27/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OpenLibra.h"

@interface OpenLibraMobileAppDelegate : NSObject 
<UIApplicationDelegate, OpenLibraDelegate> {
    NSArray *_books;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, readonly) NSArray *books;

@end
