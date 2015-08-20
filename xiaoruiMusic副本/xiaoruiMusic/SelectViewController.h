//
//  SelectViewController.h
//  xiaoruiMusic
//
//  Created by ald on 15/8/18.
//  Copyright (c) 2015年 xmj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdvertisingColumn.h"
#import "BaseViewController.h"
@interface SelectViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{
    AdvertisingColumn *_headerView;
}
@property(nonatomic,strong)UICollectionView *collectionView;
@end
