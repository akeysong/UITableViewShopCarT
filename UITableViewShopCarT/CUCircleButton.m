//
//  CUCircleButton.m
//  UITableViewShopCarT
//
//  Created by cushiro on 16/1/13.
//  Copyright © 2016年 cushiro. All rights reserved.
//

#import "CUCircleButton.h"

@implementation CUCircleButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib
{
    // 设置边框颜色
    self.layer.borderColor = [UIColor redColor].CGColor;
    // 设置边框宽度
    self.layer.borderWidth = 1;
    // 设置圆角半径
    self.layer.cornerRadius = self.frame.size.width * 0.5;
}

@end
