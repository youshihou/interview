//
//  PermanentThread.m
//  29_interview_runloop_thread
//
//  Created by Ankui on 4/10/21.
//

#import "PermanentThread.h"

@interface InnerThread : NSThread

@end

@implementation InnerThread

- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end


@interface PermanentThread ()

@property (nonatomic, strong) InnerThread *thread;
//@property (nonatomic, assign, getter=isStop) BOOL stop;
@end

@implementation PermanentThread

- (void)dealloc {
    NSLog(@"%s", __func__);
    [self stop];
}

- (instancetype)init {
    self = [super init];
    if (self) {
//        _stop = NO;
//        __weak typeof(self) weakSelf = self;
        _thread = [[InnerThread alloc] initWithBlock:^{
//            [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
//            while (weakSelf && !weakSelf.isStop) {
//                [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
//            }
            
            
            NSLog(@"------ begin ------");
            CFRunLoopSourceContext ctx = {0};
            CFRunLoopSourceRef source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &ctx);
            CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
            CFRelease(source);
//            while (weakSelf && !weakSelf.isStop) {
//                // true代表执行完source就会退出当前的runloop
//                CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, true);
//            }
            
            CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, false);
            NSLog(@"------ end ------");
        }];
    }
    return self;
}

- (void)start {    
    [self.thread start];
}

- (void)stop {
    if (!self.thread) { return; }
    
    [self performSelector:@selector(_stopThread) onThread:self.thread withObject:nil waitUntilDone:YES];
}

- (void)doTask:(void (^)(void))task {
    if (!self.thread || !task) { return; }
    
    [self performSelector:@selector(_doTask:) onThread:self.thread withObject:task waitUntilDone:NO];
}

- (void)_doTask:(void(^)(void))task {
    task();
}

- (void)_stopThread {
//    self.stop = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.thread = nil;
}

@end
