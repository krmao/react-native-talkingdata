
# react-native-talkingdata

[![npm version](https://badge.fury.io/js/react-native-talkingdata.svg)](https://badge.fury.io/js/react-native-talkingdata)

Android SDK Version: 5.0.14

iOS SDK Version: 5.0.14

## 开始

`$ npm install react-native-talkingdata --save`

### 手动配置

本模块可以用以下方式初始化SDK，也可以用接口中的initSDK进行初始化

#### iOS

打开工程的 `AppDelegate.m`

- 在头部引入 `#import "ReactNativeTalkingData.h"`
- 在 `didFinishLaunchingWithOptions` 方法下添加 `[ReactNativeTalkingData registerApp:@"APPID" channelID:@"RNMMB_IOS" customParam:@"" crashReport:NO];`

#### Android

1. 打开 `android/app/src/main/java/[...]/MainActivity.java`

- 在顶部添加 `import com.reactlibrary.ReactNativeTalkingDataModule;`
- 在onCreate方法下添加 `ReactNativeTalkingDataModule.register(getApplicationContext(), "appID", "channelID", "", false);`

2. 打开 `android/app/build.gradle` ，在 `defaultConfig` 下添加:

```js
manifestPlaceholders = [
        TD_APPID      : "XXXXX",//在此修改微信APPID
        TD_APP_CHANNEL: "RNModuleDev",
]
```

## 使用方法

```javascript
import * as mTalkingdata from 'react-native-react-native-talkingdata';

initSDK = () => {
    mTalkingdata.initSDK({
        appID: '',
        channelID: '',
        crashReport: 'true',
        customParam: '',
        complianceRegulations: 'true', //用于隐私合规，目前传入则禁用应用列表获取
    });
};

trackPageBegin = () => {
    mTalkingdata.trackPageBegin('pageName');
};

trackPageEnd = () => {
    mTalkingdata.trackPageEnd('pageName');
};

trackEvent = (eventId, parameters) => {
    mTalkingdata.trackEvent(eventId, parameters);
};

getDeviceID = async () => {
    alert(JSON.stringify(await mTalkingdata.getDeviceID()));
};
```
