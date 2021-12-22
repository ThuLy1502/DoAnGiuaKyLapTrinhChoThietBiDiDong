package vn.edu.stu.doangiuakylaptrinhchothietbididong;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.ContentValues;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.ContextMenu;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;

import vn.edu.stu.doangiuakylaptrinhchothietbididong.model.SanPham;
import vn.edu.stu.doangiuakylaptrinhchothietbididong.model.ThuongHieu;

public class BrandActivity extends AppCompatActivity {
    EditText edtMaThuongHieu, edtTenThuongHieu;
    Button btnThemThuongHieu, btnSuaThuongHieu;
    ListView lvThuongHieu;
    ArrayAdapter<ThuongHieu> adapterThuongHieu;
    ArrayList<SanPham> dsSanPham;

    final String DB_PATH_SUFFIX = "/databases/";
    final String DB_NAME = "dbsanpham.sqlite";

    ThuongHieu thChon = null;
    private AlertDialog.Builder builder;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_brand);

        //dsSanPham = new ArrayList<>();
        copyDbFromAssets();
        addControls();
        docDsThuonghieuTuDb();
        //docDsSpTuDb();
        addEvents();

    }

//    private boolean checkProductInBrand(ThuongHieu th) {
//        for (int i = 0; i < dsSanPham.size(); i++) {
//            if (dsSanPham.get(i).getPhanloai().equals(th.getIdth())) {
//                return true;
//            }
//        }
//        return false;
//    }

    private void copyDbFromAssets() {
        File dbFile = getDatabasePath(DB_NAME);
        if (!dbFile.exists()) {
            try {
                File dbDir = new File(getApplicationInfo().dataDir + DB_PATH_SUFFIX);
                if (!dbDir.exists()) dbDir.mkdir();

                InputStream is = getAssets().open(DB_NAME);
                String outputFilePath = getApplicationInfo().dataDir + DB_PATH_SUFFIX + DB_NAME;
                OutputStream os = new FileOutputStream(outputFilePath);
                byte[] buffer = new byte[1024];
                int length = 0;
                while ((length = is.read(buffer)) > 0) {
                    os.write(buffer, 0, length);
                }
                os.flush();
                os.close();
                is.close();
            } catch (Exception ex) {
                ex.fillInStackTrace();
            }
        }
    }

    private void docDsThuonghieuTuDb() {
        SQLiteDatabase database = openOrCreateDatabase(
                DB_NAME,
                MODE_PRIVATE,
                null
        );
        Cursor cursor = database.rawQuery("Select * From thuonghieu", null);
        adapterThuongHieu.clear();
        while (cursor.moveToNext()) {
            String idTH = cursor.getString(0);
            String tenTH = cursor.getString(1);
            adapterThuongHieu.add(new ThuongHieu(idTH, tenTH));
        }
        cursor.close();
        database.close();
        adapterThuongHieu.notifyDataSetChanged();
    }

//    private void docDsSpTuDb() {
//        SQLiteDatabase database = openOrCreateDatabase(
//                DB_NAME,
//                MODE_PRIVATE,
//                null
//        );
//        Cursor cursor = database.rawQuery("Select * From sanpham", null);
//        dsSanPham.clear();
//        while (cursor.moveToNext()) {
//            int id = cursor.getInt(0);
//            String txtTenSP = cursor.getString(1);
//            int kichthuoc = cursor.getInt(2);
//            int gia = cursor.getInt(3);
//            String txtPhanLoai = cursor.getString(4);
//            byte[] imgHinh = cursor.getBlob(5);
//
//            SanPham sp = new SanPham(id, txtTenSP, txtPhanLoai, imgHinh, String.valueOf(gia), String.valueOf(kichthuoc));
//            dsSanPham.add(sp);
//        }
//        cursor.close();
//        database.close();
//    }

    private void addEvents() {
//        btnThemThuongHieu.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                String idTH = edtMaThuongHieu.getText().toString();
//                String tenTH = edtTenThuongHieu.getText().toString();
//
//                ThuongHieu th = new ThuongHieu(
//                        idTH + " ",
//                        tenTH
//                );
//                SQLiteDatabase database = openOrCreateDatabase(
//                        DB_NAME,
//                        MODE_PRIVATE,
//                        null
//                );
//                ContentValues row = new ContentValues();
//                row.put("idth", th.getIdth());
//                row.put("tenth", th.getTenth());
//
//                long insertedID = database.insert(
//                        "thuonghieu",
//                        null,
//                        row
//                );
//
//                Toast.makeText(
//                        BrandActivity.this,
//                        "Thêm thương hiệu thành công",
//                        Toast.LENGTH_LONG
//                ).show();
//                edtMaThuongHieu.setText("");
//                edtTenThuongHieu.setText("");
//                database.close();
//                docDsThuonghieuTuDb();
//            }
//        });

//        lvThuongHieu.setOnItemClickListener(new AdapterView.OnItemClickListener() {
//            @Override
//            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
//                thChon = adapterThuongHieu.getItem(position);
//
//                edtMaThuongHieu.setText(thChon.getIdth().toString());
//                edtTenThuongHieu.setText(thChon.getTenth().toString());
//            }
//        });

//        btnSuaThuongHieu.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                if (thChon != null) {
//                    String idTH = edtMaThuongHieu.getText().toString();
//                    String tenTH = edtTenThuongHieu.getText().toString();
//
//                    ThuongHieu th = new ThuongHieu(
//                            idTH + " ",
//                            tenTH
//                    );
//                    SQLiteDatabase database = openOrCreateDatabase(
//                            DB_NAME,
//                            MODE_PRIVATE,
//                            null
//                    );
//                    ContentValues row = new ContentValues();
//                    //row.put("idth", th.getIdth());
//                    row.put("tenth", th.getTenth());
//                    int updatedRowCount = database.update(
//                            "thuonghieu",
//                            row,
//                            "idth=?",
//                            new String[]{thChon.getIdth() + ""}
//                    );
//                    Toast.makeText(
//                            BrandActivity.this,
//                            getString(R.string.toast_brand_update),
//                            Toast.LENGTH_LONG
//                    ).show();
//                    edtMaThuongHieu.setText("");
//                    edtTenThuongHieu.setText("");
//                    database.close();
//                    docDsThuonghieuTuDb();
//                    thChon = null;
//                }
//            }
//        });

//        lvThuongHieu.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
//            @Override
//            public boolean onItemLongClick(AdapterView<?> parent, View view, int position, long id) {
//                AlertDialog.Builder builder = new AlertDialog.Builder(BrandActivity.this);
//                builder.setIcon(R.drawable.icons_notification);
//                builder.setTitle(getString(R.string.notification));
//                builder.setMessage(getString(R.string.message_brand));
//                builder.setPositiveButton(getString(R.string.agree), new DialogInterface.OnClickListener() {
//                    @Override
//                    public void onClick(DialogInterface dialog, int which) {
//                        ThuongHieu th = adapterThuongHieu.getItem(position);
//                        SQLiteDatabase database = openOrCreateDatabase(
//                                DB_NAME,
//                                MODE_PRIVATE,
//                                null
//                        );
//                        int deletedRowCount = database.delete(
//                                "thuonghieu",
//                                "idth=?",
//                                new String[]{th.getIdth()}
//                        );
//                        Toast.makeText(
//                                BrandActivity.this,
//                                getString(R.string.toast_delete_brand),
//                                Toast.LENGTH_LONG
//                        ).show();
//                        database.close();
//                        docDsThuonghieuTuDb();
//                    }
//                });
//                builder.setNegativeButton(getString(R.string.cancel), new DialogInterface.OnClickListener() {
//                    @Override
//                    public void onClick(DialogInterface dialog, int which) {
//                    }
//                });
//                AlertDialog dialog = builder.create();
//                dialog.show();
//                return false;
//            }
//        });
    }

    private void addControls() {
        edtMaThuongHieu = findViewById(R.id.edtMaThuongHieu);
        edtTenThuongHieu = findViewById(R.id.edtTenThuongHieu);
        btnThemThuongHieu = findViewById(R.id.btnThemThuongHieu);
        btnSuaThuongHieu = findViewById(R.id.btnSuaThuongHieu);
        lvThuongHieu = findViewById(R.id.lvThuongHieu);
        adapterThuongHieu = new ArrayAdapter<>(
                BrandActivity.this,
                android.R.layout.simple_list_item_1
        );
        lvThuongHieu.setAdapter(adapterThuongHieu);
        registerForContextMenu(lvThuongHieu);
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
                        BrandActivity.this,
                        HomePageActivity.class);
                startActivity(intent);
                break;
            case R.id.brandlist:
                Intent intent1 = new Intent(
                        BrandActivity.this,
                        BrandActivity.class
                );
                startActivity(intent1);
                break;
            case R.id.logout:
                Intent intent2 = new Intent(
                        BrandActivity.this,
                        MainActivity.class);
                startActivity(intent2);
                break;
            case R.id.about:
                Intent intent3 = new Intent(
                        BrandActivity.this,
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

    @Override
    public void onCreateContextMenu(ContextMenu menu, View v, ContextMenu.ContextMenuInfo menuInfo) {
        super.onCreateContextMenu(menu, v, menuInfo);
        if (v.getId() == R.id.lvThuongHieu) {
            getMenuInflater().inflate(R.menu.menu_brand, menu);
        }
    }

    @Override
    public boolean onContextItemSelected(MenuItem item) {
        AdapterView.AdapterContextMenuInfo info =
                (AdapterView.AdapterContextMenuInfo) item.getMenuInfo();
        int index = info.position;
        ThuongHieu th = adapterThuongHieu.getItem(index);
        switch (item.getItemId()) {
            case R.id.mnuProductBrand:
                Intent intent = new Intent(
                        BrandActivity.this,
                        HomePageActivity.class
                );
                intent.putExtra("hienThiSpTheoTh", th);
                startActivity(intent);
                break;
//            case R.id.mnuDelete:
//                xoaThuongHieu(index);
//                break;
            default:
                break;
        }
        return super.onContextItemSelected(item);
    }

//    private void xoaThuongHieu(int position) {
//        ThuongHieu th = adapterThuongHieu.getItem(position);
//        if (checkProductInBrand(th)) {
//            Toast.makeText(
//                    BrandActivity.this,
//                    getString(R.string.toast_deleted),
//                    Toast.LENGTH_LONG
//            ).show();
//        } else {
//            AlertDialog.Builder builder = new AlertDialog.Builder(BrandActivity.this);
//            builder.setIcon(R.drawable.icons_notification);
//            builder.setTitle(getString(R.string.notification));
//            builder.setMessage(getString(R.string.message_brand));
//            builder.setPositiveButton(getString(R.string.agree), new DialogInterface.OnClickListener() {
//                @Override
//                public void onClick(DialogInterface dialog, int which) {
//                    ThuongHieu th = adapterThuongHieu.getItem(position);
//                    SQLiteDatabase database = openOrCreateDatabase(
//                            DB_NAME,
//                            MODE_PRIVATE,
//                            null
//                    );
//                    int deletedRowCount = database.delete(
//                            "thuonghieu",
//                            "idth=?",
//                            new String[]{th.getIdth()}
//                    );
//                    Toast.makeText(
//                            BrandActivity.this,
//                            getString(R.string.toast_delete_brand),
//                            Toast.LENGTH_LONG
//                    ).show();
//                    database.close();
//                    docDsThuonghieuTuDb();
//                }
//            });
//            builder.setNegativeButton(getString(R.string.cancel), new DialogInterface.OnClickListener() {
//                @Override
//                public void onClick(DialogInterface dialog, int which) {
//                }
//            });
//            AlertDialog dialog = builder.create();
//            dialog.show();
//        }
//    }
}