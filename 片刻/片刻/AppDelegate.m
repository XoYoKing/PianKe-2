//
//  AppDelegate.m
//  片刻
//
//  Created by Mr.Jiang on 16/1/13.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//
#define WIDTH [[UIScreen mainScreen]bounds].size.width


#import "AppDelegate.h"
#import "HomeViewController.h"
#import "LeftViewController.h"
#import "NewFeatureViewController.h"
@interface AppDelegate ()

@property (strong, nonatomic) RESideMenu *myMenu;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    
    HomeViewController* home = [[HomeViewController alloc]init];
   
    LeftViewController* left = [[LeftViewController alloc] init];
    RESideMenu* menu = [[RESideMenu alloc] initWithContentViewController:home leftMenuViewController:left rightMenuViewController:nil];
    self.myMenu = menu;
    menu.panFromEdge = NO;
//    menu.menuPreferredStatusBarStyle = UIStatusBarStyleBlackTranslucent;
    //菜单动画
    menu.scaleMenuView = NO;
    //内容视图的影子
    menu.contentViewShadowEnabled = NO;
    
    menu.delegate = self;
    menu.contentViewScaleValue = 1;
    //偏移量
    menu.contentViewInPortraitOffsetCenterX = WIDTH/2-45;
    
    
    
    //判断是否使用新版本特性，选择跟控制器
    NSString* versionKey = @"CFBundleVersion";
    
        //判断是否使用版本新特性，选择跟控制器
    
        //从沙盒取出存储的上次软件版本号（上次使用的记录）
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
      NSString* lastVersion = [defaults objectForKey:versionKey];
   
        //获取当前使用软件的版本号
        NSString* currentVersion = [[NSBundle mainBundle] infoDictionary][versionKey];
    
    if ([currentVersion isEqualToString:lastVersion]) {
        
       
        
                 self.window.rootViewController = menu;
        
            }else{
                 NewFeatureViewController* new = [[NewFeatureViewController alloc] init];
                self.window.rootViewController = new;
                
                
                //存储本次使用软件的版本
                [defaults setObject:currentVersion forKey:versionKey];
                [defaults synchronize];//马上进行存储，不写随机存储，可能无效
            }
    
       [self.window makeKeyAndVisible];
    
    
    [self addLunchImage];
    return YES;
}

- (void)setRootVC {

    self.window.rootViewController = self.myMenu;
    
}
- (void)addLunchImage{

    UIImageView* lunchImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.window.frame.size.width+80, self.window.frame.size.height+60)];
    [lunchImage setImage:[UIImage imageNamed:@"screen.jpg"]];
    [self.window addSubview:lunchImage];
    
    [UIView animateWithDuration:5.0 animations:^{
        
        [lunchImage setFrame:CGRectMake(-80, 0, self.window.frame.size.width+80, self.window.frame.size.height+60)];
        
    } completion:^(BOOL finished) {
        
        if (finished) {
            [UIView animateWithDuration:1.0 animations:^{
                
                lunchImage.alpha = 0;
            } completion:^(BOOL finished) {
                [lunchImage removeFromSuperview];

            }];
        }
        
    }];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
