//
//  RCTTDAdTrackingSDK.m
//  TalkingDataSDKDemo
//
//  Created by bliss_ddo on 2019/6/21.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "RCTTalkingDataSDK.h"
#import "TalkingDataSDK.h"


@implementation TalkingDataProfileTypeRN

RCT_EXPORT_MODULE(TalkingDataProfileType);

+ (BOOL)requiresMainQueueSetup
{
  return YES;
}

- (NSDictionary *)constantsToExport
{
  return
  @{
    @"ANONYMOUS":@(TalkingDataProfileTypeAnonymous),
    @"REGISTERED":@(TalkingDataProfileTypeRegistered),
    @"SINA_WEIBO":@(TalkingDataProfileTypeSinaWeibo),
    @"QQ":@(TalkingDataProfileTypeQQ),
    @"QQ_WEIBO":@(TalkingDataProfileTypeQQWeibo),
    @"ND91":@(TalkingDataProfileTypeND91),
    @"WEIXIN":@(TalkingDataProfileTypeWeiXin),
    @"TYPE1":@(TalkingDataProfileTypeType1),
    @"TYPE2":@(TalkingDataProfileTypeType2),
    @"TYPE3":@(TalkingDataProfileTypeType3),
    @"TYPE4":@(TalkingDataProfileTypeType4),
    @"TYPE5":@(TalkingDataProfileTypeType5),
    @"TYPE6":@(TalkingDataProfileTypeType6),
    @"TYPE7":@(TalkingDataProfileTypeType7),
    @"TYPE8":@(TalkingDataProfileTypeType8),
    @"TYPE9":@(TalkingDataProfileTypeType9),
    @"TYPE10":@(TalkingDataProfileTypeType10),
    };
}

@end


@implementation RCTConvert (TalkingDataProfileType)

RCT_ENUM_CONVERTER(TalkingDataProfileType,
                   (@{
                      @"ANONYMOUS":@(TalkingDataProfileTypeAnonymous),
                      @"REGISTERED":@(TalkingDataProfileTypeRegistered),
                      @"SINA_WEIBO":@(TalkingDataProfileTypeSinaWeibo),
                      @"QQ":@(TalkingDataProfileTypeQQ),
                      @"QQ_WEIBO":@(TalkingDataProfileTypeQQWeibo),
                      @"ND91":@(TalkingDataProfileTypeND91),
                      @"WEIXIN":@(TalkingDataProfileTypeWeiXin),
                      @"TYPE1":@(TalkingDataProfileTypeType1),
                      @"TYPE2":@(TalkingDataProfileTypeType2),
                      @"TYPE3":@(TalkingDataProfileTypeType3),
                      @"TYPE4":@(TalkingDataProfileTypeType4),
                      @"TYPE5":@(TalkingDataProfileTypeType5),
                      @"TYPE6":@(TalkingDataProfileTypeType6),
                      @"TYPE7":@(TalkingDataProfileTypeType7),
                      @"TYPE8":@(TalkingDataProfileTypeType8),
                      @"TYPE9":@(TalkingDataProfileTypeType9),
                      @"TYPE10":@(TalkingDataProfileTypeType10),
                      }),
                   TalkingDataProfileTypeAnonymous,
                   integerValue)

@end

@implementation TalkingDataGenderRN

RCT_EXPORT_MODULE(TalkingDataGender);

+ (BOOL)requiresMainQueueSetup
{
  return YES;
}


- (NSDictionary *)constantsToExport
{
  return
  @{
    @"UNKNOWN":@(TalkingDataGenderUnknown),
    @"MALE":@(TalkingDataGenderMale),
    @"FEMALE":@(TalkingDataGenderFemale),
    };
}

@end


@implementation RCTConvert (TalkingDataGender)

RCT_ENUM_CONVERTER(TalkingDataGender,
                   (@{
                      @"UNKNOWN":@(TalkingDataGenderUnknown),
                      @"MALE":@(TalkingDataGenderMale),
                      @"FEMALE":@(TalkingDataGenderFemale),
                      }),
                   TalkingDataGenderUnknown,
                   integerValue)

@end


@implementation RCTTalkingDataSDK
RCT_EXPORT_MODULE(TalkingDataSDK);

RCT_EXPORT_METHOD(init:(NSString *)appID channelId:(NSString *)channelId custom:(NSString *)custom)
{
  [TalkingDataSDK initSDK:appID channelId:channelId custom:custom];
}

RCT_REMAP_METHOD(getDeviceID, getDeviceID:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
  NSString * deviceId = [TalkingDataSDK getDeviceId];
//  NSArray *events = @[deviceId];
  if (deviceId) {
    resolve(deviceId);
  } else {
    reject(@"",@"",nil);
  }
}

RCT_EXPORT_METHOD(setVerboseLogDisable)
{
  [TalkingDataSDK setVerboseLogDisable];
}

RCT_EXPORT_METHOD(setLatitude:(double)latitude longitude:(double)longitude)
{
  [TalkingDataSDK setLatitude:latitude longitude:longitude];
}

RCT_EXPORT_METHOD(onPageBegin:(NSString *)pageName)
{
  [TalkingDataSDK onPageBegin:pageName];
}

RCT_EXPORT_METHOD(onPageEnd:(NSString *)pageName)
{
  [TalkingDataSDK onPageEnd:pageName];
}

RCT_EXPORT_METHOD(onEvent:(NSString *)eventId
                  parameters:(NSDictionary*)parameters)
{
  [TalkingDataSDK onEvent:eventId parameters:parameters];
}

RCT_EXPORT_METHOD(setGlobalKV:(NSString *)key value:(id)value)
{
  [TalkingDataSDK setGlobalKV:key value:value];
}
RCT_EXPORT_METHOD(removeGlobalKV:(NSString *)key)
{
  [TalkingDataSDK removeGlobalKV:key];
}

RCT_EXPORT_METHOD(onReceiveDeepLink:(NSString *)link)
{
  NSURL *url = [NSURL URLWithString:link];
  [TalkingDataSDK onReceiveDeepLink:url];
}

RCT_EXPORT_METHOD(onRegister:(NSString *)profileId profile:(NSString *)profile invitationCode:(NSString *)invitationCode)
{
  TalkingDataProfile *p = [TalkingDataProfile createProfile];
  NSError * error = nil;
  NSDictionary * dictProfile = [NSJSONSerialization JSONObjectWithData:[profile dataUsingEncoding:NSUTF8StringEncoding] options:0 error:&error];
  p.name = dictProfile[@"name"];
  p.type = (TalkingDataProfileType)[dictProfile[@"type"] unsignedIntegerValue];
  [TalkingDataSDK onRegister:profileId profile:p invitationCode:invitationCode];
}

RCT_EXPORT_METHOD(onLogin:(NSString *)profileId profile:(NSString *)profile)
{
  TalkingDataProfile *p = [TalkingDataProfile createProfile];
  NSError * error = nil;
  NSDictionary * dictProfile = [NSJSONSerialization JSONObjectWithData:[profile dataUsingEncoding:NSUTF8StringEncoding] options:0 error:&error];
  p.name = dictProfile[@"name"];
  p.type = (TalkingDataProfileType)[dictProfile[@"type"] unsignedIntegerValue];
  [TalkingDataSDK onLogin:profileId profile:p];
}

RCT_EXPORT_METHOD(onProfileUpdate:(NSString *)profile)
{
  TalkingDataProfile *p = [TalkingDataProfile createProfile];
  NSError * error = nil;
  NSDictionary * dictProfile = [NSJSONSerialization JSONObjectWithData:[profile dataUsingEncoding:NSUTF8StringEncoding] options:0 error:&error];
  p.name = dictProfile[@"name"];
  p.type = (TalkingDataProfileType)[dictProfile[@"type"] unsignedIntegerValue];
  p.gender = (TalkingDataGender)[dictProfile[@"gender"] unsignedIntegerValue];
  p.age = [dictProfile[@"age"] intValue];
  p.property1 = dictProfile[@"value1"];
  p.property2 = dictProfile[@"value2"];
  p.property3 = dictProfile[@"value3"];
  p.property4 = dictProfile[@"value4"];
  p.property5 = dictProfile[@"value5"];
  p.property6 = dictProfile[@"value6"];
  p.property7 = dictProfile[@"value7"];
  p.property8 = dictProfile[@"value8"];
  p.property9 = dictProfile[@"value9"];
  p.property10 = dictProfile[@"value10"];
  [TalkingDataSDK onProfileUpdate:p];
}

RCT_EXPORT_METHOD(onCreateCard:(NSString *)profile method:(NSString *)method content:(NSString *)content)
{
  [TalkingDataSDK onCreateCard:profile method:method content:content];
}

RCT_EXPORT_METHOD(onFavorite:(NSString *)category content:(NSString *)content)
{
  [TalkingDataSDK onFavorite:category content:content];
}

RCT_EXPORT_METHOD(onShare:(NSString *)profile content:(NSString *)content)
{
  [TalkingDataSDK onShare:profile content:content];
}

RCT_EXPORT_METHOD(onPunch:(NSString *)profile punchId:(NSString *)punchId)
{
  [TalkingDataSDK onPunch:profile punchId:punchId];
}


RCT_EXPORT_METHOD(onSearch:(NSString *)search)
{
  TalkingDataSearch * s = [[TalkingDataSearch alloc]init];
  NSError * error = nil;
  NSDictionary * dictADS = [NSJSONSerialization JSONObjectWithData:[search dataUsingEncoding:NSUTF8StringEncoding] options:0 error:&error];
  s.category = dictADS[@"category"];
  s.content = dictADS[@"content"];
  // s.destination = dictADS[@"destination"];
  // s.origin = dictADS[@"origin"];
  // s.itemId = dictADS[@"item_id"];
  // s.itemLocationId = dictADS[@"item_location_id"];
  // s.startDate = [dictADS[@"startDate"] longLongValue];
  // s.endDate = [dictADS[@"endDate"] longLongValue];
  [TalkingDataSDK onSearch:s];
}

@end
