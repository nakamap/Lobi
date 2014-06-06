//
//  LobiAPI.h
//  LobiCore
//
//  Created by takahashi-kohei on 2014/03/13.
//  Copyright (c) 2014年 面白法人カヤック. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LobiNetworkResponse.h"

@interface LobiAPI : NSObject

/// ---------------------------------
/// @name Manage Account
/// ---------------------------------

/**
 * Lobiのアカウントを取得します。
 *
 * @param baseName Lobiのアカウント名となります。重複時には自動的に連番が振られます。
 */
+ (void)signupWithBaseName:(NSString *)baseName
                completion:(LobiNetworkHandler)handler;


/**
 * UserExternalIDの登録と同時にLobiのアカウントを取得します。
 *
 * @param baseName Lobiのアカウント名となります。重複時には自動的に連番が振られます。
 * @param encryptedExternalID 暗号化されたUserExternalIDを指定してください。
 * @param IV UserExternalIDの暗号化に使用したIVを指定してください。
 */
+ (void)signupWithBaseName:(NSString *)baseName
       encryptedExternalId:(NSString *)encryptedExternalId
                 encryptIv:(NSString *)encryptIv
                   handler:(LobiNetworkHandler)handler;


/**
 * Lobiアカウントのアイコンを更新します。
 *
 * @param icon SDK内部で最大960x960のJPEGに圧縮されます。
 */
+ (void)updateUserIcon:(UIImage *)icon
            completion:(LobiNetworkHandler)handler;

/**
 * Lobiのアカウント名を更新します。
 *
 * @param name 更新するLobiのアカウント名を指名します。
 */
+ (void)updateUserName:(NSString *)name
            completion:(LobiNetworkHandler)handler;


@end
