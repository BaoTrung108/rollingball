//
//  ViewController.m
//  rollingBall
//
//  Created by Trung Bao on 11/12/15.
//  Copyright © 2015 Trung Bao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIView *ball;
    CGFloat ballradius;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    ballradius = 64.0;
    [self addball];
    [self rollingball];
    [self rotateball];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) addball {
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball1"]];
    ball.center = CGPointMake(self.view.bounds.size.width - ballradius, self.view.bounds.size.height *0.5);
    [self.view addSubview:ball];
}
- (void) rollingball {
    [UIView animateWithDuration:10 animations:^{
        ball.center = CGPointMake(self.view.bounds.size.width - ballradius, self.view.bounds.size.height *0.5);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:10 animations:^{
            ball.center = CGPointMake(ballradius, self.view.bounds.size.height * 0.5);
        } completion:^(BOOL finished) {
            [self rollingball];
        }];
    }];
}
- (void) rotateball {
    [UIView animateWithDuration:10 animations:^{
        ball.transform = CGAffineTransformMakeRotation(-3.14);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:10 animations:^{
            ball.transform = CGAffineTransformMakeRotation(0);
        } completion:^(BOOL finished) {
            [self rotateball];
        }];
    }];
}

@end
