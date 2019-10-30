//
//  SKSelectOilView.h
//  YOUKAJIA
//
//  Created by 阿汤哥 on 2019/10/25.
//  Copyright © 2019 YOUKAJIA. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^backSelectName1)(NSString * nameStr);
@interface SKSelectOilView : UIView

/**
 name
 */
@property (nonatomic, strong) UIView * alertView;
+ (void)showAlertcomBack:(backSelectName1)select OlHeight:(CGFloat)height;
/**
 name
 */
@property (nonatomic, strong) UIView * bgView;
/**
 name
 */
@property (nonatomic, copy) backSelectName1 select;

- (void)beginAnimal;

@end

NS_ASSUME_NONNULL_END
