//
//  News.h
//  Ten Minuters
//
//  Created by Chung-Yi Chi on 4/28/12.
//  Copyright (c) 2012 Carnegie Mellon University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject {
@private
    NSString        *headline;
    NSString        *brief;
    NSString        *content;
    NSMutableArray  *paragrphs;
    NSString        *section;
    NSString        *publisher;
    NSURL           *sourceURL;
    NSMutableArray  *imagesURL;
    NSDictionary    *imageCaptionDict;
    NSDate          *publishTime;
    NSDate          *fetchTime;
}

@property (nonatomic, retain) NSString *headline;
@property (nonatomic, retain) NSString *brief;
@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSMutableArray  *paragrphs;
@property (nonatomic, retain) NSString *section;
@property (nonatomic, retain) NSString *publisher;
@property (nonatomic, retain) NSURL *sourceURL;
@property (nonatomic, retain) NSMutableArray *imagesURL;
@property (nonatomic, retain) NSDictionary *imageCaptionDict;
@property (nonatomic, retain) NSDate *publishTime;
@property (nonatomic, retain) NSDate *fetchTime;

- (id)initWithHeadline:(NSString *)headline 
                 brief:(NSString *)brief 
               content:(NSString *)content
               section:(NSString *)section
             publisher:(NSString *)publisher
             sourceURL:(NSURL *)sourceURL
             imagesURL:(NSMutableArray *)imagesURL
           publishTime:(NSDate *)publishTime
             fetchTime:(NSDate *)fetchTime;

@end
