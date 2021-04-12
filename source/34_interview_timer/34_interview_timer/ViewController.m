//
//  ViewController.m
//  34_interview_timer
//
//  Created by Ankui on 4/12/21.
//

#import "ViewController.h"
#import "ProxyTask.h"

@interface ViewController ()

@property (nonatomic, strong) CADisplayLink *link;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)dealloc {
    NSLog(@"%s", __func__);
    [self.link invalidate];
    [self.timer invalidate];
}

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(test)];
//    [self.link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(test) userInfo:nil repeats:YES];
    
//    __weak typeof(self) weakSelf = self;
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        [weakSelf test];
//    }];
    
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:[ProxyTask proxyWithTarget:self] selector:@selector(test) userInfo:nil repeats:YES];
    
    self.link = [CADisplayLink displayLinkWithTarget:[ProxyTask proxyWithTarget:self] selector:@selector(test)];
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)test {
    NSLog(@"%s", __func__);
}


@end
