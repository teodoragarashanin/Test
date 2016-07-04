//
//  ArticlesViewController.m
//  News
//
//  Created by Teodora on 4/27/16.
//  Copyright © 2016 Teodora. All rights reserved.
//

#import "ArticlesViewController.h"
#import "ArticleTableViewCell.h"
#import "ArticlesDetailsViewController.h"
#import "Article.h"

static NSString *const ARTICLES_URL = @"http://www.brzevesti.net/api/news";

@interface ArticlesViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak,nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *itemsArray;
@property (strong, nonatomic) Article *selectedArticle;

@end

@implementation ArticlesViewController


#pragma mark - Properties

-(NSMutableArray *) itemsArray {

    if (!_itemsArray) {
        _itemsArray = [[NSMutableArray alloc]init];
    }
    return _itemsArray;

}


#pragma mark - Private API 


-(void)loadArticlesFromURL {

    dispatch_queue_t downloadQueue = dispatch_queue_create("ArticlesDownloader ", NULL);
    dispatch_async(downloadQueue, ^{
        


        NSURL *url = [NSURL URLWithString: ARTICLES_URL];
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        for (NSDictionary *articleDictionary in dictionary[@"news"]) {
            Article *article = [[Article alloc]initWithDictionary:articleDictionary];
            [self.itemsArray addObject:article];
        }
        
        dispatch_async( dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
        
    });

}


#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadArticlesFromURL];

}


#pragma mark - UITableViewDataSource 

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;

}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

   return self.itemsArray.count;

}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    ArticleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.article = [self.itemsArray objectAtIndex:indexPath.row];
    
    return cell;

}


#pragma marka - Segue Management

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ArticleDetailsSegue"]) {
        
        ArticlesDetailsViewController *toViewController =segue.destinationViewController;
        toViewController.article=self.selectedArticle;
    }

 }


#pragma mark - UITableDelagate

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {


    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.selectedArticle = [self.itemsArray objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"ArticleDetailsSegue" sender:self];

}


@end
