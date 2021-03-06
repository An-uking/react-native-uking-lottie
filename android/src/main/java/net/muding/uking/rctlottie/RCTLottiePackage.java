package net.muding.uking.rctlottie;

/**
 * Created by uking on 2018/3/1.
 */

import com.facebook.react.ReactPackage;
        import com.facebook.react.bridge.JavaScriptModule;
        import com.facebook.react.bridge.NativeModule;
        import com.facebook.react.bridge.ReactApplicationContext;
        import com.facebook.react.uimanager.ViewManager;

        import java.util.Collections;
        import java.util.List;

@SuppressWarnings("unused")
public class RCTLottiePackage implements ReactPackage {
    @Override public List<NativeModule> createNativeModules(ReactApplicationContext reactContext) {
        return Collections.emptyList();
    }

    // Deprecated RN 0.47
    public List<Class<? extends JavaScriptModule>> createJSModules() {
        return Collections.emptyList();
    }

    @SuppressWarnings("rawtypes") @Override
    public List<ViewManager> createViewManagers(ReactApplicationContext reactContext) {
        return Collections.<ViewManager>singletonList(new RCTLottieViewManager());
    }
}