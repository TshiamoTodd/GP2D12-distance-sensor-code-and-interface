# GP2D12-distance-sensor-code-and-interface

# Hi.
This is a project that simulates the operations of a wall follower robot that uses hysteresis to prevent rapid cycling between states. The code provided expands upon the decision making process of the robot as it navigates a terrain, 2 distance values should be provided which will provide the hysteresis window. As an example: Var_Too_Far and Var_Too_Close. These variables will have distances associated with them, which you will provide, and if the distance is less than Var_Too_Close the robot must turn away from the wall, and if the distance measured is more than Var_Too_Far, the robot must turn towards the wall. 

# Equipment needed
<hr/>
<ul>
  <li>Microcontroller (arduino uno/esp32 or any...)</li>
  <li>GP2D12 sensor</li>
</ul>

# What is happening in the code you ask?
Well... I developed firmware that does the following.
<ul>
  <li>Convert the analog data from the connected GP2DXX sensor into distance data (I used a library for this)</li>
  <ul><li>SharpIR.h is the library i used.</li></ul>
  <li>Transmit the converted analog data through serial communication to a processing application for display purposes</li>
  <li>Create a processing program that displays the distance measured by the sensor</li>
  <li>Indicate in the processing program where the robot should turn closer or further away from the wall</li>
</ul>

# GP2D12 Sensor specifications
Supply voltage : -0.3V / +7V
Output terminal voltage : -0.3V / +0.3V
Operating Temperature : -10`C / + 60`C
Storage Temperature : -40`C / +70`C



