//
//  ViewController.m
//  SreenShortDemo
//
//  Created by Vincent on 16/4/18.
//  Copyright © 2016年 文瑜. All rights reserved.
//

#import "ViewController.h"

#import "UIImage+ScreenPic.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad]; 
    
    //添加截屏时的通知，只能在截屏后才会触发
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(userDidScreenShort:) name:UIApplicationUserDidTakeScreenshotNotification object:nil];
}

#pragma mark 获取到截屏的通知后在此做处理
-(void)userDidScreenShort:(NSNotification *)notice{
    NSLog(@"用户截屏了哟");
    
    //人为截屏, 模拟用户截屏行为, 获取所截图片
    UIImage *image_ = [UIImage imageWithScreenshot];
    
    //添加显示
    UIImageView *imgvPhoto = [[UIImageView alloc]initWithImage:image_];
    imgvPhoto.frame = CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2, self.view.frame.size.width/2, self.view.frame.size.height/2);
    
    //添加边框
    CALayer * layer = [imgvPhoto layer];
    layer.borderColor = [
                         [UIColor redColor] CGColor];
    layer.borderWidth = 3.0f;
    //添加四个边阴影
    imgvPhoto.layer.shadowColor = [UIColor redColor].CGColor;
    imgvPhoto.layer.shadowOffset = CGSizeMake(0, 0);
    imgvPhoto.layer.shadowOpacity = 0.5;
    imgvPhoto.layer.shadowRadius = 10.0;
    //添加两个边阴影
    imgvPhoto.layer.shadowColor = [UIColor blackColor].CGColor;
    imgvPhoto.layer.shadowOffset = CGSizeMake(4, 4);
    imgvPhoto.layer.shadowOpacity = 0.5;
    imgvPhoto.layer.shadowRadius = 2.0;
    
    [self.view addSubview:imgvPhoto];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
