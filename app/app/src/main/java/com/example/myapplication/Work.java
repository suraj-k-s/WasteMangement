package com.example.myapplication;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.MenuItem;
import android.view.View;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;




public class Work extends AppCompatActivity {

    RecyclerView recyclerView;
    String photo[],name[],date[],materials[];

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_work);

        recyclerView=findViewById(R.id.recyclerview);


        SharedPreferences a=getSharedPreferences("user",MODE_PRIVATE);
        String id=a.getString("id","");

        getDetails l = new getDetails();
        l.execute(id);

    }
    public class getDetails extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("GetWork");
            wb.addProperty("eid", strings[0]);
            wb.addProperty("ip", WebServiceCaller.ip);

            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            JSONArray j = null;
            try {
                j = new JSONArray(s);
                name = new String[j.length()];
                date = new String[j.length()];
                photo = new String[j.length()];
                materials = new String[j.length()];
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    name[i] = jo.getString("name");
                    date[i] = jo.getString("date");
                    materials[i] = jo.getString("materials");
                    photo[i] = jo.getString("photo");

                }
            } catch (JSONException e) {
                e.printStackTrace();
            }

            Adapter myAdapter = new Adapter(Work.this,photo,name,date,materials);
            myAdapter.setOnItemClickListener(new Adapter.OnItemClickListener() {
                @Override
                public void onItemClick(int position) {
                    Intent i = new Intent(Work.this, ScanQRCodeActivity.class);
                    startActivity(i);
                }
            });

            recyclerView.setAdapter(myAdapter);
            recyclerView.setLayoutManager(new LinearLayoutManager(Work.this));
        }
    }
}