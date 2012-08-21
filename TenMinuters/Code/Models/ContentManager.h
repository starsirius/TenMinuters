//
//  ContentManager.h
//  Ten Minuters
//
//  Created by Chung-Yi Chi on 4/28/12.
//  Copyright (c) 2012 Carnegie Mellon University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>
#import "NewsProviderProtocol.h"
#import "ContentRequesterProtocol.h"
#import "NYTNewsWire.h"

@interface ContentManager : NSObject {
    id<ContentRequesterProtocol> delegate;
    
    NYTNewsWire *nyt; // TODO Should use a dict for all the source provider
    NSDictionary *sources; // { id : source } dictionary
}

@property (nonatomic, retain) id<ContentRequesterProtocol> delegate;

/**
 * Get the singleton instance of Content Manager.
 * @return The singleton instance of Content Manager.
 */
+ (ContentManager *)getInstance;

- (id)attachNewsProvider:(id<NewsProviderProtocol>)provider;

- (id)detachNewsProvider:(int)providerId;

- (void)getRecentNews:(int)number fromSource:(int)source;

/**
 * Callback function when the source has loaded the news list.
 * The "notify" function in the Observer pattern
 */
- (void)news:(NSMutableArray *)newsList didLoadFromSource:(int)sourceId;

@end
