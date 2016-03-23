//
//  ViewController.m
//  imageExplore
//
//  Created by Eveloson on 16/3/17.
//  Copyright © 2016年 Eveloson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSArray *_allDesc;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    _images = [NSMutableArray arrayWithCapacity:100];
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"imageDesc" ofType:@"plist"];
    _allDesc = [NSArray arrayWithContentsOfFile:path];
    //设置默认图片
    _imageDes.text = _allDesc[0];
}

-(UIImage *) chooseImageByNo:(int)no {
    return [self getImageFromURL:[NSString stringWithFormat:@"http://fjlarge.b0.upaiyun.com/pic/%i.jpg",no]];
}
-(UIImage *) getImageFromURL:(NSString *)fileURL {
    
    NSLog(@"执行图片下载函数");
    
    UIImage * result;
    
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    
    result = [UIImage imageWithData:data];
    
    return result;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setting {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    //1.取出中点
    CGPoint tempCenter = _settingView.center;
    
    //2.修改Y值
    if (_settingView.frame.origin.y == self.view.frame.size.height) {
        tempCenter.y -= _settingView.bounds.size.height;
    }else {
        tempCenter.y += _settingView.bounds.size.height;
    }
    //3.重新赋值
    _settingView.center = tempCenter;

    
    [UIView commitAnimations];
}
- (IBAction)imageChoose:(UISlider *)sender {
    //1.设置图片序号
    self.imageNum.text = [NSString stringWithFormat:@"%.f/10",sender.value];
    //2.设置图片
    self.image.image = [UIImage imageNamed:[NSString stringWithFormat:@"%.f",sender.value]];
    //3.设置图片描述

    self.imageDes.text = _allDesc[(int)(sender.value-0.5)];
    
    
}

- (IBAction)nightMode:(UISwitch *)sender {
    if (sender.on) {
        self.view.backgroundColor = [UIColor darkGrayColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
}

- (IBAction)imageSize:(UISlider *)sender {
    _image.transform = CGAffineTransformMakeScale(sender.value,sender.value);
}
@end
