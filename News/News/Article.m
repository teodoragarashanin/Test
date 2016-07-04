//
//  Article.m
//  News
//
//  Created by Teodora on 4/27/16.
//  Copyright © 2016 Teodora. All rights reserved.
//

#import "Article.h"

@implementation Article

#pragma mark -  Designated Initializers

-(instancetype)initWithTitle: (NSString *) title description: (NSString *) desc imageURL: (NSString *) imageURL andLink: (NSString *) link {

    if(self = [super init]) {
    
        self.title=title;
        self.desc=desc;
        self.imageURL=imageURL;
        self.link=link;
    
    
    }

    return self;
}

-(instancetype) initWithDictionary: (NSDictionary *) dictionary {

    if (self=[super init]) {
        
        
        self.title = dictionary[@"title"];
        self.imageURL = dictionary[@"imageUrl"];
        self.desc = dictionary[@"description"];
        self.link=dictionary[@"url"];
    }
    return self;
}
@end


