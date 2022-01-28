//
//  FirstViewController.m
//  IOSDemo



#import "FirstViewController.h"
#import <Flutter/Flutter.h>
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>
#import "AppDelegate.h"


/*
 native与dart之间的通讯
 
 */

@interface FirstViewController ()<FlutterStreamHandler>
@property(nonatomic,strong)FlutterBasicMessageChannel *messageChannel;
@property(nonatomic,strong)FlutterViewController *flutterViewController;
@property (nonatomic) FlutterEventChannel* eventChannel;
@property (nonatomic) FlutterEventSink eventSink;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *sendbtn1 = [[UIButton alloc]initWithFrame:CGRectMake(10, 100, 150, 30)];
    [sendbtn1 setTitle:@"发送MesChannel消息" forState:UIControlStateNormal];
    [sendbtn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    sendbtn1.titleLabel.font = [UIFont systemFontOfSize:14];
    [sendbtn1 addTarget:self action:@selector(sendMessageChannel) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sendbtn1];
    
    UIButton *sendbtn2 = [[UIButton alloc]initWithFrame:CGRectMake(200, 100, 150, 30)];
    [sendbtn2 setTitle:@"发送EveChannel消息" forState:UIControlStateNormal];
    [sendbtn2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    sendbtn2.titleLabel.font = [UIFont systemFontOfSize:14];
    [sendbtn2 addTarget:self action:@selector(sendEventChannel) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sendbtn2];
    
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    FlutterEngine *flutterEngine = appDelegate.flutterEngine;
    [flutterEngine runWithEntrypoint:@"channel" initialRoute:@"{name:'devio',dataList:['aa','bb',''cc]}"];
    [GeneratedPluginRegistrant registerWithRegistry:flutterEngine];
    FlutterViewController *flutterViewController = [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
    self.flutterViewController = flutterViewController;
    flutterViewController.view.frame = CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-200);
    [self.view addSubview:flutterViewController.view];
    
    [self initChannel];
    // Do any additional setup after loading the view.
}
#pragma mark - Native to Dart 发送消息
- (void)sendMessageChannel{
    //用MessageChannel传递数据
    [self.messageChannel sendMessage: @"MessageChannel消息" reply:^(id  _Nullable reply) {
        if (reply != nil) {

        }
    }];
}

- (void)sendEventChannel{
    //用EventChannel传递数据
    if (self.eventSink != nil) {
        self.eventSink(@"EventChannel消息");
    }
}

#pragma mark - init Channel
- (void)initChannel{
    [self initMessageChannel];
    [self initEventChannel];
}

- (void)initMessageChannel{
    self.messageChannel = [FlutterBasicMessageChannel messageChannelWithName:@"BasicMessageChannelPlugin" binaryMessenger:self.flutterViewController codec:[FlutterStringCodec sharedInstance]];
    //设置消息处理器，处理来自Dart的消息
    [self.messageChannel setMessageHandler:^(NSString* message, FlutterReply reply) {
        reply([NSString stringWithFormat:@"BasicMessageChannel收到：%@",message]);
        NSLog(@"%@",[NSString stringWithFormat:@"BasicMessageChannel收到：%@",message]);
    }];
}


- (void)initEventChannel{
    self.eventChannel = [FlutterEventChannel eventChannelWithName:@"EventChannelPlugin" binaryMessenger:self.flutterViewController];
    
    //设置消息处理器，处理来自Dart的消息
    [self.eventChannel setStreamHandler:self];
}

#pragma mark - <FlutterStreamHandler>
//这个onListen是Flutter端开始监听这个channel时的回调，第二个参数 EventSink是用来传数据的载体
- (FlutterError* _Nullable)onListenWithArguments:(id _Nullable)arguments eventSink:(FlutterEventSink)eventSink {
    // arguments flutter给native的参数
    // 回调给flutter， 建议使用实例指向，因为该block可以使用多次
    self.eventSink = eventSink;
    return nil;
}

/// flutter不再接收
- (FlutterError* _Nullable)onCancelWithArguments:(id _Nullable)arguments {
    // arguments flutter给native的参数
    self.eventSink = nil;
    return nil;
}


@end
