//
//  Person.m
//  17_interview_runtime
//
//  Created by Ankui on 4/7/21.
//

#import "Person.h"


//#define TallMask 1
//#define RichMask 2
//#define HandsomeMask 4

//#define TallMask 0b00000001
//#define RichMask 0b00000010
//#define HandsomeMask 0b00000100


#define TallMask (1<<0) //1
#define RichMask (1<<1)
#define HandsomeMask (1<<2)

@interface Person () {
    union _tallRichHandsome {
        char bits;
        struct {
            char tall : 1;
            char rich : 1;
            char handsome : 1;
        };
    } _tallRichHandsome;
}


@end

@implementation Person

- (void)setTall:(BOOL)tall {
    if (tall) {
        _tallRichHandsome.bits |= TallMask;
    } else {
        _tallRichHandsome.bits &= ~TallMask;
    }
}

- (void)setRich:(BOOL)rich {
    if (rich) {
        _tallRichHandsome.bits |= RichMask;
    } else {
        _tallRichHandsome.bits &= ~RichMask;
    }
}

- (void)setHandsome:(BOOL)handsome {
    if (handsome) {
        _tallRichHandsome.bits |= HandsomeMask;
    } else {
        _tallRichHandsome.bits &= ~HandsomeMask;
    }
}

- (BOOL)isTall {
    return !!(_tallRichHandsome.bits & TallMask);
}

- (BOOL)isRich {
    return !!(_tallRichHandsome.bits & RichMask);
}

- (BOOL)isHandsome {
    return !!(_tallRichHandsome.bits & HandsomeMask);
}

@end














//@interface Person () {
//    struct _tallRichHandsome {
//        char tall : 1;
//        char rich : 1;
//        char handsome : 1;
//    } _tallRichHandsome;
//
//}
//
//
//@end
//
//@implementation Person
//
//- (void)setTall:(BOOL)tall {
//    _tallRichHandsome.tall = tall;
//}
//
//- (void)setRich:(BOOL)rich {
//    _tallRichHandsome.rich = rich;
//}
//
//- (void)setHandsome:(BOOL)handsome {
//    _tallRichHandsome.handsome = handsome;
//}
//
//- (BOOL)isTall {
//    return !!_tallRichHandsome.tall;
//}
//
//- (BOOL)isRich {
//    return !!_tallRichHandsome.rich;
//}
//
//- (BOOL)isHandsome {
//    return !!_tallRichHandsome.handsome;
//}
//
//@end




//@interface Person () {
//    char _tallRichHandsome;
//}
//
//
//@end
//
//@implementation Person
//
//- (void)test {
//    NSLog(@"%s", __func__);
//}
//
//- (instancetype)init {
//    self = [super init];
//    if (self) {
//        _tallRichHandsome = 0b00000011;
//    }
//    return self;
//}
//
//- (void)setTall:(BOOL)tall {
//    if (tall) {
//        _tallRichHandsome |= TallMask;
//    } else {
//        _tallRichHandsome &= ~TallMask;
//    }
//}
//
//- (void)setRich:(BOOL)rich {
//    if (rich) {
//        _tallRichHandsome |= RichMask;
//    } else {
//        _tallRichHandsome &= ~RichMask;
//    }
//}
//
//- (void)setHandsome:(BOOL)handsome {
//    if (handsome) {
//        _tallRichHandsome |= HandsomeMask;
//    } else {
//        _tallRichHandsome &= ~HandsomeMask;
//    }
//}
//
//- (BOOL)isTall {
////    return !!(_tallRichHandsome & 1);
//    return !!(_tallRichHandsome & TallMask);
//}
//
//- (BOOL)isRich {
////    return !!(_tallRichHandsome & 2);
//    return !!(_tallRichHandsome & RichMask);
//}
//
//- (BOOL)isHandsome {
////    return !!(_tallRichHandsome & 4);
//    return !!(_tallRichHandsome & HandsomeMask);
//}
//
//@end
