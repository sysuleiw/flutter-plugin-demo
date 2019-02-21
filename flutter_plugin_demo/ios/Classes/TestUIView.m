//
//  TestUIView.m
//  flutter_plugin_demo
//
//  Created by 王磊 on 2019/2/20.
//

//!!!!!切记，要记得在infoplist中加入io.flutter.embedded_views_preview=YES
#import "TestUIView.h"


@interface TestUIView()

@property (nonatomic, strong) UILabel *showLabel;

@end

@implementation TestUIView
- (instancetype)initWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger
{
    self = [super init];
    if (self)
    {
        _showLabel = [UILabel new];
        _showLabel.text = args[@"labelText"];
        _showLabel.layer.borderColor = [UIColor redColor].CGColor;
        _showLabel.layer.borderWidth = 1;
    }
    return self;
}
- (UIView *)view
{
    return _showLabel;
}
@end


@implementation TestUIViewFactory {
    NSObject<FlutterBinaryMessenger>* _messenger;
}

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messenger {
    self = [super init];
    if (self) {
        _messenger = messenger;
    }
    return self;
}

- (NSObject<FlutterMessageCodec>*)createArgsCodec {
    return [FlutterStandardMessageCodec sharedInstance];
}

- (NSObject<FlutterPlatformView>*)createWithFrame:(CGRect)frame
                                   viewIdentifier:(int64_t)viewId
                                        arguments:(id _Nullable)args {
    TestUIView* testUIView = [[TestUIView alloc] initWithFrame:frame
                                                viewIdentifier:viewId
                                                     arguments:args
                                               binaryMessenger:_messenger];
    return testUIView;
}

@end
