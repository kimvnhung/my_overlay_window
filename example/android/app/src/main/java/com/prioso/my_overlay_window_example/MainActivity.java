package com.prioso.my_overlay_window_example;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.Log;

public class MainActivity extends FlutterActivity {
    private static final String TAG = MainActivity.class.getName();
    DataReceiver receiver = new DataReceiver();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        Log.d(TAG,"onCreate");
        super.onCreate(savedInstanceState);

        IntentFilter intentFilter = new IntentFilter("TEST_FILTER");
        registerReceiver(this.receiver,intentFilter);
    }

    @Override
    protected void onDestroy(){
        super.onDestroy();
        unregisterReceiver(this.receiver);
        this.receiver = null;
    }


    class DataReceiver extends BroadcastReceiver {

        @Override
        public void onReceive(Context context, Intent intent) {
            if (intent.getAction() != null) {
                Log.d("MyOverlayWindow",intent.getAction());
            }
        }
    }
}
