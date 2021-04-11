//
//  Person+Test1.m
//  08_interview_category_load
//
//  Created by Ankui on 4/5/21.
//

#import "Person+Test1.h"

@implementation Person (Test1)

+ (void)load {
    NSLog(@"%s", __func__);
}

+ (void)test {
    NSLog(@"%s", __func__);
}

@end
