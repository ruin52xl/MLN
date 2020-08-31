//
//  ArgoListenerProtocol.h
//  ArgoUI
//
//  Created by Dongpeng Dai on 2020/8/27.
//

#ifndef ArgoListenerProtocol_h
#define ArgoListenerProtocol_h

extern NSString *const kArgoListenerArrayPlaceHolder;
extern NSString *const kArgoListenerArrayPlaceHolder_SUPER_IS_2D;

extern NSString *const kArgoListenerChangedObject;
extern NSString *const kArgoListenerChangedKey;
extern NSString *const kArgoListenerWrapper;
//extern NSString *const kArgoListener2DArray;


@class ArgoListenerWrapper, ArgoListenerToken;
@protocol ArgoListenerProtocol;

//typedef void(^ArgoBlockChange)  (id <ArgoListenerProtocol> object, NSDictionary<NSKeyValueChangeKey,id> * change);
//typedef void(^ArgoBlockChange)  (NSKeyValueChange type, id newValue, NSIndexSet *indexSet, NSDictionary *info);
typedef void(^ArgoBlockChange)  (NSString *keyPath, id<ArgoListenerProtocol>object, NSDictionary *change);

@protocol ArgoListenerToken
//- (void)removeObserver;
- (void)removeListener;
@property (nonatomic, assign) NSInteger tokenID;
@end

@protocol ArgoListenerCategoryProtocol <NSObject>
- (id <ArgoListenerToken>)addArgoListenerWithChangeBlock:(ArgoBlockChange)block forKeyPath:(NSString *)keyPath;
- (void)removeArgoListenerWithToken:(id <ArgoListenerToken>)token;

- (void)addArgoListenerWrapper:(ArgoListenerWrapper *)wrapper;
- (void)removeArgoListenerWrapper:(ArgoListenerWrapper *)wrapper;
- (void)notifyArgoListenerKey:(NSString *)key Change:(NSMutableDictionary<NSKeyValueChangeKey,id> *)change;

- (id)argoGetForKeyPath:(NSString *)keyPath;
- (void)argoPutValue:(NSObject *)value forKeyPath:(NSString *)keyPath;

@end

@protocol  ArgoListenerProtocol <ArgoListenerCategoryProtocol>
//- (ArgoListenerWrapper *)addObserverWithChangeBlock:(ArgoBlockChange)block forKeyPath:(NSString *)keyPath;
- (NSObject *)get:(NSString *)key;
- (void)putValue:(NSObject *)value forKey:(NSString *)key;

@end 
#endif /* ArgoListenerProtocol_h */