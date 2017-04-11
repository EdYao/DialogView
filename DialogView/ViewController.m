//
//  ViewController.m
//  DialogView
//
//  Created by Charles Yao on 2017/4/10.
//  Copyright © 2017年 Charles Yao. All rights reserved.
//

#import "ViewController.h"
#import "CYDIalogView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSString *detailText = @"更新了，快滚去更新\n可以说这次打击是叙利亚内战也乱成前几位那样，那么说不定奥巴马的后半生都要背上战争罪人的锅，毕竟他还那么年轻；再到后期当俄罗斯也掺和进去，奥巴马的任期一天天接近结束，就更不适宜动手了。";
    [CYDIalogView showWithTitle:@"这是一个title" headIcon:@"volume" detail:detailText confirmAction:^{
        NSLog(@"confirm action");
    }];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSString *detailText = @"更新了，快滚去更新\n可以说这次打击是叙利亚内战爆发以\n来美军第一次直接进攻叙利亚\n的官方目标，川普的这个做法就跟他的前任奥巴马形成了巨大的反差，我们知道奥巴马可是从没直接对叙利亚政府动过手。\n时间过得很快，从2011年开始到现在已经6生的要背上战争罪人的锅，毕竟他还那么年轻；再到后期当俄罗斯也掺和进去，奥巴马的任期一天天接近结束，就更不适宜动手了。";
    [CYDIalogView showWithTitle:@"这还是一个title" headIcon:@"head_icon" detail:detailText confirmAction:^{
        NSLog(@"confirm");
    }];
}


@end
