package vn.edu.stu.doangiuakylaptrinhchothietbididong;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import android.Manifest;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;

public class AboutActivity extends AppCompatActivity {

    ImageButton imageButtonPhone;
    TextView txtSDT;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_about);

        addControls();
        addEvents();
    }

    private void addControls() {
        imageButtonPhone = findViewById(R.id.imageButtonPhone);
        txtSDT = findViewById(R.id.txtSDT);
    }

    private void addEvents() {
        imageButtonPhone.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(checkPermission())
                    makePhoneCall();
                else
                    requestPermissions();
            }
        });
    }

    private boolean checkPermission() {
        int result = ContextCompat.checkSelfPermission(
                AboutActivity.this,
                Manifest.permission.CALL_PHONE
        );
        return result == PackageManager.PERMISSION_GRANTED;
    }

    private void requestPermissions() {
        if(ActivityCompat.shouldShowRequestPermissionRationale(
                AboutActivity.this,
                Manifest.permission.CALL_PHONE
        )){
            Toast.makeText(
                    AboutActivity.this,
                    "cấp quyền gọi",
                    Toast.LENGTH_SHORT
            ).show();
        } else{
            ActivityCompat.requestPermissions(
                    AboutActivity.this,
                    new String[]{
                            Manifest.permission.CALL_PHONE
                    },
                    123  // requestCode duoc sinh ra tu quy dinh
            );
        }
    }

    private void makePhoneCall() {
        String phoneNum = txtSDT.getText().toString();
        Intent intent = new Intent(
                Intent.ACTION_CALL,
                Uri.parse("tel: " + phoneNum)
        );
        startActivity(intent);
    }

}