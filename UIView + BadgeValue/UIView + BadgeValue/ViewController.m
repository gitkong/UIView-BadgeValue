//
//  ViewController.m
//  UIView + BadgeValue
//
//  Created by clarence on 16/11/1.
//  Copyright © 2016年 clarence. All rights reserved.
//

#import "ViewController.h"
#import "UIView+BadgeValue.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UISwitch *sw;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIButton *leftBarButton;

@end

@implementation ViewController{
    BOOL _flag;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"显示BadgeValue" style:UIBarButtonItemStyleDone target:self action:@selector(click)];
}

- (void)show{
    self.label.fl_badgeValue = @"1";
    self.button.fl_badgeValue = @"2";
    self.segmentedControl.fl_badgeValue = @"10";
    self.textField.fl_badgeValue = @"100";
    self.slider.fl_badgeValue = @"2000";
    self.sw.fl_badgeValue = @"10000";
    self.imageView.fl_badgeValue = @"99";
    self.leftBarButton.fl_badgeValue = @"咧咧";
    self.navigationItem.titleView.fl_badgeValue = @"hello world";
}

- (void)hide{
    self.label.fl_badgeValue = @"";
    self.button.fl_badgeValue = @"0";
    self.segmentedControl.fl_badgeValue = nil;
    self.textField.fl_badgeValue = @"";
    self.slider.fl_badgeValue = @"";
    self.sw.fl_badgeValue = @"";
    self.imageView.fl_badgeValue = @"";
    self.leftBarButton.fl_badgeValue = @"";
    self.navigationItem.titleView.fl_badgeValue = @"0";
}


- (void)click {
    _flag = !_flag;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:_flag ? @"隐藏BadgeValue" : @"显示BadgeValue" style:UIBarButtonItemStyleDone target:self action:@selector(click)];
    
    if (_flag) {
        [self show];
    }
    else{
        [self hide];
    }
}

- (IBAction)operation:(UIButton *)sender {
    if (sender.tag == 0) {
        [self plus:@[self.label,self.button,self.segmentedControl,self.textField,self.slider,self.sw,self.imageView,self.navigationItem.titleView,self.leftBarButton]];
    }
    else if (sender.tag == 1){
        [self minus:@[self.label,self.button,self.segmentedControl,self.textField,self.slider,self.sw,self.imageView,self.navigationItem.titleView,self.leftBarButton]];
    }
}

- (void)plus:(NSArray *)arr{
    for (UIView *view in arr) {
        view.fl_badgeValue = [NSString stringWithFormat:@"%zd",view.fl_badgeValue.integerValue + 1];
//        if ([view isKindOfClass:[UILabel class]]) {
//            NSLog(@"label---%@",view.fl_badgeValue);
//        }
    }
}

- (void)minus:(NSArray *)arr{
    for (UIView *view in arr) {
        view.fl_badgeValue = [NSString stringWithFormat:@"%zd",view.fl_badgeValue.integerValue - 1];
//        if ([view isKindOfClass:[UILabel class]]) {
//            NSLog(@"label---%@",view.fl_badgeValue);
//        }
    }
}

@end
