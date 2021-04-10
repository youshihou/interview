//
//  ViewController.m
//  26_interview_runloop
//
//  Created by Ankui on 4/9/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    NSRunLoop *loop = [NSRunLoop currentRunLoop];
//    CFRunLoopRef ref = CFRunLoopGetCurrent();
//    NSLog(@"%p %p", [NSRunLoop mainRunLoop], [NSRunLoop currentRunLoop]);
//    NSLog(@"%p %p", CFRunLoopGetMain(), CFRunLoopGetCurrent());
//    NSLog(@"%@", [NSRunLoop mainRunLoop]);
    
    
//    CFRunLoopObserverRef observer = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, runLoopObserverActivities, NULL);
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopEntry: {
                CFRunLoopMode mode = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
                NSLog(@"kCFRunLoopEntry, %@", mode);
                CFRelease(mode);
            } break;
            case kCFRunLoopExit: {
                CFRunLoopMode mode = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
                NSLog(@"kCFRunLoopExit, %@", mode);
                CFRelease(mode);
            } break;
            default:
                break;
        }
    });
    CFRunLoopAddObserver(CFRunLoopGetMain(), observer, kCFRunLoopCommonModes);
    CFRelease(observer);
}

void runLoopObserverActivities(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    switch (activity) {
        case kCFRunLoopEntry: {
            NSLog(@"kCFRunLoopEntry");
        } break;
        case kCFRunLoopBeforeTimers: {
            NSLog(@"kCFRunLoopBeforeTimers");
        } break;
        case kCFRunLoopBeforeSources: {
            NSLog(@"kCFRunLoopBeforeSources");
        } break;
        case kCFRunLoopBeforeWaiting: {
            NSLog(@"kCFRunLoopBeforeWaiting");
        } break;
        case kCFRunLoopAfterWaiting: {
            NSLog(@"kCFRunLoopAfterWaiting");
        } break;
        case kCFRunLoopExit: {
            NSLog(@"kCFRunLoopExit");
        } break;
        default:
            break;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s", __func__);
    [NSTimer scheduledTimerWithTimeInterval:3 repeats:NO block:^(NSTimer * _Nonnull timer) {
        NSLog(@"-----------");
    }];
}

@end
