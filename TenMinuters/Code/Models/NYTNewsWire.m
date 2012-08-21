//
//  NYTNewsWire.m
//  Ten Minuters
//
//  Created by Chung-Yi Chi on 4/28/12.
//  Copyright (c) 2012 Carnegie Mellon University. All rights reserved.
//

#import "NYTNewsWire.h"
#import "Constant.h"
#import <RestKit/RKJSONParserJSONKit.h>
#import "ContentManager.h"
//#import "TouchXML.h"

#define TOUCHXMLUSETIDY TRUE
//#import "CTidy.h"

@implementation NYTNewsWire
@synthesize apiKey, sectionSubscription, newsDict;

- (id)initWithApiKey:(NSString *)key {
    self = [super init];
    if (self) {
        self.apiKey = key;
        
        newsDict = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (NSArray *)getSections {
    if (self.sectionSubscription == nil) {
        // Get section list from NY Times
        NSLog(@"sectionSubscription is nil");
        //[[RKClient sharedClient] get:@"/section-list?api-key=fdff65b2023092ab334afbc2e3069b44:19:66020116" delegate:self];
        [[RKClient sharedClient] get:@"/nyt/u.s./1?api-key=fdff65b2023092ab334afbc2e3069b44:19:66020116&limit=10" delegate:self];
    }
    return nil/*[self.sectionSubscription allKeys]*/;
}

- (id)enableSection:(NSString *)section {
    return nil;
}

- (id)disableSection:(NSString *)section {
    return nil;
}

- (NSMutableArray *)getRecentNews:(int)number {
    RKClient *client = [RKClient clientWithBaseURLString:@"http://api.nytimes.com/svc/news/v3/content"];
    [client get:[NSString stringWithFormat:@"/nyt/world;sports;business;education;health;movies;science;technology;travel?api-key=fdff65b2023092ab334afbc2e3069b44:19:66020116&limit=%d", number] delegate:self];
    return nil;
}

- (int)getProviderId {
    return PROVIDER_ID_NYT_NEWSWIRE;
}

- (void)parseContentForNews:(News *)news FromRawContent:(NSString *)raw {    
    /*CTidy *t = [CTidy tidy];
    const char *encoding = "utf8";
    
    raw = [raw stringByReplacingOccurrencesOfString:@"nbsp" withString:@"#160"];
    
    NSError *error;
    NSString *xml = [t tidyString:raw inputFormat:TidyFormat_HTML outputFormat:TidyFormat_XML encoding:encoding diagnostics:nil error:&error];
    //NSLog(@"XHTML %@", xml);
    //NSLog(@"error %@", [error localizedDescription]);
    
    CXMLDocument *doc = [[CXMLDocument alloc] initWithXMLString:xml options:0 error:&error];
    //NSLog(@"error %@", [error localizedDescription]);
    
    // handling images
    NSArray *nodes = [doc nodesForXPath:@"//div[@class='articleSpanImage']/span/img" error:nil];
    for (CXMLElement *node in nodes) {
        
    }
    
    // handling paragraphs
    nodes = [doc nodesForXPath:@"//p[@itemprop='articleBody']" error:nil];
    for (CXMLElement *node in nodes) {
        [[news paragrphs] addObject:[node stringValue]];
    }*/
}

- (void)request:(RKRequest*)request didLoadResponse:(RKResponse *)response {
    if ([request isGET]) {          
        if ([response isOK]) {  
            if ([response isJSON]) {
                NSLog(@"Retrieved json: %@", [response bodyAsString]);
                // Get section list
                if ([[[request resourcePath] substringToIndex:14] isEqualToString:@"/section-list?"]) {
                    
                } else {
                    //JSONDecoder* decoder = [[JSONDecoder alloc] initWithParseOptions:JKParseOptionNone];
                    NSDictionary *deserializedData = [[[RKJSONParserJSONKit alloc] init] objectFromString:[response bodyAsString] error:nil];
                    NSArray *results = [deserializedData objectForKey:@"results"];
                    for (int i = 0; i < [results count]; i++) {
                        NSString *urlString = [[results objectAtIndex:i] objectForKey:@"url"];
                        NSURL *url = [NSURL URLWithString:urlString];
                        News *news = [[News alloc] initWithHeadline:[[results objectAtIndex:i] objectForKey:@"title"]
                                                              brief:[[results objectAtIndex:i] objectForKey:@"abstract"] 
                                                            content:[[results objectAtIndex:i] objectForKey:@"abstract"] 
                                                            section:[[results objectAtIndex:i] objectForKey:@"section"] 
                                                          publisher:[[results objectAtIndex:i] objectForKey:@"source"] 
                                                          sourceURL:url
                                                          imagesURL:nil publishTime:nil fetchTime:nil];
                        
                        [newsDict setValue:news forKey:[[results objectAtIndex:i] objectForKey:@"url"]];
                        
                        NSString *baseurl = [NSString stringWithFormat:@"%@://%@", url.scheme, url.host];
                        NSString *path = url.path;
                        [[RKClient sharedClient] setBaseURL:[RKURL URLWithBaseURLString:baseurl]];
                        RKRequest *request = [[RKClient sharedClient] get:path delegate:self];
                        // TODO Make sure setting user data won't be later than the async response.
                        [request setUserData:url];
                    }
                    [[ContentManager getInstance] news:[newsDict allValues] didLoadFromSource:PROVIDER_ID_NYT_NEWSWIRE];
                }
            } else if ([response isHTML]) {
                if ([newsDict valueForKey:[[request userData] absoluteString]] == nil) {
                    NSLog(@"The url is not in the news dictionary.");
                } else {
                    [self parseContentForNews:[newsDict valueForKey:[[request userData] absoluteString]] 
                                  FromRawContent:[response bodyAsString]];
                }
            }
        }  
        
    } else if ([request isPOST]) {    
        
    } else if ([request isDELETE]) {   
        
    } else {
        
    }
}

@end
