//
//  TestScrollView.m
//  Test-SO
//
//  Created by Sandeep Bhandari on 5/18/16.
//  Copyright © 2016 Sandeep Bhandari. All rights reserved.
//

#import "TestScrollView.h"

@implementation TestScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *hitView = [super hitTest:point withEvent:event];
    if (hitView != nil && CGRectContainsPoint(self.scrollViewBehind.frame,point)) {
        return self.collectionViewBehind;
    }
    return hitView;
}
@end
