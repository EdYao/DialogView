//
//  CYUpgradeNoticeView.h
//  SouDuoKe_Shop
//
//  Created by Charles Yao on 2017/3/27.
//  Copyright © 2017年 souduoke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYDialogView : UIView

- (void)setUpAndShow;
@property (copy, nonatomic) NSString *titleText;
@property (weak, nonatomic) UILabel *titleLabel;
@property (copy, nonatomic) NSString *detailText;
@property (weak, nonatomic) UILabel *detailLabel;
@property (copy, nonatomic) NSString *bgImgName;
@property (copy, nonatomic) NSString *headImgName;

@property (weak, nonatomic) UIButton *confirmBtn;

@property (copy, nonatomic) void(^confirmAction)();
@property (copy, nonatomic) void(^cancelAction)();

+(void)showWithTitle:(NSString *)title headIcon:(NSString *)headIconName detail:(NSString *)detailText confirmAction:(void (^)())confirmAction;

@end
