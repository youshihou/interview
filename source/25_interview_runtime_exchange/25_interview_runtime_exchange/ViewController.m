//
//  ViewController.m
//  25_interview_runtime_exchange
//
//  Created by Ankui on 4/9/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSMutableArray *array = [NSMutableArray array];
//    NSLog(@"%@", [array class]);
    [array addObject:@"666"];
    NSString *object = nil;
    [array addObject:object];
    [array insertObject:object atIndex:0];
    NSLog(@"%@", array);
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"name"] = @"666";
    dict[object] = object;
    NSLog(@"%@", dict);
    
    NSString *value = dict[object];
    NSLog(@"%@", value);
}

- (IBAction)click1 {
    NSLog(@"%s", __func__);
}

- (IBAction)click2 {
    NSLog(@"%s", __func__);
}

- (IBAction)click3 {
    NSLog(@"%s", __func__);
}

@end
