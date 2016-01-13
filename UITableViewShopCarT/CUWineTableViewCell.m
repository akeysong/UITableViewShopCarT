//
//  CUWineTableViewCell.m
//  UITableViewShopCarT
//
//  Created by cushiro on 16/1/13.
//  Copyright © 2016年 cushiro. All rights reserved.
//

#import "CUWineTableViewCell.h"
#import "CUWine.h"
#import "CUCircleButton.h"

@interface CUWineTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *wineImageView;
@property (weak, nonatomic) IBOutlet UILabel *wineNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *winePriceLabel;
@property (weak, nonatomic) IBOutlet CUCircleButton *minusBtn;
@property (weak, nonatomic) IBOutlet UILabel *wineCountLabel;


@end
@implementation CUWineTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setWine:(CUWine *)wine{
    _wine=wine;
    self.wineImageView.image=[UIImage imageNamed:wine.image];
    self.wineNameLabel.text=wine.name;
    self.winePriceLabel.text=wine.money;
    self.wineCountLabel.text=[NSString stringWithFormat:@"%d",wine.count];
    self.minusBtn.enabled = (wine.count > 0);
}
- (IBAction)plusBtnClick {
    self.wine.count++;
    self.wineCountLabel.text=[NSString stringWithFormat:@"%d",self.wine.count];
    self.minusBtn.enabled=YES;
    if([self.delegate respondsToSelector:@selector(wineCellDidClickPlusButton:)]){
        [self.delegate wineCellDidClickPlusButton:self];
    }
}
- (IBAction)minusBtnClick {
    self.wine.count--;
    self.wineCountLabel.text=[NSString stringWithFormat:@"%d",self.wine.count];
    self.minusBtn.enabled=(self.wine.count>0);
    if([self.delegate respondsToSelector:@selector(wineCellDidClickMinusButton:)]){
        [self.delegate wineCellDidClickMinusButton:self];
    }
}


@end
