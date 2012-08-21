//
//  ContentManager.m
//  Ten Minuters
//
//  Created by Chung-Yi Chi on 4/28/12.
//  Copyright (c) 2012 Carnegie Mellon University. All rights reserved.
//

#import "ContentManager.h"
#import "Constant.h"


@implementation ContentManager
@synthesize delegate;

static ContentManager *_sharedInstance = nil;

+ (ContentManager *)getInstance {
	@synchronized([ContentManager class]) {
		if (!_sharedInstance)
			[[self alloc] init];
		return _sharedInstance;
	}
    
	return nil;
}

+ (id)alloc {
	@synchronized([ContentManager class]) {
		NSAssert(_sharedInstance == nil, @"Attempted to allocate a second instance of a singleton.");
		_sharedInstance = [super alloc];
		return _sharedInstance;
	}
    
	return nil;
}

- (id)init {
	self = [super init];
	if (self != nil) {
		// initialize stuff here
	}
    
	return self;
}


- (void)getRecentNews:(int)number fromSource:(int)source {
    switch (source) {
        case PROVIDER_ID_NYT_NEWSWIRE:
            nyt = [[NYTNewsWire alloc] initWithApiKey:@"lala"];
            [nyt getRecentNews:number];
            break;
            
        default:
            break;
    }
}

- (void)news:(NSMutableArray *)newsList didLoadFromSource:(int)sourceId {
    [delegate content:PROVIDER_ID_NYT_NEWSWIRE didLoadResponse:newsList];
}

@end
