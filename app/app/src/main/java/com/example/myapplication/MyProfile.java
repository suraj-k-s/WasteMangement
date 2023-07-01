package com.example.myapplication;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.MenuItem;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class MyProfile extends AppCompatActivity {
    TextView nam,email,phone,address;

    String url = "http://192.168.1.45:8084/Assets/Files/EmployeePhoto/";
    ImageView propic;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my_profile);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        nam=findViewById(R.id.name);
        email=findViewById(R.id.email);
        phone=findViewById(R.id.phone);
        address=findViewById(R.id.address);
        propic=findViewById(R.id.propic);
        SharedPreferences a=getSharedPreferences("user",MODE_PRIVATE);
        String id=a.getString("id","");

        MyPro s=new MyPro();
        s.execute(id);




    }
        public boolean onOptionsItemSelected(MenuItem item){
            Intent myIntent = new Intent(getApplicationContext(), Homepage.class);
            startActivityForResult(myIntent, 0);
            return true;
    }
    public class MyPro extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("MyPro");


            wb.addProperty("id", strings[0]);

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


                   String Name= jo.getString("name");
                    String Email = jo.getString("email");
                    String Phone= jo.getString("phone");
                    String Pro= jo.getString("propic");
                    String Loc= jo.getString("address");

                    nam.setText(Name);
                    email.setText(Email);
                    phone.setText(Phone);
                    address.setText(Loc);
                    Picasso.get().load(url+Pro).into(propic);

                } catch (JSONException e) {
                    e.printStackTrace();
                }




            }
        }


    }

}