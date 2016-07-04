//
//  AsyncImageView.m
//  News
//
//  Created by Teodora on 4/27/16.
//  Copyright © 2016 Teodora. All rights reserved.
//

#import "AsyncImageView.h"

@implementation AsyncImageView

#pragma mark - Properties

-(void)setImageURL:(NSString *)imageURL {

    _imageURL=imageURL;
    
    dispatch_queue_t downloadQueue = dispatch_queue_create("ImageDownloader", NULL);
    dispatch_async(downloadQueue, ^{
        
        NSURL *url = [NSURL URLWithString:imageURL];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = image;
            
        });
        
        
    });

}


@end
