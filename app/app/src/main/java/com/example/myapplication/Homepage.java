package com.example.myapplication;

import android.content.Intent;
import android.os.Bundle;
import android.view.MenuItem;
import android.view.View;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;

public class Homepage extends AppCompatActivity {

    CardView settings,assigned,profile,path;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_homepage);

        settings = findViewById(R.id.settings);
        assigned = findViewById(R.id.assigned);
        profile = findViewById(R.id.profile);
        path = findViewById(R.id.path);


        settings.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent splashintent=new Intent(Homepage.this,Settings.class);
                startActivity(splashintent);
                finish();
            }
        });

        assigned.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent splashIntent=new Intent(Homepage.this,Assigned.class);
                startActivity(splashIntent);
                finish();
            }
        });

        profile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent splashintent=new Intent(Homepage.this,Profile.class);
                startActivity(splashintent);
                finish();
            }
        });
        
        path.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent splashintent=new Intent(Homepage.this,Path.class);
                startActivity(splashintent);
                finish();
            }
        });


    }




    public boolean onOptionsItemSelected(MenuItem item){
        Intent myIntent = new Intent(getApplicationContext(), Login.class);
        startActivityForResult(myIntent, 0);
        return true;
    }

    }
