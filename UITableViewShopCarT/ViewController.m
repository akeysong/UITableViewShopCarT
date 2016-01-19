//
//  ViewController.m
//  UITableViewShopCarT
//
//  Created by cushiro on 16/1/13.
//  Copyright © 2016年 cushiro. All rights reserved.
//

#import "ViewController.h"
#import "MJExtension.h"
#import "CUWine.h"
#import "CUWineTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,CUWineTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *buyBtn;

/** 酒 */
@property (nonatomic, strong) NSArray<CUWine *> *wineArray;
/** 购物车 */
@property (nonatomic, strong) NSMutableArray<CUWine *> *shoppingCarArray;



@end

@implementation ViewController
- (NSArray<CUWine *> *)wineArray{
    if(!_wineArray){
        _wineArray=[CUWine mj_objectArrayWithFilename:@"wine.plist"];
    }
    return _wineArray;
}
-(NSMutableArray<CUWine *> *)shoppingCarArray{
    if (!_shoppingCarArray) {
        _shoppingCarArray=[NSMutableArray array];
    }
    return _shoppingCarArray;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)wineCellDidClickPlusButton:(CUWineTableViewCell *)wineCell{
    double totalPrice = self.totalPriceLabel.text.doubleValue + wineCell.wine.money.doubleValue;
    self.totalPriceLabel.text=[NSString stringWithFormat:@"%.2lf",totalPrice];
    self.buyBtn.enabled=YES;
    if (![self.shoppingCarArray containsObject:wineCell.wine]) {
        [self.shoppingCarArray addObject:wineCell.wine];
    }
}
-(void)wineCellDidClickMinusButton:(CUWineTableViewCell *)wineCell{
    double totalPrice = self.totalPriceLabel.text.doubleValue - wineCell.wine.money.doubleValue;
    self.totalPriceLabel.text=[NSString stringWithFormat:@"%.2lf",totalPrice];
    self.buyBtn.enabled=(totalPrice>0);
    if(wineCell.wine.count==0){
        [self.shoppingCarArray removeObject:wineCell.wine];
    }
}
- (IBAction)buyBtnClick {
    for (CUWine *wine in self.shoppingCarArray) {
        NSLog(@"购买了%d瓶 (%@)",wine.count,wine.name);
    }
    
}
- (IBAction)clearBtnClick:(id)sender {
    for (CUWine *wine in self.shoppingCarArray) {
        wine.count = 0;
    }
    [self.tableView reloadData];
    self.totalPriceLabel.text  = @"0";
    [self.shoppingCarArray removeAllObjects];
    self.buyBtn.enabled = NO;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.wineArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *ID=@"wine";
    CUWineTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    cell.delegate=self;
    cell.wine=self.wineArray[indexPath.row];
    return cell;
}
@end
