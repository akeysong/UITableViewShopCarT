//
//  CUWineTableViewCell.h
//  UITableViewShopCarT
//
//  Created by cushiro on 16/1/13.
//  Copyright © 2016年 cushiro. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CUWine,CUWineTableViewCell;

@protocol CUWineTableViewCellDelegate <NSObject>

@optional
- (void)wineCellDidClickPlusButton:(CUWineTableViewCell *)wineCell;
- (void)wineCellDidClickMinusButton:(CUWineTableViewCell *)wineCell;

@end

@interface CUWineTableViewCell : UITableViewCell
/** 酒 */
@property (nonatomic, strong) CUWine *wine;
@property (nonatomic, weak) id<CUWineTableViewCellDelegate> delegate;
@end
