//
//  News.m
//  Ten Minuters
//
//  Created by Chung-Yi Chi on 4/28/12.
//  Copyright (c) 2012 Carnegie Mellon University. All rights reserved.
//

#import "News.h"

@implementation News
@synthesize headline, brief, content, paragrphs, section, publisher, sourceURL, imagesURL, imageCaptionDict, publishTime, fetchTime;

- (id)initWithHeadline:(NSString *)headline 
                 brief:(NSString *)brief 
               content:(NSString *)content 
               section:(NSString *)section 
             publisher:(NSString *)publisher 
             sourceURL:(NSURL *)sourceURL 
             imagesURL:(NSMutableArray *)imagesURL 
           publishTime:(NSDate *)publishTime 
             fetchTime:(NSDate *)fetchTime {
    
    self = [super init];
    if (self) {
        self.headline = headline;
        self.brief = brief;
        self.content = content;
        self.section = section;
        self.publisher = publisher;
        self.sourceURL = sourceURL;
        self.imagesURL = imagesURL;
        self.publishTime = publishTime;
        self.fetchTime = fetchTime;
        
        paragrphs = [[NSMutableArray alloc] init];
    }
    
    return self;
}

@end
