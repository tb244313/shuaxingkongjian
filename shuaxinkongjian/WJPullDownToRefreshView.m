//
//  WJPullDownToRefreshView.m
//  shuaxinkongjian
//
//  Created by apple on 16/11/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WJPullDownToRefreshView.h"


@interface WJPullDownToRefreshView ()
//图片
@property (nonatomic, strong) UIImageView *imageView;
//文字
@property (nonatomic, strong) UILabel *label;
@end
@implementation WJPullDownToRefreshView

//添加子控件
-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        //添加控件
        [self addSubview:self.imageView];
        [self addSubview:self.label];
        
        //设置frame
        _imageView.frame = CGRectMake(130, 5, 50, 50);
        _label.frame = CGRectMake(190, 20, 200, 20);
        
    }
    return self;
}
#pragma mark - 懒加载
//getter
-(UIImageView *)imageView{

    if (_imageView == nil) {
        //创建图片
        UIImage *normalImage = [UIImage imageNamed:@"grade_A"];
        
        _imageView = [[UIImageView alloc] initWithImage:normalImage];
    }


    return _imageView;
}

-(UILabel *)label{

    if (_label == nil) {
        _label = [[UILabel alloc] init];
        //设置
        _label.textColor = [UIColor darkGrayColor];
        _label.font = [UIFont systemFontOfSize:16];
        _label.text = @"下拉刷新";
    }


    return _label;
}
@end
