const cookie = 'is_wx_new=1; mc_loguser_area=6175; mc_loguser_channel=default; mc_loguser_city=1; mc_loguser_company=49471295; mc_loguser_passport=15454994; mc_loguser_platform=1; mc_loguser_source=weixin; mc_loguser_tickets=jwt%3AeyJhbGciOiJSUzI1NiJ9.eyJpZCI6IjE1NDU0OTk0IiwianRpIjoiZjEzNjhhMzQyYmE1ZTM5ZDdjMjg2OWY4YzA4NmZhNmU3YWJmMDE5MC0zOm1hbGwiLCJpYXQiOjE1ODIzNzI0MzIwNDZ9.NJOikifA5HYP_oCXI3Ifmj-TrrdEUfa4eQsgVDx7viaXI5wTX50lDVZYcM2RohpA614jIfGMBrE7L4fDbhgKmEq-zNezPDnRhU_CDOQXiw2e0a6xksuZgQD-dBZSOq7lTc9hOIrbraKiX5LTceKfjJl6H8_ZqRlsPQ2T0374dC0';


const httpHeaders = {

//  'Accept': '*/*',
//  'Mc-Gray': 'cityId=1_saleArea=6175_companyId=49471295',
//  'Accept-Language': 'zh-Hans-CN;q=1, en-CN;q=0.9',
//  'Accept-Encoding': 'br, gzip, deflate',
//  'Content-Type': 'application/json',
//  'X-MC-City': '1',
//  "Content-Lenght" : "1286",
//  'User-Agent': 'MeicaiStore/2.16.0 (iPhone; iOS 12.1; Scale/3.00)',
//  'Connection': 'keep-alive',
  'Cookie': cookie
//  'X-MC-Area': '6175',
//  'Host': 'mallapi.yunshanmeicai.com'
};

var homePagePar = {

  "salt_sign": "88328F68C2442F0D11C29BE08933284A,91,1586505526767",
  "_ENV_": homePageENV,
  "version": "",
  "tickets": "jwt:eyJhbGciOiJSUzI1NiJ9.eyJpZCI6IjE1NDU0OTk0IiwianRpIjoiZjEzNjhhMzQyYmE1ZTM5ZDdjMjg2OWY4YzA4NmZhNmU3YWJmMDE5MC0zOm1hbGwiLCJpYXQiOjE1ODIzNzI0MzIwNDZ9.NJOikifA5HYP_oCXI3Ifmj-TrrdEUfa4eQsgVDx7viaXI5wTX50lDVZYcM2RohpA614jIfGMBrE7L4fDbhgKmEq-zNezPDnRhU_CDOQXiw2e0a6xksuZgQD-dBZSOq7lTc9hOIrbraKiX5LTceKfjJl6H8_ZqRlsPQ2T0374dC0",
  "url": "\/",
  "return_type": 1,
  "area_id": "6175",
  "city_id": "1",
  "route": "mc_route_index",
  "utoken": "jwt:eyJhbGciOiJSUzI1NiJ9.eyJpZCI6IjE1NDU0OTk0IiwianRpIjoiZjEzNjhhMzQyYmE1ZTM5ZDdjMjg2OWY4YzA4NmZhNmU3YWJmMDE5MC0zOm1hbGwiLCJpYXQiOjE1ODIzNzI0MzIwNDZ9.NJOikifA5HYP_oCXI3Ifmj-TrrdEUfa4eQsgVDx7viaXI5wTX50lDVZYcM2RohpA614jIfGMBrE7L4fDbhgKmEq-zNezPDnRhU_CDOQXiw2e0a6xksuZgQD-dBZSOq7lTc9hOIrbraKiX5LTceKfjJl6H8_ZqRlsPQ2T0374dC0"
};

const  homePageENV = {

  "mno": "46002",
  "idfa": "8D374126-9DD5-48D2-87B8-04E2A0D0AED4",
  "app_version": "2.16.0",
  "net": "WIFI",
  "source": "ios",
  "appkey_version": 2,
  "lat": "39.93042047782313",
  "distribute_channel": "AppStore",
  "ip": "172.16.10.208",
  "device_name": "iPhone 7 Plus",
  "bssid": "",
  "idfv": "4234BC2F-DB83-4498-AB08-6B00DEBA779B",
  "device_id": "4234BC2F-DB83-4498-AB08-6B00DEBA779B",
  "lng": "116.3562250406707",
  "os_version": "%E5%91%A8%E7%B4%A0%E5%8D%8E%E7%9A%84%20iPhone12.1",
  "ssid": ""
};