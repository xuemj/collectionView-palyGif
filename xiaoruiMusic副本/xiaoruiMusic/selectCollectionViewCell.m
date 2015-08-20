//
//  selectCollectionViewCell.m
//  xiaoruiMusic
//
//  Created by ald on 15/8/18.
//  Copyright (c) 2015年 xmj. All rights reserved.
//

#import "selectCollectionViewCell.h"

@implementation selectCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor purpleColor];
        
        self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, CGRectGetWidth(self.frame)-10, CGRectGetWidth(self.frame)-10)];
        self.imgView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self addSubview:self.imgView];
        
        
        self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btn.backgroundColor = [UIColor clearColor];
        self.btn.frame = CGRectMake(self.width-40,self.height-40, 40,40);
        [self.btn setImage:[UIImage imageNamed:@"play"]forState:UIControlStateNormal];
        self.btn.backgroundColor = [UIColor orangeColor];
        [self addSubview:self.btn];
    }
    return self;
}


@end
