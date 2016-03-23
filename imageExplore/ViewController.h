//
//  ViewController.h
//  imageExplore
//
//  Created by Eveloson on 16/3/17.
//  Copyright © 2016年 Eveloson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *imageNum;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *imageDes;

@property (weak, nonatomic) IBOutlet UIView *settingView;

- (IBAction)setting;
- (IBAction)imageChoose:(UISlider *)sender;
- (IBAction)nightMode:(UISwitch *)sender;
- (IBAction)imageSize:(UISlider *)sender;

@end

