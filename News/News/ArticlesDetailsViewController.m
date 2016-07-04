//
//  ArticlesDetailsViewController.m
//  News
//
//  Created by Teodora on 4/27/16.
//  Copyright © 2016 Teodora. All rights reserved.
//

#import "ArticlesDetailsViewController.h"
#import "WebViewController.h"
#import "AsyncImageView.h"
#import "Article.h"

@interface ArticlesDetailsViewController ()

@property (weak, nonatomic) IBOutlet AsyncImageView *asyncImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *descTextView;

// neka izmena bilo kakva izmena samo da je ima zbog gita


@end

@implementation ArticlesDetailsViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.asyncImageView.imageURL=self.article.imageURL;
    self.titleLabel.text=self.article.title;
    self.titleLabel.adjustsFontSizeToFitWidth=YES;
    self.descTextView.text=self.article.desc;
}

#pragma mark - Segue Management

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"WebSegue"]) {
        
        WebViewController *toViewController = segue.destinationViewController;
        toViewController.article=self.article;
    }

}


@end
