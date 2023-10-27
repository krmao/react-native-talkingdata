# react-native-talkingdata

[![npm version](https://badge.fury.io/js/@krmao%2Freact-native-talkingdata.svg)](https://badge.fury.io/js/@krmao%2Freact-native-talkingdata)

## install

```shell
yarn add @krmao/react-native-talkingdata
```

### proguard(already proguard in library)
```
-dontwarn com.tendcloud.tenddata.**
-keep class com.tendcloud.** {*;}               
-keep public class com.tendcloud.** {  public protected *;}
```

### Xcode11 node_modules post patch
> RCTModuleMethod.m

```
static BOOL RCTParseUnused(const char **input)
{
  return RCTReadString(input, "__unused") ||
         RCTReadString(input, "__attribute__((__unused__))") ||
         RCTReadString(input, "__attribute__((unused))");
}
```
