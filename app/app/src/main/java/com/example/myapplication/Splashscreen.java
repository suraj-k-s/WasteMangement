package com.example.myapplication;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.widget.ImageView;

import androidx.appcompat.app.AppCompatActivity;

public class Splashscreen extends AppCompatActivity {
ImageView Logo;
private static int splash_timeout=1000;
private static int logo_timeout=4300;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splashscreen);

        Logo=findViewById(R.id.Imaeg);

        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
//                Animation myanimation2= AnimationUtils.loadAnimation(Splashscreen.this,R.anim.animation1);
//                Logo.startAnimation(myanimation2);
                Logo .setVisibility(View.VISIBLE);

            }
        },logo_timeout);


        Logo.animate().translationY(0).setDuration(5000).setStartDelay(0);
        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                Intent splashintent=new Intent(Splashscreen.this,Login.class);
                startActivity(splashintent);
                finish();
            }
        },splash_timeout+logo_timeout);


    }
}