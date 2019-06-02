clear all;
close all;
vrep=remApiSetup();

simxFinish(-1);

clientID= simxStart('127.0.0.1',19997,true,true,5000,5);

simxSynchronous(clientID,true);

simxStartSimulation(clientID,vrep.simx_opmode_blocking);


if(clientID>-1)
  disp('Octave verbunden');
  [returnCode,ScaraJoint1]=simxGetObjectHandle(clientID,'Scara_J1',vrep.simx_opmode_blocking);
  [returnCode,ScaraJoint2]=simxGetObjectHandle(clientID,'Scara_J2',vrep.simx_opmode_blocking);
  [returnCode,ScaraJoint3]=simxGetObjectHandle(clientID,'Scara_J3',vrep.simx_opmode_blocking);
  [returnCode,Gripper]=simxGetObjectHandle(clientID,'Gripper_J',vrep.simx_opmode_blocking);
  [returnCode,Tcp_Position]=simxGetObjectHandle(clientID,'Scara_tip',vrep.simx_opmode_blocking);
  [returnCode,dummy]=simxGetObjectHandle(clientID,'P1',vrep.simx_opmode_blocking);
  [returnCode,dummy2]=simxGetObjectHandle(clientID,'P2',vrep.simx_opmode_blocking);
  
  [returnCode,point_1]=simxGetObjectPosition(clientID,dummy,-1,vrep.simx_opmode_blocking);
  [returnCode,point_2]=simxGetObjectPosition(clientID,dummy2,-1,vrep.simx_opmode_blocking);
  x=point_1(1);
  y=point_1(2);
  z=point_1(3);
inverse= invScara(x,y,z)
theta1=inverse(1);
theta2=inverse(2);
d3=inverse(3); 
    xx=point_2(1);
  yy=point_2(2);
  zz=point_2(3);
inverse2= invScara(xx,yy,zz)
theta4=inverse2(1);
theta5=inverse2(2);
d6=inverse2(3); 
 teta1= theta4-theta1;
teta2=theta5-theta2;
d1= d6-d3;
[returnCode]=simxSetJointTargetPosition(clientID,Gripper,0,vrep.simx_opmode_blocking);
  a=0:0.1:1;

  for kk=1:length(a)  
    [returnCode]=simxSetJointTargetPosition(clientID,ScaraJoint1,theta1*a(kk),vrep.simx_opmode_blocking);
    [returnCode]=simxSetJointTargetPosition(clientID,ScaraJoint2,theta2*a(kk),vrep.simx_opmode_blocking);
    [returnCode]=simxSetJointTargetPosition(clientID,ScaraJoint3,d3*a(kk),vrep.simx_opmode_blocking);
    pause(0.01)
    [returnCode]=simxSetJointTargetPosition(clientID,Gripper,0,vrep.simx_opmode_blocking);
    simxSynchronousTrigger(clientID);
  end
  b=0:0.1:1;
[returnCode]=simxSetJointTargetPosition(clientID,Gripper,0,vrep.simx_opmode_blocking);
  for ll=1:length(a)  
    [returnCode]=simxSetJointTargetPosition(clientID,ScaraJoint1,theta1+(teta1*b(ll)),vrep.simx_opmode_blocking);
    [returnCode]=simxSetJointTargetPosition(clientID,ScaraJoint2,theta2+(teta2*b(ll)),vrep.simx_opmode_blocking);
    [returnCode]=simxSetJointTargetPosition(clientID,ScaraJoint3,d3+(d1*b(ll)),vrep.simx_opmode_blocking);
    pause(0.01)
    [returnCode]=simxSetJointTargetPosition(clientID,Gripper,0,vrep.simx_opmode_blocking);
    simxSynchronousTrigger(clientID);
  end
 
  [returnCode,End_point]=simxGetObjectPosition(clientID,Tcp_Position,-1,vrep.simx_opmode_blocking);
  printf("[theta1,theta2,d3]=%.2f, %.2f, %.2f\n", theta1, theta2, d3);
  printf("[x,y,z]=[%.4f, %.4f, %.4f]\n", End_point);
  pause(5)
  
  simxStopSimulation(clientID,vrep.simx_opmode_blocking);
  simxFinish(-1);
  
end









