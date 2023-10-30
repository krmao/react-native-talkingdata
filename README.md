## react-native-talkingdata

[![npm version](https://badge.fury.io/js/@krmao%2Freact-native-talkingdata.svg)](https://badge.fury.io/js/@krmao%2Freact-native-talkingdata)

### install

```shell
yarn add @krmao/react-native-talkingdata
```

### init

```typescript
//region init talkingdata
let appId = Constants.TALKING_DATA_APP_ID;
let channelId = 'default';
let custom = 'hello talking data';
TalkingDataSDK.init(appId, channelId, custom);
TalkingDataSDK.startA();
TalkingDataSDK.setExceptionReportEnabled(true);
//endregion
```

### for typescript

> react-native-talkingdata.d.ts

```ts
declare module '@krmao/react-native-talkingdata' {
    export const TalkingDataSDK: {
        init: (appId, channelId, custom) => void;
        startA: () => void;
        setExceptionReportEnabled: (boolean) => void;
    };

    export const TalkingDataGender: any;
    export const TalkingDataProfile: any;
    export const TalkingDataProfileType: any;
    export const TalkingDataSDK: any;
    export const TalkingDataSearch: any;
}
```

### issues

- [libTalkingDataSDK.a](ios%2FlibTalkingDataSDK.a) not support ios simulators, but support real iphone.
- [TalkingDataSDK.xcframework](ios%2FTalkingDataSDK.xcframework) support both ios simulators and real iphone.
- [com.apple.commcenter.coretelephony.xpc was invalidated](https://stackoverflow.com/a/54692253/4348530)
