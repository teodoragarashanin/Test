//
//  ArticleTableViewCell.h
//  News
//
//  Created by Teodora on 4/27/16.
//  Copyright © 2016 Teodora. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Article.h"
#import "AsyncImageView.h"

@interface ArticleTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet AsyncImageView *asyncImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet Article *article;



@end
