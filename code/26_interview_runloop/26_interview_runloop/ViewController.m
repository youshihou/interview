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
    NSLog(@"%p %p", [NSRunLoop mainRunLoop], [NSRunLoop currentRunLoop]);
    NSLog(@"%p %p", CFRunLoopGetMain(), CFRunLoopGetCurrent());
}


@end
