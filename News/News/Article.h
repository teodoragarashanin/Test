//
//  Article.h
//  News
//
//  Created by Teodora on 4/27/16.
//  Copyright © 2016 Teodora. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject

@property(strong, nonatomic) NSString *title;
@property(strong, nonatomic) NSString *desc;
@property(strong, nonatomic) NSString *imageURL;
@property(strong, nonatomic) NSString *link;

-(instancetype)initWithTitle: (NSString *) title description: (NSString *) desc imageURL: (NSString *) imageURL andLink: (NSString *) link;
-(instancetype) initWithDictionary: (NSDictionary *) dictionary;
@end
