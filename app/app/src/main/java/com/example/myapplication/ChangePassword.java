package com.example.myapplication;

import android.content.Intent;
import android.os.Bundle;
import android.view.MenuItem;

import androidx.appcompat.app.AppCompatActivity;

public class ChangePassword extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_change_password);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
    }
        public boolean onOptionsItemSelected(MenuItem item){
            Intent myIntent = new Intent(getApplicationContext(), Homepage.class);
            startActivityForResult(myIntent, 0);
            return true;


        }
}