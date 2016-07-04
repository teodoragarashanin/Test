//
//  ArticleTableViewCell.m
//  News
//
//  Created by Teodora on 4/27/16.
//  Copyright © 2016 Teodora. All rights reserved.
//

#import "ArticleTableViewCell.h"

@implementation ArticleTableViewCell


#pragma mark - Properties

-(void)setArticle:(Article *)article {
    _article=article;

    self.asyncImageView.imageURL=article.imageURL;
    self.titleLabel.text=article.title;

}


@end
