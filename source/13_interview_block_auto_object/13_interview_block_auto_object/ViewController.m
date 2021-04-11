//
//  ViewController.m
//  13_interview_block_auto_object
//
//  Created by Ankui on 4/6/21.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    Person *p = [[Person alloc] init];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSLog(@"%@", p);
//    });
//    NSLog(@"%s", __func__);
    
//    Person *p = [[Person alloc] init];
//    __weak Person *weakP = p;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSLog(@"%@", weakP);
//    });
//    NSLog(@"%s", __func__);

    
//    Person *p = [[Person alloc] init];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"%@", p);
//        });
//    });
//    NSLog(@"%s", __func__);

    
//    Person *p = [[Person alloc] init];
//    __weak Person *weakP = p;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"%@", weakP);
//        });
//    });
//    NSLog(@"%s", __func__);
    
    
//    Person *p = [[Person alloc] init];
//    __weak Person *weakP = p;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSLog(@"1------%@", weakP);
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"2------%@", p);
//        });
//    });
//    NSLog(@"%s", __func__);

    
    Person *p = [[Person alloc] init];
    __weak Person *weakP = p;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"1------%@", p);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"2------%@", weakP);
        });
    });
    NSLog(@"%s", __func__);

}

@end
