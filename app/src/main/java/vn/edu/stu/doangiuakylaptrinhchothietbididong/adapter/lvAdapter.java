package vn.edu.stu.doangiuakylaptrinhchothietbididong.adapter;

import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.ArrayList;

import vn.edu.stu.doangiuakylaptrinhchothietbididong.R;
import vn.edu.stu.doangiuakylaptrinhchothietbididong.model.SanPham;

public class lvAdapter extends BaseAdapter {
    ArrayList<SanPham> dsSanPham;
    Context context;
    int layout;

    final String DB_PATH_SUFFIX = "/databases/";
    final String DB_NAME = "dbsanpham.sqlite";

    public lvAdapter(ArrayList<SanPham> dsSanPham, Context context, int layout) {
        this.dsSanPham = dsSanPham;
        this.context = context;
        this.layout = layout;
    }

    @Override
    public int getCount() {
        return dsSanPham.size();
    }

    @Override
    public Object getItem(int position) {
        return dsSanPham.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        convertView = inflater.inflate(layout, null);

        TextView txtTenSP = convertView.findViewById(R.id.tvTenSanPham);
        TextView txtGia = convertView.findViewById(R.id.tvGia);
        ImageView imgHinh = convertView.findViewById(R.id.ivSP);
        SanPham sp = dsSanPham.get(position);
        txtTenSP.setText(sp.getTensp().toString());
        txtGia.setText(sp.getGia().toString());
        byte[] hinh = sp.getHinhanh();

        Bitmap bitmap = BitmapFactory.decodeByteArray(hinh, 0, hinh.length);
        imgHinh.setImageBitmap(bitmap);

//        ImageButton imgEdit = convertView.findViewById(R.id.imgEdit);
//        imgEdit.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                Intent intent = new Intent(
//                        context,
//                        DetailsActivity.class
//                );
//                intent.putExtra("chitiet", dsSanPham.get(position));
//                context.startActivity(intent);
//            }
//        });
//
//        ImageView ivSP = convertView.findViewById(R.id.ivSP);
//        ivSP.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                Intent intent = new Intent(
//                        context,
//                        DetailsProductActivity.class
//                );
//                intent.putExtra("chitiet", dsSanPham.get(position));
//                context.startActivity(intent);
//            }
//        });
//        ivSP.setOnLongClickListener(new View.OnLongClickListener() {
//            @Override
//            public boolean onLongClick(View v) {
//
//               return false;
//            }
//        });
        return convertView;
    }
}
