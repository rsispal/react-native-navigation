
#import "RNNReactRootViewCreator.h"
#import "RNNReactView.h"

@implementation RNNReactRootViewCreator {
	RCTBridge *_bridge;
}

-(instancetype)initWithBridge:(RCTBridge*)bridge {
	self = [super init];
	
	_bridge = bridge;
	
	return self;
}

- (RNNReactView*)createRootView:(NSString*)name rootViewId:(NSString*)rootViewId reactViewReadyBlock:(RNNReactViewReadyCompletionBlock)reactViewReadyBlock {
	if (!rootViewId) {
		@throw [NSException exceptionWithName:@"MissingViewId" reason:@"Missing view id" userInfo:nil];
	}
	
	RNNReactView *view = [[RNNReactView alloc] initWithBridge:_bridge
														   moduleName:name
													initialProperties:@{@"componentId": rootViewId}
												  reactViewReadyBlock:reactViewReadyBlock];
	return view;
}

- (RNNReactView*)createCustomReactView:(NSString*)name rootViewId:(NSString*)rootViewId reactViewReadyBlock:(RNNReactViewReadyCompletionBlock)reactViewReadyBlock {
	if (!rootViewId) {
		@throw [NSException exceptionWithName:@"MissingViewId" reason:@"Missing view id" userInfo:nil];
	}
	
	RNNReactView *view = [[RNNReactView alloc] initWithBridge:_bridge
											 moduleName:name
									  initialProperties:@{@"componentId": rootViewId}
									reactViewReadyBlock:reactViewReadyBlock];
	return view;
}

-(UIView*)createRootViewFromComponentOptions:(RNNComponentOptions*)componentOptions {
	return [self createCustomReactView:componentOptions.name.get rootViewId:componentOptions.componentId.get reactViewReadyBlock:nil];
}

@end
