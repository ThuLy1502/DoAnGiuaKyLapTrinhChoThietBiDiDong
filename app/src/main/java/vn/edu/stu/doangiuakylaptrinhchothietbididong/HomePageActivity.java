package vn.edu.stu.doangiuakylaptrinhchothietbididong;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;

public class HomePageActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home_page);
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
//            case R.id.brandlist:
//                Intent intent1 = new Intent(
//                        HomePageActivity.this,
//                        BrandActivity.class
//                );
//                startActivity(intent1);
//                break;
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