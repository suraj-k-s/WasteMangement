package com.example.myapplication;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.google.android.material.button.MaterialButton;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Login extends AppCompatActivity {

    MaterialButton Login;
    String Email, Password;
    String id , name;

    EditText emailT,passwordT;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login2);


        Login = findViewById(R.id.LOGIN);
        emailT = findViewById(R.id.Email);
        passwordT = findViewById(R.id.Password);
        Login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Email = emailT.getText().toString();
                Password = passwordT.getText().toString();

//                Email = "chaandhu@gmail.com";
//                Password = "chaandhu";


                LoginDetails l = new LoginDetails();
                l.execute(Email, Password);
            }
        });


    }
    public class LoginDetails extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("LoginDetails");


            wb.addProperty("email", strings[0]);
            wb.addProperty("password", strings[1]);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);

            if (!s.equals("[]")) {
                JSONArray j = null;
                try {
                    j = new JSONArray(s);
                    JSONObject jo = j.getJSONObject(0);
                    id = jo.getString("id");
                    name = jo.getString("name");

                    Toast.makeText(Login.this, "success", Toast.LENGTH_SHORT).show();


                    SharedPreferences.Editor sh = getSharedPreferences("user", MODE_PRIVATE).edit();
                    sh.putString("id", id);
                    sh.putString("name", name);


                    sh.apply();

                } catch (JSONException e) {
                    e.printStackTrace();
                }

                Intent i = new Intent(Login.this, Homepage.class);
                startActivity(i);


            } else {
                Toast.makeText(Login.this, "faild", Toast.LENGTH_SHORT).show();

            }
        }


    }
}