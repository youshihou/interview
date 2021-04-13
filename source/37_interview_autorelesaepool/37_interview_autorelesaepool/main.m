//
//  main.m
//  37_interview_autorelesaepool
//
//  Created by Ankui on 4/13/21.
//

#import <Foundation/Foundation.h>
#import "Person.h"

extern void _objc_autoreleasePoolPrint(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        _objc_autoreleasePoolPrint();
        
        Person *p1 = [[[Person alloc] init] autorelease];
        Person *p2 = [[[Person alloc] init] autorelease];
//        _objc_autoreleasePoolPrint();

        @autoreleasepool {
            Person *p3 = [[[Person alloc] init] autorelease];
//            _objc_autoreleasePoolPrint();

            @autoreleasepool {
                Person *p4 = [[[Person alloc] init] autorelease];
//                _objc_autoreleasePoolPrint();
            }
//            _objc_autoreleasePoolPrint();
        }
//        _objc_autoreleasePoolPrint();
    }
    _objc_autoreleasePoolPrint();
    return 0;
}
