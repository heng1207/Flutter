//
//  AppDelegate.m
//  IOSDemo


#import "AppDelegate.h"
#import "ViewController.h"
#import "FirstViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.flutterEngine = [[FlutterEngine alloc] initWithName:@"my_flutter" project:nil];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[FirstViewController alloc] init];
    [self.window makeKeyAndVisible];
    
    // Override point for customization after application launch.
    return YES;
}


@end
