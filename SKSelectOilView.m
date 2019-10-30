//
//  SKSelectOilView.m
//  YOUKAJIA
//
//  Created by 阿汤哥 on 2019/10/25.
//  Copyright © 2019 YOUKAJIA. All rights reserved.
//

#define eheight kAuto(140)

#import "SKSelectOilView.h"

@implementation SKSelectOilView

+ (void)showAlertcomBack:(backSelectName1)select OlHeight:(CGFloat)height{
    SKSelectOilView *vc = [[SKSelectOilView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    vc.select = ^(NSString * _Nonnull nameStr) {
        select(nameStr);
    };
    vc.alertView.frame = CGRectMake(kAuto(17), height, kAuto(80), eheight);
    [vc beginAnimal];
    [[UIApplication sharedApplication].keyWindow addSubview:vc];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}
- (void)setUI{
    [self addSubview:self.bgView];
    
    [self addSubview:self.alertView];
    
    NSArray *arr = [self titles];
    
    for (int i=0; i<arr.count; i++) {
        UIButton *button = [UIButton buttonWithFrame:CGRectMake(0, i*kAuto(35), self.alertView.frame.size.width, kAuto(35)) title:arr[i] titleColor:UIColorFromRGB(0x333333) font:kPfFont(14) image:nil color:nil tag:i target:self action:@selector(btnCLick:)];
        [self.alertView addSubview:button];
    }
}
- (UIView *)bgView{
    if (!_bgView) {
        _bgView = [UIView viewWithFrame:self.bounds backgroundcolor:[UIColor clearColor]];
        _bgView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(endAnimal)];
        [_bgView addGestureRecognizer:tap];
    }
    return _bgView;
}
- (void)btnCLick:(UIButton *)button{
    if (self.select) {
        self.select(button.titleLabel.text);
    }
    [self endAnimal];
}
- (NSArray *) titles {
    return @[@"90#汽油",
             @"93#汽油",
             @"97#汽油",
             @"0#柴油",
             ];
}
- (UIView *)alertView{
    if (!_alertView) {
        _alertView = [UIView viewWithFrame:CGRectMake(kAuto(17), KTopHeight+kAuto(118), kAuto(80), eheight) backgroundcolor:UIColorFromRGB(0xF2F2F2)];
    }
    return _alertView;
}
- (void)beginAnimal{
//    [UIView animateWithDuration:0.3 animations:^{
//        self.alertView.frame = CGRectMake(kAuto(17), KTopHeight+kAuto(90), kAuto(80), eheight);
//    }];
}
- (void)endAnimal{
//    [UIView animateWithDuration:0.3 animations:^{
//        self.alertView.frame = CGRectMake(kAuto(17), KTopHeight+kAuto(90), kAuto(80), 0);
//    } completion:^(BOOL finished) {
//        [self removeFromSuperview];
//    }];
    [self removeFromSuperview];
}
@end
