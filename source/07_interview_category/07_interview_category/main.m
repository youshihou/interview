//
//  main.m
//  07_interview_category
//
//  Created by Ankui on 4/5/21.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person+Test.h"
#import "Person+Eat.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] init];
        [p run];
//        [p test];
//        [p eat];
    }
    return 0;
}
