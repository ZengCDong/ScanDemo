//
//  ViewController.m
//  ScanDemo
//
//  Created by ZCD on 2017/7/26.
//  Copyright © 2017年 ZCD. All rights reserved.
//

#import "ViewController.h"
#import "LBXScanViewController.h"
#import "SubLBXScanViewController.h"
#import "ZCDNavigationController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//扫一扫
- (IBAction)scanAction:(id)sender {
    LBXScanViewStyle *style = [[LBXScanViewStyle alloc]init];
    style.centerUpOffset = 44;
    style.photoframeAngleStyle = LBXScanViewPhotoframeAngleStyle_Outer;
    style.photoframeLineW = 6;
    style.photoframeAngleW = 24;
    style.photoframeAngleH = 24;
    style.anmiationStyle = LBXScanViewAnimationStyle_LineMove;
    style.animationImage = [UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_light_green"];
    SubLBXScanViewController *vc = [[SubLBXScanViewController alloc]init];
    vc.title = @"扫一扫";
    vc.style = style;
    ZCDNavigationController *acdNav = [[ZCDNavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:acdNav animated:YES completion:nil];
    vc.isQQSimulator = YES;
    vc.scanResult = ^(NSString *strScanned){
        NSLog(@"扫码结果");
    };

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
