//
//  ViewController.m
//  32_interview_lock
//
//  Created by Ankui on 4/11/21.
//

#import "ViewController.h"
#import "OSSpinLockTask.h"
#import "OSUnfairLockTask.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    BaseTask *task = [[OSUnfairLockTask alloc] init];
    [task testTicket];
    [task testMoney];
}


@end
