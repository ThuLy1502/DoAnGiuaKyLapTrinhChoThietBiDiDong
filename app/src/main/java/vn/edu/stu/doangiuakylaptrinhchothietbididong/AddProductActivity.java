package vn.edu.stu.doangiuakylaptrinhchothietbididong;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;

import android.Manifest;
import android.content.ContentValues;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Toast;

import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

import vn.edu.stu.doangiuakylaptrinhchothietbididong.model.SanPham;

public class AddProductActivity extends AppCompatActivity {
    EditText edtTen, edtGia, edtKichThuoc, edtPhanLoai;
    ImageView imgHinh;
    Button btnLuu, btnThemHinh, btnTroVe;
    final int REQUEST_CODE_GALLERY = 999;
    final String DB_PATH_SUFFIX = "/databases/";
    final String DB_NAME = "dbsanpham.sqlite";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_product);

        addControls();
        addEvents();
    }

    private void addEvents() {
        btnThemHinh.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ActivityCompat.requestPermissions(
                        AddProductActivity.this,
                        new String[]{Manifest.permission.READ_EXTERNAL_STORAGE},
                        REQUEST_CODE_GALLERY
                );
            }
        });

        btnLuu.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String ten = edtTen.getText().toString();
                String gia = edtGia.getText().toString();
                String kichthuoc = edtKichThuoc.getText().toString();
                String phanloai = edtPhanLoai.getText().toString();

                SanPham sp = new SanPham(1, ten, gia, imageViewToByte(imgHinh), kichthuoc, phanloai);
                ghiDuLieu(sp);
                Toast.makeText(AddProductActivity.this, getString(R.string.toast_product_add), Toast.LENGTH_SHORT).show();
            }
        });

        btnTroVe.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(
                        AddProductActivity.this,
                        HomePageActivity.class
                );
                startActivity(intent);
            }
        });
    }

    private void ghiDuLieu(SanPham sp) {
        SQLiteDatabase database = openOrCreateDatabase(
                DB_NAME,
                MODE_PRIVATE,
                null
        );
        ContentValues row = new ContentValues();
        row.put("ten", sp.getTensp());
        row.put("kichthuoc", sp.getKichthuoc());
        row.put("gia", sp.getGia());
        row.put("phanloai", sp.getPhanloai());
        row.put("hinh", sp.getHinhanh());
        long insertedID = database.insert(
                "sanpham",
                null,
                row
        );
        database.close();
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if(requestCode == REQUEST_CODE_GALLERY){
            Uri uri = data.getData();
            try{
                InputStream inputStream = getContentResolver().openInputStream(uri);
                Bitmap bitmap = BitmapFactory.decodeStream(inputStream);
                imgHinh.setImageBitmap(bitmap);
            }catch (FileNotFoundException ex){
                ex.printStackTrace();
            }

        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if(requestCode == REQUEST_CODE_GALLERY){
            if(grantResults.length >0 && grantResults[0] == PackageManager.PERMISSION_GRANTED)
            {
                Intent intent =  new Intent(Intent.ACTION_PICK);
                intent.setType("image/*");
                startActivityForResult(intent, REQUEST_CODE_GALLERY);
            } else{
                Toast.makeText(getApplicationContext(), getString(R.string.toast_permission), Toast.LENGTH_LONG).show();
            }
        }
    }

    private byte[] imageViewToByte(ImageView image) {
        Bitmap bitmap = ((BitmapDrawable)image.getDrawable()).getBitmap();
        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.JPEG, 100, stream);
        byte[] byteArray = stream.toByteArray();
        return byteArray;
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        switch (item.getItemId()) {
            case R.id.productlist:
                Intent intent = new Intent(
                        AddProductActivity.this,
                        HomePageActivity.class);
                startActivity(intent);
                break;
            case R.id.brandlist:
                Intent intent1 = new Intent(
                        AddProductActivity.this,
                        BrandActivity.class
                );
                startActivity(intent1);
                break;
            case R.id.logout:
                Intent intent2 = new Intent(
                        AddProductActivity.this,
                        MainActivity.class);
                startActivity(intent2);
                break;
            case R.id.about:
                Intent intent3 = new Intent(
                        AddProductActivity.this,
                        AboutActivity.class
                );
                startActivity(intent3);
                break;
            case R.id.exit:
                finishAffinity();
                System.exit(0);
                break;
        }
        return super.onOptionsItemSelected(item);
    }

    private void addControls() {
        edtTen = findViewById(R.id.edtTen);
        edtGia = findViewById(R.id.edtGia);
        edtKichThuoc = findViewById(R.id.edtKichThuocSP);
        edtPhanLoai = findViewById(R.id.edtPhanLoai);
        imgHinh = findViewById(R.id.imgHinh);
        btnThemHinh = findViewById(R.id.btnThemHinh);
        btnLuu = findViewById(R.id.btnLuuSP);
        btnTroVe = findViewById(R.id.btnTroVe);
    }
}