package vn.edu.stu.doangiuakylaptrinhchothietbididong;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    EditText txtTaiKhoan, txtMatKhau;
    Button btnDangNhap;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        addControls();
        addEvents();
    }

    private void addEvents() {
        btnDangNhap.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String taikhoan = txtTaiKhoan.getText().toString();
                String matkhau = txtMatKhau.getText().toString();
                if(taikhoan.equals("thuly1502")){
                    if(matkhau.equals("123")) {
                        Intent intent = new Intent(
                                MainActivity.this,
                                HomePageActivity.class);
                        startActivity(intent);
                    } else {
                        Toast.makeText(
                                MainActivity.this,
                                "Sai tài khoản",
                                Toast.LENGTH_SHORT
                        ).show();
                    }
                } else {
                    Toast.makeText(
                            MainActivity.this,
                            "Sai mật khẩu",
                            Toast.LENGTH_SHORT
                    ).show();
                }
            }
        });
    }

    private void addControls() {
        txtTaiKhoan = findViewById(R.id.txtMatKhau);
        txtMatKhau = findViewById(R.id.txtTaiKhoan);
        btnDangNhap = findViewById(R.id.btnDangNhap);
    }
}