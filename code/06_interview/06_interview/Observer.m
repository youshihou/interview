//
//  Observer.m
//  06_interview
//
//  Created by Ankui on 4/5/21.
//

#import "Observer.h"

@implementation Observer

- (void)dealloc {
    NSLog(@"%s", __func__);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (context == @"666") {
        NSLog(@"%@", change);
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
