//  This file is part of the OpenLibraClient package.
//
//  OpenLibraClientDelegate.h
//  OpenLibraClient
//
//  Created by Víctor Berga on 23/08/11 <victor@victorberga.com>.
//  Copyright 2011 Víctor Berga. All rights reserved.
// 
//  For the full copyright and license information, please view the LICENSE
//  file that was distributed with this source code.
//

#import <Foundation/Foundation.h>

@class OpenLibraClient;

/**
 Messages sent to delegate while OpenLibreClient proccess the request to API
 */
@protocol OpenLibraDelegate <NSObject>

/**
 Sent when OpenLibraClient will start a connection to service
 
 @param OpenLibraClient Sender
 */
- (void)willStartConnection:(OpenLibraClient *)client;

/**
 Sent when OpenLibraClient did start a connection to service
 
 @param OpenLibraClient Sender
 @param NSURLConnection Connection object
 */
- (void)openLibraClient:(OpenLibraClient *)client
     didStartConnection:(NSURLConnection *)connection;

/**
 Sent when the request fails
 
 @param OpenLibraClient Sender
 @param NSError Encapsulates error information
 */
- (void)openLibraClient:(OpenLibraClient *)client
didFailConnectionWithError:(NSError *)error;

/**
 Sent when OpenLibraClient did finish to fetch the request
 
 @param OpenLibraClient Sender
 @param NSArray All books returned by the service
 */
- (void)openLibraClientDidFinishLoading:(OpenLibraClient *)client;

@end