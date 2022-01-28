//
//  ViewController.m
//  IOSDemo


#import "ViewController.h"
#import <Flutter/Flutter.h>
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>
#import "AppDelegate.h"

/*
 native加载不同的dart页面
 */

@interface ViewController ()
@property(nonatomic,strong)FlutterViewController *flutterViewController;
@property(nonatomic,strong)FlutterMethodChannel *methodChannel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 30)];
    [btn setTitle:@"跳转flutter" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(gotoFlutter:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    // Do any additional setup after loading the view.
}

-(void)gotoFlutter:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    FlutterEngine *flutterEngine = appDelegate.flutterEngine;
    [flutterEngine runWithEntrypoint:@"channel" initialRoute:@"{name:'devio',dataList:['aa','bb',''cc]}"];
    [GeneratedPluginRegistrant registerWithRegistry:flutterEngine];
    FlutterViewController *flutterViewController = [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
    self.flutterViewController = flutterViewController;
    flutterViewController.modalPresentationStyle =  UIModalPresentationFullScreen;
    [self presentViewController:flutterViewController animated:NO completion:nil];
    
    [self initChannel];
}

#pragma mark - init Channel
- (void)initChannel{
    [self initMethodChannel];
}

- (void)initMethodChannel{
    self.methodChannel = [FlutterMethodChannel methodChannelWithName:@"com.flutterToNative" binaryMessenger:self.flutterViewController];
    ViewController*  __weak weakSelf = self;
    //设置消息处理器，处理来自Dart的消息
    [self.methodChannel  setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        //可以在这里实现flutter发给原生要实现的方法
        //通过call.method来获取方法名称
        if ([@"backToNative" isEqualToString:call.method]) {
            result([NSString stringWithFormat:@"com.flutterToNative收到：%@",call.arguments]);//返回结果给Dart);
            NSLog(@"%@",[NSString stringWithFormat:@"com.flutterToNative收到：%@",call.arguments]);
            //dismiss掉Flutter控制器，回到原生
            [weakSelf dismissViewControllerAnimated:NO completion:nil];
        }
    }];
}

@end
