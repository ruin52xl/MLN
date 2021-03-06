//
//  NSDictionary+MLNUIKVO.m
//  MLNUI
//
//  Created by Dai Dongpeng on 2020/3/12.
//

#import "NSDictionary+MLNUIKVO.h"
#import "NSObject+MLNUIReflect.h"

@implementation NSDictionary (MLNUIKVO)

- (NSMutableDictionary *)mlnui_mutalbeCopy {
    NSMutableDictionary *copy = [NSMutableDictionary dictionaryWithCapacity:self.count];
    for (NSString *key in self.allKeys) {
        NSDictionary *value = [self objectForKey:key];
        if ([value respondsToSelector:@selector(mlnui_mutalbeCopy)]) {
            [copy setObject:value.mlnui_mutalbeCopy forKey:key];
        } else {
            [copy setObject:value forKey:key];
        }
    }
    return copy;
}

- (NSDictionary *)mlnui_convertToLuaTableAvailable {
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:self.count];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, NSObject*  _Nonnull obj, BOOL * _Nonnull stop) {
        NSObject *n = [obj mlnui_convertToLuaObject];
        if (n) {
            [dic setObject:n forKey:key];
        }
    }];
    return dic.count > 0 ? dic.copy : self.copy;
}

- (NSMutableDictionary *)mlnui_convertToMDic {
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:self.count];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSObject *n = [obj mlnui_convertToNativeObject];
        if (n) {
            [dic setObject:n forKey:key];
        }
    }];
    return dic;
}
@end

@implementation NSMutableDictionary (MLNUIKVO)

- (NSMutableArray *)mlnui_allMutableKeys {
    NSMutableArray *keys = [NSMutableArray array];
    for (NSString *key in self.allKeys) {
        NSMutableDictionary *dic = [self objectForKey:key];
        if ([dic isKindOfClass:[NSMutableDictionary class]]) {
            [keys addObject:key];
        }
    }
    return keys;
}

- (NSDictionary *)mlnui_copy {
    NSMutableArray *keypaths = [self mlnui_allMutableKeys];
    [keypaths enumerateObjectsUsingBlock:^(NSString *  _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        NSMutableDictionary *dic = [self valueForKey:key];
        NSAssert([dic isKindOfClass:[NSMutableDictionary class]], @"should be mutable");
        [self setValue:dic.mlnui_copy forKey:key];
    }];
    
    return self.copy;
}

@end
