//
//  BUIView.m
//  sample
//
//  Created by 张玺 on 12-9-10.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import "ZXObject.h"
#import <objc/runtime.h>

@implementation NSObject(ZXObject)

+(void)perform:(void(^)())block1 withCompletionHandler:(void (^)())block2
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        block1();
        dispatch_async(dispatch_get_main_queue(),^{
            block2();
        });
    });
}
-(void)perform:(void(^)())block1 withCompletionHandler:(void (^)())block2
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        block1();
        dispatch_async(dispatch_get_main_queue(),^{
            block2();
        });
    });
}

+(void)perform:(void(^)())block afterDelay:(NSTimeInterval)delay onMainThread:(BOOL)onMain {
    
    dispatch_queue_t queue = onMain ? dispatch_get_main_queue() : dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    double delayInSeconds = delay;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, queue, ^(void){
        block();
    });
}

-(void)perform:(void(^)())block afterDelay:(NSTimeInterval)delay onMainThread:(BOOL)onMain{
    
    dispatch_queue_t queue = onMain ? dispatch_get_main_queue() : dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    double delayInSeconds = delay;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, queue, ^(void){
        block();
    });
}
//======================

const char ZXObjectStoreKey;
-(void)setZXObject:(id)obj
{
    objc_setAssociatedObject(self, &ZXObjectStoreKey, obj, OBJC_ASSOCIATION_RETAIN);
}
-(id)getZXObject
{
    return objc_getAssociatedObject(self, &ZXObjectStoreKey);
}
//=======================

const char ZXObjectEventHandlerDictionary;


-(void)handlerDefaultEventWithBlock:(id)block
{
    [self handlerEventWithBlock:block withIdentifier:@"zxDefaultEventHandler"];
}


-(id)blockForDefaultEvent
{
    return [self blockForEventWithIdentifier:@"zxDefaultEventHandler"];
}

-(void)handlerEventWithBlock:(id)block withIdentifier:(NSString *)identifier
{
    NSAssert(identifier != nil, @"identifier can't be nil.");
    NSMutableDictionary *eventHandlerDictionary = objc_getAssociatedObject(self,&ZXObjectEventHandlerDictionary);
    if(eventHandlerDictionary == nil)
    {
        eventHandlerDictionary = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &ZXObjectEventHandlerDictionary, eventHandlerDictionary, OBJC_ASSOCIATION_RETAIN);
    }
    
    [eventHandlerDictionary setObject:block forKey:identifier];
}

-(id)blockForEventWithIdentifier:(NSString *)identifier
{
    NSAssert(identifier != nil, @"identifier can't be nil.");
    NSDictionary *eventHandlerDictionary = objc_getAssociatedObject(self,&ZXObjectEventHandlerDictionary);
    if(eventHandlerDictionary == nil) return nil;
    return [eventHandlerDictionary objectForKey:identifier];
}

-(void)removeEventBlocks {

    NSMutableDictionary *eventHandlerDictionary = objc_getAssociatedObject(self,&ZXObjectEventHandlerDictionary);
    if (eventHandlerDictionary != nil) {
        
        [eventHandlerDictionary removeAllObjects];
        eventHandlerDictionary = nil;
    }
    
    objc_setAssociatedObject(self, &ZXObjectEventHandlerDictionary, nil, OBJC_ASSOCIATION_ASSIGN);
    objc_removeAssociatedObjects(self);
    
}

//=======================
const char ZXObjectSingleObjectDictionary;

-(void)receiveObject:(void(^)(id object))sendObject
{
    [self receiveObject:sendObject withIdentifier:@"ZXObjectSingleObjectDictionary"];
}
-(void)sendObject:(id)object
{
    [self sendObject:object withIdentifier:@"ZXObjectSingleObjectDictionary"];
}

-(void)receiveObject:(void(^)(id object))sendObject withIdentifier:(NSString *)identifier
{
    NSAssert(identifier != nil, @"identifier can't be nil.");
    NSMutableDictionary *eventHandlerDictionary = objc_getAssociatedObject(self,&ZXObjectSingleObjectDictionary);
    if(eventHandlerDictionary == nil)
    {
        eventHandlerDictionary = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &ZXObjectSingleObjectDictionary, eventHandlerDictionary, OBJC_ASSOCIATION_RETAIN);
    }
    
    [eventHandlerDictionary setObject:sendObject forKey:identifier];
}

-(void)sendObject:(id)object withIdentifier:(NSString *)identifier
{
    NSAssert(identifier != nil, @"identifier can't be nil.");
    
    NSDictionary *eventHandlerDictionary = objc_getAssociatedObject(self,&ZXObjectSingleObjectDictionary);
    if(eventHandlerDictionary == nil)
        return;
    
    void(^block)(id object) =  [eventHandlerDictionary objectForKey:identifier];
    block(object);
}

//=========================

const char ZXRowHeightKey;
-(float)zxRowHeight
{
    NSNumber *number = objc_getAssociatedObject(self,&ZXRowHeightKey);
    if(number == nil) return -1;
    return [number floatValue];
}
-(void)setZXRowHeight:(float)height
{
    objc_setAssociatedObject(self,
                             &ZXRowHeightKey,
                             [NSNumber numberWithFloat:height],
                             OBJC_ASSOCIATION_RETAIN);
}

@end
