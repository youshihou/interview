//
//  main.m
//  10_interview_category_associatedobject
//
//  Created by Ankui on 4/5/21.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person+Test.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p1 = [[Person alloc] init];
        p1.age = 10;
        p1.name = @"jack";
        p1.weight = 30;
        
        Person *p2 = [[Person alloc] init];
        p2.age = 20;
        p2.name = @"rose";
        p2.weight = 50;
        
        NSLog(@"p1: %d %@ %d", p1.age, p1.name, p1.weight);
        NSLog(@"p2: %d %@ %d", p2.age, p2.name, p2.weight);
    }
    return 0;
}
