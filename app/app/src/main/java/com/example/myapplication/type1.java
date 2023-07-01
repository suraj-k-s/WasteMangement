package com.example.myapplication;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;



public class type1 extends AppCompatActivity {

    RecyclerView recyclerView;
    int recyclableSum = 0;
    int nonRecyclableSum = 0;
    Button submitButton,proceedButton;
    String type[],category[],rate[],bodyid[],request[];

    TextView pay,recive;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_type1);

        recyclerView=findViewById(R.id.recyclerview1);
        submitButton=findViewById(R.id.submitButton);
        proceedButton=findViewById(R.id.proceedButton);
        pay=findViewById(R.id.pay_to_user_value);
        recive=findViewById(R.id.receive_from_user_value);


        String id = getIntent().getStringExtra("id");

        getDetails l = new getDetails();
        l.execute(id);



proceedButton.setOnClickListener(new View.OnClickListener() {
    @Override
    public void onClick(View v) {
        updateAmount u = new updateAmount();
        String id = getIntent().getStringExtra("id");
        u.execute(id,String.valueOf(recyclableSum),String.valueOf(nonRecyclableSum));
    }
});


        submitButton.setOnClickListener(v -> {

            Adapter1 adapter = (Adapter1) recyclerView.getAdapter();
            ArrayList<String> editTextValues = new ArrayList<>(adapter.getEditTextValues());
            ArrayList<Integer> editTextPositions = new ArrayList<>(adapter.getEditTextPositions());
            // Retrieve the value of the last EditText separately
            View lastView = recyclerView.getChildAt(adapter.getItemCount() - 1);
            EditText lastEditText = lastView.findViewById(R.id.editType);
            String lastValue = lastEditText.getText().toString().trim();
            if (!lastValue.isEmpty()) {
                editTextValues.add(lastValue);
            }
            recyclableSum = 0;
            nonRecyclableSum = 0;

            Log.d("TAG", String.valueOf(editTextValues));

            // Compare the positions with the categories array and sum them accordingly
            for (int position : editTextPositions) {
                Log.d("hai", "Hai ");
                String category = adapter.getCategory(position);
                int value = Integer.parseInt(editTextValues.get(position));

                if (category.equalsIgnoreCase("Recyclable")) {
                    recyclableSum += value * Integer.parseInt(rate[position]);
                } else if (category.equalsIgnoreCase("Non recyclable")) {
                    nonRecyclableSum += value * Integer.parseInt(rate[position]);
                }
            }

            pay.setText("₹"+String.valueOf(recyclableSum));
            recive.setText("₹"+String.valueOf(nonRecyclableSum));


        });



    }
    public class getDetails extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("GetMaterial");
            wb.addProperty("uid", strings[0]);

            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            JSONArray j = null;
            try {
                j = new JSONArray(s);
                type = new String[j.length()];
                category = new String[j.length()];
                rate = new String[j.length()];
                bodyid = new String[j.length()];
                request = new String[j.length()];
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    type[i] = jo.getString("type");
                    category[i] = jo.getString("category");
                    rate[i] = jo.getString("rate");
                    bodyid[i] = jo.getString("bodyid");
                    request[i] = jo.getString("request");

                }
            } catch (JSONException e) {
                e.printStackTrace();
            }

            Adapter1 myAdapter = new Adapter1(type1.this,type,category,rate,bodyid,request);

            recyclerView.setAdapter(myAdapter);
            recyclerView.setLayoutManager(new LinearLayoutManager(type1.this));
        }
    }

    public class updateAmount extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("UpdateAmount");
            wb.addProperty("id", request[0]);
            wb.addProperty("pay", strings[1]);
            wb.addProperty("recive", strings[2]);

            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            Log.d("TAG", s);
            if(s.equals("true"))
            {
                Toast.makeText(type1.this, "Successfully completed", Toast.LENGTH_SHORT).show();

                // Redirect to the home page
                Intent intent = new Intent(type1.this, Homepage.class);
                startActivity(intent);
                finish();
            }
        }
    }
}