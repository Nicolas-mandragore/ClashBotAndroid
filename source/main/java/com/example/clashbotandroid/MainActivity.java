package com.example.clashbotandroid;

import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.provider.Settings;
import android.widget.Button;
import android.view.View;
import android.widget.Toast;
import android.text.TextUtils;
import android.content.Context;
import android.accessibilityservice.AccessibilityServiceInfo;
import android.view.accessibility.AccessibilityManager;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    private Button btnEnableService;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btnEnableService = findViewById(R.id.btnEnableService);

        btnEnableService.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (!isAccessibilityServiceEnabled()) {
                    Intent intent = new Intent(Settings.ACTION_ACCESSIBILITY_SETTINGS);
                    startActivity(intent);
                    Toast.makeText(MainActivity.this, "Please enable ClashBotAccessibilityService", Toast.LENGTH_LONG).show();
                } else {
                    Toast.makeText(MainActivity.this, "Accessibility Service already enabled", Toast.LENGTH_SHORT).show();
                }
            }
        });
    }

    private boolean isAccessibilityServiceEnabled() {
        AccessibilityManager am = (AccessibilityManager) getSystemService(Context.ACCESSIBILITY_SERVICE);
        List<AccessibilityServiceInfo> enabledServices = am.getEnabledAccessibilityServiceList(AccessibilityServiceInfo.FEEDBACK_ALL_MASK);
        for (AccessibilityServiceInfo service : enabledServices) {
            if (service.getId().contains(getPackageName())) {
                return true;
            }
        }
        return false;
    }
}
