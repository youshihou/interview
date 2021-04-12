//
//  ViewController.m
//  32_interview_lock
//
//  Created by Ankui on 4/11/21.
//

#import "ViewController.h"
#import "OSSpinLockTask.h"
#import "OSUnfairLockTask.h"
#import "MutexTask.h"
#import "MutexRecursiveTask.h"
#import "MutexCondTask.h"
#import "NSLockTask.h"
#import "NSRecursiveLockTask.h"
#import "NSConditionTask.h"
#import "NSConditionLockTask.h"
#import "SerialQueueTask.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    BaseTask *task = nil;
//    task = [[OSSpinLockTask alloc] init];
//    task = [[OSUnfairLockTask alloc] init];
//    task = [[MutexTask alloc] init];
//    task = [[MutexRecursiveTask alloc] init];
//    task = [[MutexCondTask alloc] init];
//    task = [[NSLockTask alloc] init];
//    task = [[NSRecursiveLockTask alloc] init];
//    task = [[NSConditionTask alloc] init];
//    task = [[NSConditionLockTask alloc] init];
    task = [[SerialQueueTask alloc] init];
    [task testTicket];
    [task testMoney];
//    [task testOther];
}


@end
