//
//  ViewController.m
//  29_interview_runloop_thread
//
//  Created by Ankui on 4/10/21.
//

#import "ViewController.h"
#import "PermanentThread.h"

@interface ViewController ()

@property (nonatomic, strong) PermanentThread *thread;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.thread = [[PermanentThread alloc] init];
    [self.thread start];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.thread doTask:^{
        NSLog(@"%@", [NSThread currentThread]);
    }];
}

- (void)dealloc {
    NSLog(@"%s", __func__);
//    [self stop];
}

- (IBAction)stop {
    [self.thread stop];
}

@end
