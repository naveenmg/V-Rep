# V-Rep
Scara Robot in Vrep

The SCARA acronym stands for Selective Compliance Assembly Robot Arm.
The SCARA robot is a manipulator with four degrees of freedom. 
This type of robot has been developed to improve the speed and repeatability ON PICK&PLACE TASKS from one location to another or to speed and improve the steps involved in assembly.

The model of the robot was created on onshape and .stl files were exported for use in VRep.

![scara](https://user-images.githubusercontent.com/38221793/58837508-12152680-865c-11e9-92ea-89988b6fd4b7.png)

SCARA RRT made on https://www.onshape.com/

The robot simulator V-REP, with integrated development environment, is based on a distributed control architecture.
V-REP is used for fast algorithm development, factory automation simulations, fast prototyping and verification, robotics related education, remote monitoring, safety double-checking, etc. 

![forw](https://user-images.githubusercontent.com/38221793/58837504-10e3f980-865c-11e9-95fa-949505e5d3a7.JPG)

Forward Kinematics of the SCARA robot is calculated and respective octave file is created. 
Octave file is then linked to VRep to simulate the robot.
When the angle of each of the link is written in Octave, using forward kinematics the final position of the robot gripper is calculated on Octave and simulated on VRep.

![for](https://user-images.githubusercontent.com/38221793/58837501-10e3f980-865c-11e9-878f-1ee88892eaff.png)

Forward kinematics on VRep with Octave

Inverse Kinematics of the SCARA robot is calculated and implemented as an octave file. 
When the final position of the robot gripper is written in Octave, using inverse kinematics the angle of each of the link are calculated on Octave and simulated on VRep. 
Further applications such as path planning are also implemented. 

![in](https://user-images.githubusercontent.com/38221793/58837505-117c9000-865c-11e9-9358-2bd7cc6e6d4d.JPG)

Inverse kinematics on VRep with Octave


![inv](https://user-images.githubusercontent.com/38221793/58837506-117c9000-865c-11e9-936f-03bcef91903b.png)

https://www.behance.net/gallery/81070821/V-Rep
