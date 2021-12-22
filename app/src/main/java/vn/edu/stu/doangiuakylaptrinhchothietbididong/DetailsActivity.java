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

public class DetailsActivity extends AppCompatActivity {
    EditText edtTenChiTiet, edtGiaChiTiet, edtKichThuocChiTiet, edtPhanLoaiChiTiet;
    ImageView imgHinhChiTiet;
    Button btnThemHinhChiTiet, btnCapNhat;

    final int REQUEST_CODE_GALLERY = 999;
    final String DB_PATH_SUFFIX = "/databases/";
    final String DB_NAME = "dbsanpham.sqlite";
    SanPham sp;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_details);

        addControls();
        addEvents();

        Intent intent = getIntent();
        sp = (SanPham) intent.getSerializableExtra("chitiet");
        edtTenChiTiet.setText(sp.getTensp().toString());
        edtGiaChiTiet.setText(sp.getGia().toString());
        edtKichThuocChiTiet.setText(sp.getKichthuoc().toString());
        edtPhanLoaiChiTiet.setText(sp.getPhanloai().toString());

        byte[] imgHinh = sp.getHinhanh();
        Bitmap bitmap = BitmapFactory.decodeByteArray(imgHinh, 0, imgHinh.length);
        imgHinhChiTiet.setImageBitmap(bitmap);
    }

    private void addEvents() {
        btnThemHinhChiTiet.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ActivityCompat.requestPermissions(
                        DetailsActivity.this,
                        new String[]{Manifest.permission.READ_EXTERNAL_STORAGE},
                        REQUEST_CODE_GALLERY
                );
            }
        });

        btnCapNhat.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String ten = edtTenChiTiet.getText().toString();
                String gia = edtGiaChiTiet.getText().toString();
                String kichthuoc = edtKichThuocChiTiet.getText().toString();
                String phanloai = edtPhanLoaiChiTiet.getText().toString();

                SanPham sanpham = new SanPham(sp.getId(), ten, phanloai, imageViewToByte(imgHinhChiTiet),gia, kichthuoc);
                ghiDuLieu(sanpham);
                //Toast.makeText(DetailsActivity.this, "Cập nhật sản phẩm thành công!!!", Toast.LENGTH_SHORT).show();

                Intent intent = new Intent(
                        DetailsActivity.this,
                        HomePageActivity.class
                );
                startActivity(intent);
            }
        });
    }

    private void addControls() {
        edtTenChiTiet = findViewById(R.id.edtTenChiTiet);
        edtGiaChiTiet = findViewById(R.id.edtGiaChiTiet);
        edtPhanLoaiChiTiet = findViewById(R.id.edtPhanLoaiChiTiet);
        edtKichThuocChiTiet = findViewById(R.id.edtKichThuocChiTiet);
        imgHinhChiTiet = findViewById(R.id.imgHinhChiTiet);
        btnThemHinhChiTiet = findViewById(R.id.btnThemHinhChiTiet);
        btnCapNhat = findViewById(R.id.btnCapNhat);
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
        int updatedRowCount = database.update(
                "sanpham",
                row,
                "id=?",
                new String[]{sp.getId() + ""}
        );
        database.close();
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == REQUEST_CODE_GALLERY) {
            Uri uri = data.getData();
            try {
                InputStream inputStream = getContentResolver().openInputStream(uri);
                Bitmap bitmap = BitmapFactory.decodeStream(inputStream);
                imgHinhChiTiet.setImageBitmap(bitmap);
            } catch (FileNotFoundException ex) {
                ex.printStackTrace();
            }

        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode == REQUEST_CODE_GALLERY) {
            if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                Intent intent = new Intent(Intent.ACTION_PICK);
                intent.setType("image/*");
                startActivityForResult(intent, REQUEST_CODE_GALLERY);
            } else {
                Toast.makeText(getApplicationContext(), getString(R.string.toast_permission), Toast.LENGTH_LONG).show();
            }
        }
    }

    private byte[] imageViewToByte(ImageView image) {
        Bitmap bitmap = ((BitmapDrawable) image.getDrawable()).getBitmap();
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
                        DetailsActivity.this,
                        HomePageActivity.class);
                startActivity(intent);
                break;
            case R.id.brandlist:
                Intent intent1 = new Intent(
                        DetailsActivity.this,
                        BrandActivity.class
                );
                startActivity(intent1);
                break;
            case R.id.logout:
                Intent intent2 = new Intent(
                        DetailsActivity.this,
                        MainActivity.class);
                startActivity(intent2);
                break;
            case R.id.about:
                Intent intent3 = new Intent(
                        DetailsActivity.this,
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
}