package com.example.myapplication;

import android.content.Intent;
import android.os.Bundle;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageView;

import androidx.appcompat.app.AppCompatActivity;

public class Profile extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile);
        ImageView cp;
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);


        cp = findViewById(R.id.imageView1);

        cp.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent splashintent = new Intent(Profile.this, MyProfile.class);
                startActivity(splashintent);
                finish();
            }
        });

        cp = findViewById(R.id.imageView2);

        cp.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent splashintent = new Intent(Profile.this, EditProfile.class);
                startActivity(splashintent);
                finish();
            }
        });
    }
        public boolean onOptionsItemSelected(MenuItem item){
            Intent myIntent = new Intent(getApplicationContext(), Homepage.class);
            startActivityForResult(myIntent, 0);
            return true;



    }
}