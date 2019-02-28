package com.tinytongtong.flutter_toast_plugin_2019;

import android.content.Context;
import android.widget.Toast;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * FlutterToastPlugin2019Plugin
 */
public class FlutterToastPlugin2019Plugin implements MethodCallHandler {
    private Context mContext;

    public FlutterToastPlugin2019Plugin(Context context) {
        this.mContext = context;
    }

    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        // "flutter_toast_plugin_2019"使我们method channel的名字，Dart代码里面还需要用到它。
        // 为了防止命名冲突，可以在它的前面加上域名
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "com.tinytongtong.flutter_toast_plugin_2019/flutter_toast_plugin_2019");
        channel.setMethodCallHandler(new FlutterToastPlugin2019Plugin(registrar.context()));
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        // call.method是方法名，这里我们的方法名称就叫toast
        if (call.method.equals("toast")) {
            // 调用本地代码的时候，只能传递一个参数。为了传递多个参数，可以把参数放在一个map里面。
            // call.argument()方法支持Map和JSONObject
            String content = call.argument("content");
            String duration = call.argument("duration");
            Toast.makeText(mContext, content, "short".equals(duration) ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG).show();
            // 执行成功
            result.success(true);
        } else {
            result.notImplemented();
        }
    }
}
