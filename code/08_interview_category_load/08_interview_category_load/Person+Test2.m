//
//  Person+Test2.m
//  08_interview_category_load
//
//  Created by Ankui on 4/5/21.
//

#import "Person+Test2.h"

@implementation Person (Test2)

+ (void)load {
    NSLog(@"%s", __func__);
}

+ (void)test {
    NSLog(@"%s", __func__);
}

@end
