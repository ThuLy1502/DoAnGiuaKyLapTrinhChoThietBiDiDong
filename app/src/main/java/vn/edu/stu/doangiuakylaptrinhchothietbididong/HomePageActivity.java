package vn.edu.stu.doangiuakylaptrinhchothietbididong;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.Toast;

import com.google.android.material.floatingactionbutton.FloatingActionButton;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;

import vn.edu.stu.doangiuakylaptrinhchothietbididong.adapter.lvAdapter;
import vn.edu.stu.doangiuakylaptrinhchothietbididong.model.SanPham;
import vn.edu.stu.doangiuakylaptrinhchothietbididong.model.ThuongHieu;

public class HomePageActivity extends AppCompatActivity {
    ListView lvSanPham;
    ArrayList<SanPham> ds;
    lvAdapter lvSanPhamAdapter;
    FloatingActionButton fabThem;

    final String DB_PATH_SUFFIX = "/databases/";
    final String DB_NAME = "dbsanpham.sqlite";
    ThuongHieu th;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home_page);

        copyDBFromAsssets();
        addControls();

        docDsSpTuDb();
        Intent intent = getIntent();
        th = (ThuongHieu) intent.getSerializableExtra("hienThiSpTheoTh");
        docDsSpTheoTh();
        addEvents();
    }

    private void docDsSpTheoTh() {
        ArrayList<SanPham> dsSpTheoTh = new ArrayList<>();
        if (th != null) {
            for (int i = 0; i < ds.size(); i++) {
                if (ds.get(i).getPhanloai().equals(th.getIdth())) {
                    dsSpTheoTh.add(ds.get(i));
                }
            }
            ds.clear();
            for (int i = 0; i < dsSpTheoTh.size(); i++) {
                ds.add(dsSpTheoTh.get(i));
            }
            lvSanPhamAdapter.notifyDataSetChanged();
        }
    }

    private void addEvents() {
        fabThem.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(
                        HomePageActivity.this,
                        AddProductActivity.class
                );
                startActivity(intent);
            }
        });

//        lvSanPham.setOnItemClickListener(new AdapterView.OnItemClickListener() {
//            @Override
//            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
//                Intent intent = new Intent(
//                        HomePageActivity.this,
//                        DetailsProductActivity.class
//                );
//                intent.putExtra("chitiet", ds.get(position));
//                startActivity(intent);
//            }
//        });

        lvSanPham.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            @Override
            public boolean onItemLongClick(AdapterView<?> parent, View view, int position, long id) {
                AlertDialog.Builder builder = new AlertDialog.Builder(HomePageActivity.this);
                builder.setIcon(R.drawable.icons_notification);
                builder.setTitle(getString(R.string.notification));
                builder.setMessage(getString(R.string.message));
                builder.setPositiveButton(getString(R.string.agree), new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        SanPham sp = ds.get(position);
                        SQLiteDatabase database = openOrCreateDatabase(
                                DB_NAME,
                                MODE_PRIVATE,
                                null
                        );
                        int deletedRowCount = database.delete(
                                "sanpham",
                                "id=?",
                                new String[]{sp.getId() + ""}
                        );
                        Toast.makeText(
                                HomePageActivity.this,
                                getString(R.string.toast_delete),
                                Toast.LENGTH_SHORT
                        ).show();
                        docDsSpTuDb();
                    }
                });
                builder.setNegativeButton(getString(R.string.cancel), new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {

                    }
                });
                AlertDialog dialog = builder.create();
                dialog.show();
                return false;
            }
        });
    }

    private void addControls() {
        ds = new ArrayList<>();
        lvSanPham = findViewById(R.id.lvSanPham);
        fabThem = findViewById(R.id.fabThem);
    }

    private void docDsSpTuDb() {
        SQLiteDatabase database = openOrCreateDatabase(
                DB_NAME,
                MODE_PRIVATE,
                null
        );
        Cursor cursor = database.rawQuery("Select * From sanpham", null);
        ds.clear();
        while (cursor.moveToNext()) {
            int id = cursor.getInt(0);
            String txtTenSP = cursor.getString(1);
            int kichthuoc = cursor.getInt(2);
            int gia = cursor.getInt(3);
            String txtPhanLoai = cursor.getString(4);
            byte[] imgHinh = cursor.getBlob(5);

            SanPham sp = new SanPham(id, txtTenSP, txtPhanLoai, imgHinh, String.valueOf(gia), String.valueOf(kichthuoc));
            ds.add(sp);
        }
        lvSanPhamAdapter = new lvAdapter(ds,
                HomePageActivity.this,
                R.layout.listviewsp
        );
        lvSanPham.setAdapter(lvSanPhamAdapter);
        lvSanPhamAdapter.notifyDataSetChanged();
        cursor.close();
        database.close();
    }

    private void copyDBFromAsssets() {
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
                        HomePageActivity.this,
                        HomePageActivity.class);
                startActivity(intent);
                break;
            case R.id.brandlist:
                Intent intent1 = new Intent(
                        HomePageActivity.this,
                        BrandActivity.class
                );
                startActivity(intent1);
                break;
            case R.id.logout:
                Intent intent2 = new Intent(
                        HomePageActivity.this,
                        MainActivity.class);
                startActivity(intent2);
                break;
            case R.id.about:
                Intent intent3 = new Intent(
                        HomePageActivity.this,
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