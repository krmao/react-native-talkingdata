// version: 5.0.1
import {NativeModules} from 'react-native';
import {Platform} from 'react-native';

const TD = NativeModules.TalkingDataSDK;
const TalkingDataProfileType = NativeModules.TalkingDataProfileType;
const TalkingDataGender = NativeModules.TalkingDataGender;

class TalkingDataProfile{

	constructor() {
  	}

	setName(name){
		this.name = name;
	}

	setType(type){
		this.type = type;
	}

	setGender(gender){
		this.gender = gender;
	}

	setAge(age){
		this.age = age;
	}

	setProperty1(value){
		this.value1 = value;
	}

	setProperty2(value){
		this.value2 = value;
	}

	setProperty3(value){
		this.value3 = value;
	}

	setProperty4(value){
		this.value4 = value;
	}

	setProperty5(value){
		this.value5 = value;
	}

	setProperty6(value){
		this.value6 = value;
	}

	setProperty7(value){
		this.value7 = value;
	}

	setProperty8(value){
		this.value8 = value;
	}

	setProperty9(value){
		this.value9 = value;
	}

	setProperty10(value){
		this.value10 = value;
	}

  	get profileString(){
  		return JSON.stringify({
  			'name':this.name,
  			'type':this.type,
			'gender':this.gender,
			'age':this.age,
			'value1':this.value1,
			'value2':this.value2,
			'value3':this.value3,
			'value4':this.value4,
			'value5':this.value5,
			'value6':this.value6,
			'value7':this.value7,
			'value8':this.value8,
			'value9':this.value9,
			'value10':this.value10,
  		});
	}
}

class TalkingDataOrder {

	constructor(orderId,total,currencyType) {
		this.orderId = orderId;
		this.total = total;
		this.currencyType = currencyType;
		this.items = new Array();
  	}

  	addItem(itemId,category,name,unitPrice,amount){
  		this.items.push({'itemId':itemId,'category':category,'name':name,'unitPrice':unitPrice,'amount':amount});
  	}

  	get orderString(){
  		return JSON.stringify({
  			'orderId':this.orderId,
  			'total':this.total,
  			'currencyType':this.currencyType,
  			'items':this.items
  		});
  	}
}

class TalkingDataShoppingCart {

	constructor(){
		this.items = new Array();
	}

  	addItem(itemId,category,name,unitPrice,amount){
  		this.items.push({'itemId':itemId,'category':category,'name':name,'unitPrice':unitPrice,'amount':amount});
  	}

  	get shoppingCartString(){
  		return JSON.stringify({
  			'items':this.items
  		});
  	}
}

class TalkingDataSearch {

	constructor(){
		this.custom = new Object();
	}

	setCategory(category){
		this.category = category;
	}

	setContent(content){
		this.content = content;
	}

	setDestination(destination){
		this.destination = destination;
	}

	setOrigin(origin){
		this.origin = origin;
	}

	setItemId(item_id){
		this.item_id = item_id;
	}

	setItemLocationId(item_location_id){
		this.item_location_id = item_location_id;
	}

	setStartDate(start_date){
		this.start_date = start_date;
	}

	setEndDate(end_date){
		this.end_date = end_date;
	}

  	get adSearchString(){
  		return JSON.stringify({
  			'category':this.category,
  			'content':this.content,
			  'destination':this.destination,
			  'origin':this.origin,
			  'item_id':this.item_id,
			  'item_location_id':this.item_location_id,
			  'start_date':this.start_date,
			  'end_date':this.end_date,
  		});
	}

}


class TalkingDataTransaction {

	constructor(){

	}

	setTransactionId(transactionId){
		this.transactionId = transactionId;
	}

	setCategory(category){
		this.category = category;
	}

	setAmount(amount){
		this.amount = amount;
	}

	setPersonA(personA){
		this.personA = personA;
	}

	setPersonB(personB){
		this.personB = personB;
	}

	setStartDate(startDate){
		this.startDate = startDate;
	}

	setEndDate(endDate){
		this.endDate = endDate;
	}

	setCurrencyType(currencyType){
		this.currencyType = currencyType;
	}

	setContent(content){
		this.content = content;
	}



  	get transactionStr(){
  		return JSON.stringify({
			  'transactionId':this.transactionId,
			  'category':this.category,
			  'amount':this.amount,
			  'personA':this.personA,
			  'personB':this.personB,
			  'startDate':this.startDate,
			  'endDate':this.endDate,
			  'currencyType':this.currencyType,
			  'content':this.content,
  		});
	}

}

class TalkingDataSDK {
	static init(appId,channelId,custom){
        TD.init(appId,channelId,custom);
	}

	static startA(){
		TD.startA();
	}

	static setExceptionReportEnabled(enabled){
		TD.setExceptionReportEnabled(enabled);
	}

	/**
	* 获取SDK所使用Device的ID
	* iOS Android
	* @return {string} deviceID
	*/
    static getDeviceID(callback){
        TD.getDeviceID().then(callback);
    }

    /**
    * 获取SDK所使用Device的ID
    * iOS Android
    * @return {string} OAID
    */
    static getOAID(callback){
         if(Platform.OS === 'android'){
            TD.getOAID().then(callback);
         }
    }

	/**
	* 设置经纬度
	* iOS only
	* @param {number} lat
	* @param {number} lnt
	*/
	static setLocation(lat,lnt){
	    if (typeof lat !== 'number'){
	        return;
	    }
	    if (typeof lnt !== 'number'){
	        return;
	    }
		if (Platform.OS === 'ios'){
			TD.setLatitude(lat,lnt);
		}
	}

    /**
    * 记录事件
    * iOS Android
    * @param {string} eventName 事件名称
    * @param {object} parameters 事件标签(自定义)
    */
    static onEvent(eventName,parameters){
		TD.onEvent(eventName,parameters);
    }

	/**
	* 添加全局的字段，这里的内容会每次的自定义事都会带着，发到服务器。
	也就是说如果您的自定义事件中每一条都需要带同样的内容，如用户名称等，就可以添加进去
	* iOS Android
	* @param {string} k 全局的key，string类型。
	* @param {any} v 全局的value，任意类型。
	*/
	static setGlobalKV(k,v){
	    if (typeof k !== 'string'){
	        return;
	    }
		if (Platform.OS === 'ios') {
			TD.setGlobalKV(k,v);
		}else if(Platform.OS === 'android'){
			switch (typeof v){
                case "number":
                    TD.setGlobalKVDouble(k,v);
                	break;
                case "string":
                    TD.setGlobalKVString(k,v);
                    break;
                case "boolean":
                    TD.setGlobalKVBoolean(k,v);
                    break;
				case "object":
					if (v instanceof Array){
                        TD.setGlobalKVArray(k,v);
					} else{
                        TD.setGlobalKVMap(k,v);
					}
					break;
				default:
					TD.setGlobalKVMap(k,{v});

			}
		};
	}

	/**
	* 删除全局数据
	* iOS Android
	* @param {string} k 全局的key，string类型。
	*/
	static removeGlobalKV(k){
	    if (typeof k !== 'string'){
	        return;
	    }
		TD.removeGlobalKV(k);
	}

	/**
	* 开始跟踪某一页面，记录页面打开时间。
	* iOS Android
	* @param {string} pageName 页面名称。
	*/
	static onPageBegin(pageName) {
	    if (typeof pageName !== 'string'){
	        return;
	    }
		TD.onPageBegin(pageName);
	}

	/**
	* 结束跟踪某一页面，记录页面关闭时间。
	* iOS Android
	* @param {string} pageName 页面名称。
	*/
	static onPageEnd(pageName){
	    if (typeof pageName !== 'string'){
	        return;
	    }
		TD.onPageEnd(pageName);
	}

	static onReceiveDeepLink(link){
		TD.onReceiveDeepLink(link);
	}
	/**
	* 注册
	* iOS Android
	* @param {string} profileId 账户ID
	* @param {TalkingDataProfileType} profileType 账户类型 详见
	* @param {string} name 账户昵称
	* @param {string} invitationCode 邀请码
	*/
	static onRegister(profileId,profile,invitationCode){
		TD.onRegister(profileId,profile,invitationCode);
	}

	/**
	* 登录
	* iOS Android
	* @param {string} profileId 账户ID
	* @param {TalkingDataProfileType} profileType 账户类型 详见
	* @param {string} name 账户昵称
	*/
	static onLogin(profileId,profile){
		TD.onLogin(profileId,profile);
	}

	static onProfileUpdate(profile){
		TD.onProfileUpdate(profile);
	}
	static onCreateCard(profile,method,content)
	{
		if (typeof profile !== 'string') {
			return;
		};
		if (typeof method !== 'string') {
			return;
		};
		if (typeof content !== 'string') {
			return;
		}
		TD.onCreateCard(profile,method,content);
	}

	static onFavorite(category,content)
	{
		if (typeof category !== 'string') {
			return;
		};

		if (typeof content !== 'string') {
			return;
		}
		TD.onFavorite(category,content);
	}

	static onShare(profile,content)
	{
		if (typeof profile !== 'string') {
			return;
		};
		if (typeof content !== 'string') {
			return;
		}
		TD.onShare(profile,content);
	}

	static onPunch(profile,punchId)
	{
		if (typeof profile !== 'string') {
			return;
		};
		if (typeof punchId !== 'string') {
			return;
		}
		TD.onPunch(profile,punchId);
	}

	static onSearch(adSearch){
		TD.onSearch(adSearch);
	}

}

export {TalkingDataSDK,TalkingDataProfile,TalkingDataProfileType,TalkingDataGender,TalkingDataOrder,TalkingDataShoppingCart,TalkingDataSearch,TalkingDataTransaction};
