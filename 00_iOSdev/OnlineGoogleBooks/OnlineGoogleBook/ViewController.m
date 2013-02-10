//
//  ViewController.m
//  OnlineGoogleBook
//
//  Created by Ding Orlando on 2/5/13.
//  Copyright (c) 2013 Ding Orlando. All rights reserved.
//

#import "ViewController.h"

NSString* strPrevFile = @"iOS6preTemplate";
NSString* strApisFile = @"iOS6apis";

@interface ViewController ()

- (void) loadHtmlStringLocally : (NSString*)fTemplate;
- (void) loadHtmlResourceLocally : (NSString*)fTemplate;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self loadHtmlStringLocally: strApisFile];
}

// desc - load html via String in UIWebContainer - not used now
- (void) loadHtmlResourceLocally : (NSString*)fTemplate{
    NSString* path = [[NSBundle mainBundle]pathForResource:fTemplate ofType:@"html"];
    NSURL* url = [NSURL fileURLWithPath:path];
    NSURLRequest* req = [[NSURLRequest alloc]initWithURL:url];
    [self->webview loadRequest:req];
}

// desc - load html via String in UIWebContainer - not used now
// requirements :
//      1, need to adjust for UIContainer to UI status
//      2, need to add UI status refreshment
- (void) loadHtmlStringLocally : (NSString*)fTemplate{
    NSString* path = [[NSBundle mainBundle]pathForResource:fTemplate ofType:@"html"];
    NSURL* url = [NSURL fileURLWithPath:path];
    NSError* error = nil;
    NSString* strWebContent = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    // desc - replace string with parameter, book id = hcz96jeSLe8C
    // parameters list in order - why is 100% will be replaced with 100 via %@
    // see objective-c programming of http://mustache.github.com via texttemplate similar djano in objective-c
    // strWebContent = [NSString stringWithFormat:strWebContent, @"hcz96jeSLe8C"];
    strWebContent = [strWebContent stringByReplacingOccurrencesOfString:@"{{id}}" withString:@"hcz96jeSLe8C"];
    
    /**
     * desc - replacement of string content https://github.com/groue/GRMustache
     * desc - replace with UI size, http://stackoverflow.com/questions/668228/string-replacement-in-objective-c
    int iViewWidth = self->webview.frame.size.width, iViewHeight = self->webview.frame.size.height;
    strWebContent = [strWebContent stringByReplacingOccurrencesOfString:@"$width$" withString:[NSString stringWithFormat:@"%d", iViewWidth]];
    strWebContent = [strWebContent stringByReplacingOccurrencesOfString:@"$height$" withString:[NSString stringWithFormat:@"%d", iViewHeight]];
     **/
    
    [self->webview sizeToFit];
    [self->webview loadHTMLString:strWebContent baseURL:url];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"started");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"finished");}

- (void)        webView:(UIWebView *)webView
   didFailLoadWithError:(NSError *)error{
    NSLog(@"failed");
}

@end
