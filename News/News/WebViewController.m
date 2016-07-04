//
//  WebViewController.m
//  News
//
//  Created by Teodora on 4/27/16.
//  Copyright © 2016 Teodora. All rights reserved.
//

#import "WebViewController.h"


@interface WebViewController () <UIWebViewDelegate>

@property(weak, nonatomic) IBOutlet UIWebView *webView;
@property(weak, nonatomic) IBOutlet  UIActivityIndicatorView *spinnerView;

@end



@implementation WebViewController

#pragma mark - Actions

-(IBAction)backButtonTapped {
    
    [self dismissViewControllerAnimated:YES completion:NULL];

}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:self.article.link];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
   
    
}

#pragma mark - UIWebViewDelegate

-(void) webViewDidStartLoad:(UIWebView *)webView {

    [self.spinnerView startAnimating];

}

-(void) webViewDidFinishLoad:(UIWebView *)webView {

    [self.spinnerView stopAnimating];

}
@end
