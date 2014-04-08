#import <UIKit/UIKit.h>

#import <LobiCore/LobiCore.h>
#import <LobiCore/LobiAPI.h>
#import <LobiCore/LobiNetworkResponse.h>

#import "LobiCoreCommon.h"
#import "LobiCoreAPICommon.h"

/* LobiAPI */
/*
 + (void)signupWithBaseName:(NSString *)baseName
 completion:(LobiNetworkHandler)handler;
 */
void LobiAPI_signup_with_base_name_(const char *game_object_name, int game_object_name_len,
                                    const char *callback_method_name, int callback_method_name_len,
                                    const char *base_name, int base_name_len)
{
    NSString *gameObjectName     = make_autorelease_string(game_object_name);
    NSString *callbackMethodName = make_autorelease_string(callback_method_name);
    NSString *baseName           = make_autorelease_string(base_name);
    [LobiAPI signupWithBaseName:baseName
                     completion:^(LobiNetworkResponse *res)
     {
         LobiAPICommon_callback_to_unity(gameObjectName, callbackMethodName, res);
     }];
}

/*
 + (void)signupWithBaseName:(NSString *)baseName
 encryptedExternalId:(NSString *)encryptedExternalId
 encryptIv:(NSString *)encryptIv
 handler:(LobiNetworkHandler)handler;
 */
void LobiAPI_signup_with_base_name_encrypted_external_id_encrypt_iv_(
                                                                     const char *game_object_name, int  game_object_name_len,
                                                                     const char *callback_method_name, int callback_method_name_len,
                                                                     const char *base_name, int base_name_len,
                                                                     const char *encrypted_external_id, int encrypted_external_id_len,
                                                                     const char *encrypt_iv, int encrypt_iv_len)
{
    NSString *gameObjectName      = make_autorelease_string(game_object_name);
    NSString *callbackMethodName  = make_autorelease_string(callback_method_name);
    NSString *baseName            = make_autorelease_string(base_name);
    NSString *encryptedExternalId = make_autorelease_string(encrypted_external_id);
    NSString *encryptIv           = make_autorelease_string(encrypt_iv);
    
    [LobiAPI signupWithBaseName:baseName
            encryptedExternalId:encryptedExternalId
                      encryptIv:encryptIv
                        handler:^(LobiNetworkResponse *res)
     {
         LobiAPICommon_callback_to_unity(gameObjectName, callbackMethodName, res);
     }];
}

/*
 + (void)updateUserIcon:(UIImage *)icon
             completion:(LobiNetworkHandler)handler;
 */
void LobiAPI_update_user_icon_(const char *game_object_name, int  game_object_name_len,
                               const char *callback_method_name, int callback_method_name_len,
                               const char *file_path, int file_path_len)
{
    NSString *gameObjectName      = make_autorelease_string(game_object_name);
    NSString *callbackMethodName  = make_autorelease_string(callback_method_name);
    NSString *filePath            = make_autorelease_string(file_path);
    if(![[NSFileManager defaultManager] fileExistsAtPath:filePath]){
        LobiAPICommon_error_message_with_ex(LobiAPIStatusCodeFatalError, @{@"error" : @[@"file not found"]});
        return;
    }
    UIImage *iconImage = [UIImage imageWithContentsOfFile:filePath];
    if(iconImage == nil){
        LobiAPICommon_error_message_with_ex(LobiAPIStatusCodeFatalError, @{@"error" : @[@"[UIImage imageWithContentsOfFile:filePath] fail"]});
        return;
    }
    
    [LobiAPI updateUserIcon:iconImage
                 completion:^(LobiNetworkResponse *res)
    {
        LobiAPICommon_callback_to_unity(gameObjectName, callbackMethodName, res);
    }];
}

/*
+ (void)updateUserName:(NSString *)name
            completion:(LobiNetworkHandler)handler;
 */
void LobiAPI_update_user_name_(const char *game_object_name, int  game_object_name_len,
                               const char *callback_method_name, int callback_method_name_len,
                               const char *user_name, int user_name_len)
{
    NSString *gameObjectName      = make_autorelease_string(game_object_name);
    NSString *callbackMethodName  = make_autorelease_string(callback_method_name);
    NSString *userName            = make_autorelease_string(user_name);
    [LobiAPI updateUserName:userName
                 completion:^(LobiNetworkResponse *res)
     {
         LobiAPICommon_callback_to_unity(gameObjectName, callbackMethodName, res);
     }];
}

