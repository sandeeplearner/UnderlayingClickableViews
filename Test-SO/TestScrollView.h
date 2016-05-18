//
//  TestScrollView.h
//  Test-SO
//
//  Created by Sandeep Bhandari on 5/18/16.
//  Copyright © 2016 Sandeep Bhandari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestScrollView : UIScrollView
@property (nonatomic,strong) UICollectionView *collectionViewBehind;
@property (nonatomic,strong) UIScrollView *scrollViewBehind;

@end
