//
//  OAuthKeylogger.h
//
//  Created by Boris Bügling on 14.01.12.
//

#import <UIKit/UIKit.h>

@interface OAuthKeylogger : NSURLProtocol

-(void)attachKeyloggerToWebView:(UIWebView*)webView;
-(BOOL)handleRequest:(NSURLRequest*)request;
-(NSString*)keys;

@end
