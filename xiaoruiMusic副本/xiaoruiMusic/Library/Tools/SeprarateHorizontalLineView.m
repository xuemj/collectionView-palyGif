//
//  SeprarateHorizontalLineView.m
//  aldp2p
//
//  Created by ysk on 15/7/28.
//  Copyright (c) 2015年 aldp2p. All rights reserved.
//

#import "SeprarateHorizontalLineView.h"

@implementation SeprarateHorizontalLineView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
           }
    return self;
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
-(void)updateConstraints
{
    [self.constraints enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLayoutConstraint *constraint = obj;
        if (constraint.firstItem == self) {
            if (constraint.firstAttribute == NSLayoutAttributeHeight) {
                constraint.constant = (1 / [UIScreen mainScreen].scale) * 1.0f;
            }
        }
    }];
    [super updateConstraints];
}


@end
