//
//  CYUpgradeNoticeView.m
//  SouDuoKe_Shop
//
//  Created by Charles Yao on 2017/3/27.
//  Copyright © 2017年 souduoke. All rights reserved.
//

#import "CYDialogView.h"
#import "NSString+CYExtention.h"

#define kMainBoundsWidth        [UIScreen mainScreen].bounds.size.width
#define kMainBoundsHeight       [UIScreen mainScreen].bounds.size.height
// UI使用的是iPhone6屏幕尺寸
#define kUIScale (kMainBoundsWidth / 375.0)


@interface CYDialogView()

@property (strong, nonatomic) NSDictionary *dic;

@end

@implementation CYDialogView


+(void)showWithTitle:(NSString *)title headIcon:(NSString *)headIconName detail:(NSString *)detailText confirmAction:(void (^)())confirmAction {
    CYDialogView *view = [[CYDialogView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.titleText = title;
    view.headImgName = headIconName;
    view.detailText = detailText;
    view.confirmAction = confirmAction;
    [view setUpAndShow];
}

- (void)setUpAndShow {
    [self setFrame:[UIScreen mainScreen].bounds];
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 280*kUIScale, 500)];
    [self addSubview:bgView];
    bgView.center = self.center;
    bgView.userInteractionEnabled = YES;
    bgView.backgroundColor = [UIColor clearColor];
    bgView.layer.cornerRadius = 13.f*kUIScale;
    bgView.layer.masksToBounds = YES;
    
    //实现模糊效果
    UIBlurEffect *blurEffrct =[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc]initWithEffect:blurEffrct];
    visualEffectView.frame = CGRectMake(0, 0, 280*kUIScale, 500);
    [bgView addSubview:visualEffectView];

    CGFloat posY = 10*kUIScale;
    
    if (_headImgName) {
        UIImageView *headImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_headImgName]];
        [headImgView setFrame:CGRectMake((bgView.frame.size.width - headImgView.frame.size.width * kUIScale)*0.5f, posY, headImgView.frame.size.width * kUIScale, headImgView.frame.size.height * kUIScale)];
        [bgView addSubview:headImgView];
        headImgView.userInteractionEnabled = YES;
        posY += headImgView.frame.size.height + 14.f*kUIScale;
    }
    

    if (_titleText) {
        UILabel *titleLabel = [[UILabel alloc]init];
        [titleLabel setText:_titleText];
        [titleLabel setFont:[UIFont systemFontOfSize:18]];
        [titleLabel setTextColor:[UIColor whiteColor]];
        CGSize titleLabelSize = [titleLabel boundingRectWithSize:CGSizeMake(280*kUIScale*0.8f, 500)];
        [titleLabel setFrame:CGRectMake((bgView.frame.size.width - titleLabelSize.width)*0.5f, posY, titleLabelSize.width, titleLabelSize.height)];
        [bgView addSubview:titleLabel];
        [titleLabel setTextAlignment:NSTextAlignmentCenter];
        _titleLabel = titleLabel;
        
        posY += titleLabel.frame.size.height + 14.f*kUIScale;
    }
    
    if (_detailText) {
        UILabel *detailLabel = [[UILabel alloc]init];
        [detailLabel setText:_detailText];
        [detailLabel setTextColor:[UIColor whiteColor]];
        detailLabel.font = [UIFont systemFontOfSize:13];
        detailLabel.textAlignment = NSTextAlignmentCenter;
        CGSize detailLabelSize = [detailLabel boundingRectWithSize:CGSizeMake(bgView.frame.size.width*0.8f, 500)];
        detailLabel.numberOfLines = 100;
        [bgView addSubview:detailLabel];
        [detailLabel setFrame:CGRectMake((bgView.frame.size.width - detailLabelSize.width)*0.5f, posY, detailLabelSize.width, detailLabelSize.height)];
        _detailLabel = detailLabel;
        
        posY += detailLabel.frame.size.height + 14.f*kUIScale;
    }
    
    CGFloat btnWidth = (bgView.frame.size.width - 60.f)/2.f;
    UIButton* cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(20.f, posY, btnWidth, 40)];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancelBtn setBackgroundColor:[UIColor colorWithRed:248.f/255.f green:154.f/255.f blue:68.f/255.f alpha:1.f]];
    cancelBtn.layer.cornerRadius = 6.f;
    [cancelBtn addTarget:self action:@selector(cancelBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:cancelBtn];
    
    UIButton* confirmBtn = [[UIButton alloc]initWithFrame:CGRectMake(20 + btnWidth + 20, posY, btnWidth, 40)];
    [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [confirmBtn setBackgroundColor:[UIColor colorWithRed:248.f/255.f green:154.f/255.f blue:68.f/255.f alpha:1.f]];
    confirmBtn.layer.cornerRadius = 6.f;
    [confirmBtn addTarget:self action:@selector(confirmBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:confirmBtn];
    posY += confirmBtn.frame.size.height + 14*kUIScale;
    
    [bgView setFrame:CGRectMake(0, 0, 280*kUIScale, posY)];
    bgView.center = CGPointMake(kMainBoundsWidth*0.5f, kMainBoundsHeight*0.5f);
    
    NSEnumerator *frontToBackWindows = [UIApplication.sharedApplication.windows reverseObjectEnumerator];
    for (UIWindow *window in frontToBackWindows) {
        BOOL windowOnMainScreen = window.screen == UIScreen.mainScreen;
        BOOL windowIsVisible = !window.hidden && window.alpha > 0;
        BOOL windowLevelNormal = window.windowLevel == UIWindowLevelNormal;
        
        if (windowOnMainScreen && windowIsVisible && windowLevelNormal) {
            [window addSubview:self];
            break;
        }
    }
}

- (void)cancelBtnClicked:(id)sender {
    if (self.cancelAction) {
        self.cancelAction();
    }else {
        [self removeFromSuperview];
    }
}

- (void)confirmBtnClicked:(id)sender {
    if(self.confirmAction) {
        self.confirmAction();
    }
}

@end
