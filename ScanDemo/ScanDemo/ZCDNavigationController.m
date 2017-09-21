//
//  ZCDNavigationController.m
//  ScanDemo
//
//  Created by ZCD on 2017/7/26.
//  Copyright © 2017年 ZCD. All rights reserved.
//

#import "ZCDNavigationController.h"
#import "GQGesVCTransition.h"
#import "UIBarButtonItem+DCBarButtonItem.h"
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
//全局背景色
#define DCBGColor RGB(245,245,245)
@interface ZCDNavigationController ()

@end

@implementation ZCDNavigationController
#pragma mark - load初始化一次
+(void)load{
    [self setUpBase];
}
#pragma mark - <初始化>
+ (void)setUpBase{
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = DCBGColor;
    [bar setShadowImage:[UIImage new]];
    [bar setTintColor:[UIColor clearColor]];
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    // 设置导航栏字体颜色
    UIColor * naiColor = [UIColor blackColor];
    attributes[NSForegroundColorAttributeName] = naiColor;
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    bar.titleTextAttributes = attributes;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [GQGesVCTransition validateGesBackWithType:GQGesVCTransitionTypePanWithPercentRight withRequestFailToLoopScrollView:YES]; //手势返回
}
#pragma mark - <返回>
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count >= 1) {
        //返回按钮自定义
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigationbar_back"] style:UIBarButtonItemStyleDone target:self action:@selector(backClick)];
        //影藏BottomBar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    //跳转
    [super pushViewController:viewController animated:animated];
}
#pragma mark - 点击
- (void)backClick {
    
    [self popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 如果单单只是想控制所有界面上方的BarStyle可以打开上面的代码打开这行代码并且在那个界面重写上面的代码
 
 @return UIViewController
 */
- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
