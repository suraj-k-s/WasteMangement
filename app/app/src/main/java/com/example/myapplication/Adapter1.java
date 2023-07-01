package com.example.myapplication;

import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

public class Adapter1 extends RecyclerView.Adapter<Adapter1.MyViewHolder> {

    private ArrayList<String> editTextValues;
    private ArrayList<Integer> editTextPositions;
    private String type[], category[], rate[], bodyid[], request[];
    private Context context;

    public Adapter1(Context ct, String ty[], String ca[], String ra[], String bo[], String re[]) {
        context = ct;
        type = ty;
        category = ca;
        rate = ra;
        bodyid = bo;
        request = re;

        editTextValues = new ArrayList<>();
        editTextPositions = new ArrayList<>();
        for (int i = 0; i < type.length; i++) {
            editTextValues.add("");
            editTextPositions.add(i);
        }
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(context);
        View view = inflater.inflate(R.layout.type, parent, false);
        return new MyViewHolder(view);
    }
    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {
        holder.TextType.setText(type[position]);
        // Set the EditText value from the list if available
        if (position < editTextValues.size()) {
            holder.editText.setText(editTextValues.get(position));
        } else {
            holder.editText.setText("");
        }

        holder.editText.setOnFocusChangeListener((view, hasFocus) -> {
            if (!hasFocus) {
                String value = holder.editText.getText().toString();
                int editTextPosition = holder.getAdapterPosition();
                updateEditTextValue(editTextPosition, value);
            }
        });
    }

    @Override
    public int getItemCount() {
        return type.length;
    }

    public String getCategory(int position) {
        return category[position];
    }
    public void updateEditTextValue(int position, String value) {
        if (position < editTextValues.size()) {
            editTextValues.set(position, value);
        } else {
            editTextValues.add(value);
        }
    }

    public ArrayList<String> getEditTextValues() {
        // Filter out empty values from editTextValues list
        ArrayList<String> filteredValues = new ArrayList<>();
        for (String value : editTextValues) {
            if (!value.isEmpty()) {
                filteredValues.add(value);
            }
        }
        return filteredValues;
    }


    public ArrayList<Integer> getEditTextPositions() {
        return editTextPositions;
    }

    public class MyViewHolder extends RecyclerView.ViewHolder {
        TextView TextType;
        EditText editText;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            TextType = itemView.findViewById(R.id.textType);
            editText = itemView.findViewById(R.id.editType);
        }
    }
}
