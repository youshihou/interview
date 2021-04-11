//
//  ViewController.m
//  32_interview_lock
//
//  Created by Ankui on 4/11/21.
//

#import "ViewController.h"
#import <libkern/OSAtomic.h>

@interface ViewController ()

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger money;

@property (nonatomic, assign) OSSpinLock ticketLock;
@property (nonatomic, assign) OSSpinLock moneyLock;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self testTicket];
    [self testMoney];
}

- (void)testTicket {
    self.count = 15;
    self.ticketLock = OS_SPINLOCK_INIT;
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 5; i++) {
            [self saleOneTicket];
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 5; i++) {
            [self saleOneTicket];
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 5; i++) {
            [self saleOneTicket];
        }
    });
}

- (void)saleOneTicket {
    OSSpinLockLock(&_ticketLock);
    NSInteger count = self.count;
    sleep(.2);
    count--;
    self.count = count;
    NSLog(@"%zd, %@", self.count, [NSThread currentThread]);
    OSSpinLockUnlock(&_ticketLock);
}

- (void)testMoney {
    self.money = 100;
    self.moneyLock = OS_SPINLOCK_INIT;
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            [self saveMoney];
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            [self takeMoney];
        }
    });
}

- (void)saveMoney {
    OSSpinLockLock(&_moneyLock);
    NSInteger money = self.money;
    sleep(.2);
    money += 50;
    self.money = money;
    NSLog(@"save50, %zd, %@", self.money, [NSThread currentThread]);
    OSSpinLockUnlock(&_moneyLock);
}

- (void)takeMoney {
    OSSpinLockLock(&_moneyLock);
    NSInteger money = self.money;
    sleep(.2);
    money -= 20;
    self.money = money;
    NSLog(@"take20, %zd, %@", self.money, [NSThread currentThread]);
    OSSpinLockUnlock(&_moneyLock);
}

@end
