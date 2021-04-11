//
//  ViewController.m
//  29_interview_runloop_thread
//
//  Created by Ankui on 4/10/21.
//

#import "ViewController.h"
#import "Thread.h"

@interface ViewController ()

@property (nonatomic, strong) Thread *thread;
@property (nonatomic, assign, getter=isStop) BOOL stop;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.thread = [[Thread alloc] initWithTarget:self selector:@selector(run) object:nil];
    
    self.stop = NO;
    __weak typeof(self) weakSelf = self;
    self.thread = [[Thread alloc] initWithBlock:^{
        NSLog(@"%@ --------- begin ---------", [NSThread currentThread]);
        [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
//        [[NSRunLoop currentRunLoop] run];
        while (weakSelf && !weakSelf.isStop) {
            NSLog(@"%@", weakSelf);
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }
        NSLog(@"%@ --------- end ---------", [NSThread currentThread]);
    }];
    [self.thread start];
}

//- (void)run {
//    NSLog(@"%s %@", __func__, [NSThread currentThread]);
//    [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
//    [[NSRunLoop currentRunLoop] run];
//    NSLog(@"%s --------- end ---------", __func__);
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (!self.thread) { return; }
    
    [self performSelector:@selector(test) onThread:self.thread withObject:nil waitUntilDone:NO];
}

- (void)test {
    NSLog(@"%s %@", __func__, [NSThread currentThread]);
}

- (void)dealloc {
    NSLog(@"%s", __func__);
    [self stop];
}

- (IBAction)stop {
    if (!self.thread) { return; }
    // YES代表等子线程的的任务执行完后再继续执行主线程的任务
    [self performSelector:@selector(stopThread) onThread:self.thread withObject:nil waitUntilDone:YES];
}

- (void)stopThread {
    NSLog(@"%s %@", __func__, [NSThread currentThread]);
    
    self.stop = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.thread = nil;
}

@end
