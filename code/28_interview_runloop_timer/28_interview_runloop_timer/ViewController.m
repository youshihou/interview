//
//  ViewController.m
//  28_interview_runloop_timer
//
//  Created by Ankui on 4/10/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    static int count = 0;
//    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"%d", ++count);
//    }];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"%d", ++count);
    }];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    // NSDefaultRunLoopMode UITrackingRunLoopMode 两种模式
    // NSRunLoopCommonModes不是一个模式，只是一个标记，timer能在——commonModes数组中存放的模式下工作
}


@end
