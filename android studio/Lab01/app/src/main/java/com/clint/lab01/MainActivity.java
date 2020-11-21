/**********************************************************
 * Lab01.java - Tap button and display Ouch   *
 *                                                                       *
 * Name: Jamecia Moore                                     *
 * Lab: Lab 1 Getting Started                           *
 * Email: jmmoore5@coastal.edu                              *
 * Date: 1/23/2020                                           *
 **********************************************************/

package com.clint.lab01;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
    public void onButtonTap(View v) {
        Toast myToast = Toast.makeText(getApplicationContext(), "Ouch!", Toast.LENGTH_LONG);
        myToast.show();
    }
}
