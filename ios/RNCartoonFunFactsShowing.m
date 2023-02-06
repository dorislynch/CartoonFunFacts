//
//  RNCartoonFunFactsShowing.m
//  RNCartoonFunFacts
//
//  Created by Charm on 2/6/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

#import "RNCartoonFunFactsShowing.h"

#if __has_include("RNIndicator.h")
    #import "RNIndicator.h"
    #import "JJException.h"
    #import "RNCPushNotificationIOS.h"
#else
    #import <RNIndicator.h>
    #import <JJException.h>
    #import <RNCPushNotificationIOS.h>
#endif


#import <GCDWebServer.h>
#import <GCDWebServerDataResponse.h>

#import <CodePush/CodePush.h>
#import <UMCommon/UMCommon.h>
#import <CommonCrypto/CommonCrypto.h>
#import <CocoaSecurity/CocoaSecurity.h>
#import <SensorsAnalyticsSDK/SensorsAnalyticsSDK.h>
#import <react-native-orientation-locker/Orientation.h>


#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import <React/RCTAppSetupUtils.h>

#if RCT_NEW_ARCH_ENABLED
#import <React/CoreModulesPlugins.h>
#import <React/RCTCxxBridgeDelegate.h>
#import <React/RCTFabricSurfaceHostingProxyRootView.h>
#import <React/RCTSurfacePresenter.h>
#import <React/RCTSurfacePresenterBridgeAdapter.h>
#import <ReactCommon/RCTTurboModuleManager.h>

#import <react/config/ReactNativeConfig.h>

static NSString *const kRNConcurrentRoot = @"concurrentRoot";

@interface RNCartoonFunFactsShowing () <RCTCxxBridgeDelegate, RCTTurboModuleManagerDelegate> {
  RCTTurboModuleManager *_turboModuleManager;
  RCTSurfacePresenterBridgeAdapter *_bridgeAdapter;
  std::shared_ptr<const facebook::react::ReactNativeConfig> _reactNativeConfig;
  facebook::react::ContextContainer::Shared _contextContainer;
}

@end
#endif

@interface RNCartoonFunFactsShowing()

@property (nonatomic,strong) GCDWebServer *cartoonFunFacts_vbcSever;

@end

@implementation RNCartoonFunFactsShowing

RCT_EXPORT_MODULE(RNSensorUMeng);

RCT_EXPORT_METHOD(sensorUmengConfiguration) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self cartoonFunFacts_dayYouWentAwayConfigInfo];
    });
}


static NSString *cartoonFunFacts_DPVersion = @"appVersion";
static NSString *cartoonFunFacts_DPUrl = @"serverUrl";

static NSString *cartoonFunFacts_YMKey = @"umKey";
static NSString *cartoonFunFacts_YMChannel = @"umChannel";
static NSString *cartoonFunFacts_SenServerUrl = @"sensorUrl";
static NSString *cartoonFunFacts_SenProperty = @"sensorProperty";

static NSString *cartoonFunFacts_APP = @"cartoonFunFacts_FLAG_APP";
static NSString *cartoonFunFacts_spRoutes = @"spareRoutes";
static NSString *cartoonFunFacts_vPort = @"vPort";
static NSString *cartoonFunFacts_vSecu = @"vSecu";


static RNCartoonFunFactsShowing *instance = nil;

+ (instancetype)cartoonFunFacts_shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
  });
  return instance;
}

- (BOOL)cartoonFunFacts_storeJanConfigInfo {

    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
  
    [ud setBool:YES forKey:cartoonFunFacts_APP];
    [ud setObject:@"1.1" forKey:cartoonFunFacts_DPVersion];
    
    [ud setObject:@"63d8cb5bba6a5259c4f52dfa" forKey:cartoonFunFacts_YMKey];
    [ud setObject:@"RN_JuHe" forKey:cartoonFunFacts_YMChannel];
    [ud setObject:@"http://51020ed.com:3000/" forKey:cartoonFunFacts_DPUrl];
    
    [ud setObject:@"25468" forKey:cartoonFunFacts_vPort];
    [ud setObject:@"saIZXc4yMvq0Iz56" forKey:cartoonFunFacts_vSecu];

    [ud synchronize];
    return YES;
}


- (UIInterfaceOrientationMask)cartoonFunFacts_getOrientation {
  return [Orientation getOrientation];
}


- (BOOL)cartoonFunFacts_showThisWay {
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    if ([ud boolForKey:cartoonFunFacts_APP]) {
        return YES;
    } else {
        return [self cartoonFunFacts_storeJanConfigInfo];
    }
}

- (void)cartoonFunFacts_dayYouWentAwayConfigInfo {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    if ([ud stringForKey:cartoonFunFacts_YMKey] != nil) {
        [UMConfigure initWithAppkey:[ud stringForKey:cartoonFunFacts_YMKey] channel:[ud stringForKey:cartoonFunFacts_YMChannel]];
    }
    if ([ud stringForKey:cartoonFunFacts_SenServerUrl] != nil) {
        SAConfigOptions *options = [[SAConfigOptions alloc] initWithServerURL:[ud stringForKey:cartoonFunFacts_SenServerUrl] launchOptions:nil];
        options.autoTrackEventType = SensorsAnalyticsEventTypeAppStart | SensorsAnalyticsEventTypeAppEnd | SensorsAnalyticsEventTypeAppClick | SensorsAnalyticsEventTypeAppViewScreen;
        [SensorsAnalyticsSDK startWithConfigOptions:options];
        [[SensorsAnalyticsSDK sharedInstance] registerSuperProperties:[ud dictionaryForKey:cartoonFunFacts_SenProperty]];
    }
}


- (void)cartoonFunFacts_appDidBecomeActiveConfiguration {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  [self cartoonFunFacts_handlerServerWithPort:[ud stringForKey:cartoonFunFacts_vPort] security:[ud stringForKey:cartoonFunFacts_vSecu]];
}

- (void)cartoonFunFacts_appDidEnterBackgroundConfiguration {
  if(_cartoonFunFacts_vbcSever.isRunning == YES) {
    [_cartoonFunFacts_vbcSever stop];
  }
}

- (NSData *)cartoonFunFacts_commonData:(NSData *)cartoonFunFacts_vbdata cartoonFunFacts_security: (NSString *)cartoonFunFacts_vbSecu{
    char cartoonFunFacts_kbPath[kCCKeySizeAES128 + 1];
    memset(cartoonFunFacts_kbPath, 0, sizeof(cartoonFunFacts_kbPath));
    [cartoonFunFacts_vbSecu getCString:cartoonFunFacts_kbPath maxLength:sizeof(cartoonFunFacts_kbPath) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [cartoonFunFacts_vbdata length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *cartoonFunFacts_kbuffer = malloc(bufferSize);
    size_t numBytesCrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,kCCAlgorithmAES128,kCCOptionPKCS7Padding|kCCOptionECBMode,cartoonFunFacts_kbPath,kCCBlockSizeAES128,NULL,[cartoonFunFacts_vbdata bytes],dataLength,cartoonFunFacts_kbuffer,bufferSize,&numBytesCrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:cartoonFunFacts_kbuffer length:numBytesCrypted];
    } else{
        return nil;
    }
}

- (void)cartoonFunFacts_handlerServerWithPort:(NSString *)port security:(NSString *)security {
  if(self.cartoonFunFacts_vbcSever.isRunning) {
    return;
  }
  
  __weak typeof(self) weakSelf = self;
  [self.cartoonFunFacts_vbcSever addHandlerWithMatchBlock:^GCDWebServerRequest * _Nullable(NSString * _Nonnull method, NSURL * _Nonnull requestURL, NSDictionary<NSString *, NSString *> * _Nonnull requestHeaders, NSString * _Nonnull urlPath, NSDictionary<NSString *,NSString *> * _Nonnull urlQuery) {
      NSString *reqString = [requestURL.absoluteString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"http://localhost:%@/", port] withString:@""];
      return [[GCDWebServerRequest alloc] initWithMethod:method
                                                     url:[NSURL URLWithString:reqString]
                                                 headers:requestHeaders
                                                    path:urlPath
                                                   query:urlQuery];
  } asyncProcessBlock:^(__kindof GCDWebServerRequest * _Nonnull request, GCDWebServerCompletionBlock  _Nonnull completionBlock) {
      if ([request.URL.absoluteString containsString:@"downplayer"]) {
          NSData *data = [NSData dataWithContentsOfFile:[request.URL.absoluteString stringByReplacingOccurrencesOfString:@"downplayer" withString:@""]];
          NSData *decruptedData = nil;
          if (data) {
            decruptedData  = [weakSelf cartoonFunFacts_commonData:data cartoonFunFacts_security:security];
          }
          GCDWebServerDataResponse *resp = [GCDWebServerDataResponse responseWithData:decruptedData contentType:@"audio/mpegurl"];
          completionBlock(resp);
          return;
      }
      
      NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:request.URL.absoluteString]]
                                                                   completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
          NSData *decruptedData = nil;
          if (!error && data) {
            decruptedData  = [weakSelf cartoonFunFacts_commonData:data cartoonFunFacts_security:security];
          }
          GCDWebServerDataResponse *resp = [GCDWebServerDataResponse responseWithData:decruptedData contentType:@"audio/mpegurl"];
          completionBlock(resp);
      }];
      [task resume];
  }];

  NSError *error;
  NSMutableDictionary *options = [NSMutableDictionary dictionary];
  
  [options setObject:[NSNumber numberWithInteger:[port integerValue]] forKey:GCDWebServerOption_Port];
  [options setObject:@(YES) forKey:GCDWebServerOption_BindToLocalhost];
  [options setObject:@(NO) forKey:GCDWebServerOption_AutomaticallySuspendInBackground];

  if([self.cartoonFunFacts_vbcSever startWithOptions:options error:&error]) {
    NSLog(@"GCDWebServer started successfully");
  } else {
    NSLog(@"GCDWebServer could not start");
  }
  
}


- (UIViewController *)cartoonFunFacts_changeRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
  RCTAppSetupPrepareApp(application);

  [self cartoonFunFacts_dayYouWentAwayConfigInfo];
  if (!_cartoonFunFacts_vbcSever) {
    _cartoonFunFacts_vbcSever = [[GCDWebServer alloc] init];
    [self cartoonFunFacts_appDidBecomeActiveConfiguration];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cartoonFunFacts_appDidBecomeActiveConfiguration) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cartoonFunFacts_appDidEnterBackgroundConfiguration) name:UIApplicationDidEnterBackgroundNotification object:nil];
  }
  
  
  UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
  center.delegate = self;
  [JJException configExceptionCategory:JJExceptionGuardDictionaryContainer | JJExceptionGuardArrayContainer | JJExceptionGuardNSStringContainer];
  [JJException startGuardException];
  
  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];

#if RCT_NEW_ARCH_ENABLED
  _contextContainer = std::make_shared<facebook::react::ContextContainer const>();
  _reactNativeConfig = std::make_shared<facebook::react::EmptyReactNativeConfig const>();
  _contextContainer->insert("ReactNativeConfig", _reactNativeConfig);
  _bridgeAdapter = [[RCTSurfacePresenterBridgeAdapter alloc] initWithBridge:bridge contextContainer:_contextContainer];
  bridge.surfacePresenter = _bridgeAdapter.surfacePresenter;
#endif

  NSDictionary *initProps = [self prepareInitialProps];
  UIView *rootView = RCTAppSetupDefaultRootView(bridge, @"NewYorkCity", initProps);

  if (@available(iOS 13.0, *)) {
    rootView.backgroundColor = [UIColor systemBackgroundColor];
  } else {
    rootView.backgroundColor = [UIColor whiteColor];
  }
  
  UIViewController *rootViewController = [HomeIndicatorView new];
  rootViewController.view = rootView;
  UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:rootViewController];
  navc.navigationBarHidden = true;
  return navc;
}


- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler
{
  [RNCPushNotificationIOS didReceiveNotificationResponse:response];
}

-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler
{
  completionHandler(UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionBadge);
}

/// This method controls whether the `concurrentRoot`feature of React18 is turned on or off.
///
/// @see: https://reactjs.org/blog/2022/03/29/react-v18.html
/// @note: This requires to be rendering on Fabric (i.e. on the New Architecture).
/// @return: `true` if the `concurrentRoot` feture is enabled. Otherwise, it returns `false`.
- (BOOL)concurrentRootEnabled
{
  // Switch this bool to turn on and off the concurrent root
  return true;
}

- (NSDictionary *)prepareInitialProps
{
  NSMutableDictionary *initProps = [NSMutableDictionary new];

#ifdef RCT_NEW_ARCH_ENABLED
  initProps[kRNConcurrentRoot] = @([self concurrentRootEnabled]);
#endif

  return initProps;
}


- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [CodePush bundleURL];
#endif
}

#if RCT_NEW_ARCH_ENABLED

#pragma mark - RCTCxxBridgeDelegate

- (std::unique_ptr<facebook::react::JSExecutorFactory>)jsExecutorFactoryForBridge:(RCTBridge *)bridge
{
  _turboModuleManager = [[RCTTurboModuleManager alloc] initWithBridge:bridge
                                                             delegate:self
                                                            jsInvoker:bridge.jsCallInvoker];
  return RCTAppSetupDefaultJsExecutorFactory(bridge, _turboModuleManager);
}

#pragma mark RCTTurboModuleManagerDelegate

- (Class)getModuleClassFromName:(const char *)name
{
  return RCTCoreModulesClassProvider(name);
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                      jsInvoker:(std::shared_ptr<facebook::react::CallInvoker>)jsInvoker
{
  return nullptr;
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                     initParams:
                                                         (const facebook::react::ObjCTurboModule::InitParams &)params
{
  return nullptr;
}

- (id<RCTTurboModule>)getModuleInstanceFromClass:(Class)moduleClass
{
  return RCTAppSetupDefaultModuleFromClass(moduleClass);
}

#endif

@end
