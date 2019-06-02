
vrep=remApiSetup();

simxFinish(-1);

clientID= simxStart('127.0.0.1',19997,true,true,5000,5);

simxSynchronous(clientID,true);

simxStartSimulation(clientID,vrep.simx_opmode_blocking);

theta1=1.57;
theta2=1.57;
d3=0.25;      %maximal 0.35

if(clientID>-1)
  disp('Octave verbunden');
  [returnCode,ScaraJoint1]=simxGetObjectHandle(clientID,'Scara_J1',vrep.simx_opmode_blocking);
  [returnCode,ScaraJoint2]=simxGetObjectHandle(clientID,'Scara_J2',vrep.simx_opmode_blocking);
  [returnCode,ScaraJoint3]=simxGetObjectHandle(clientID,'Scara_J3',vrep.simx_opmode_blocking);
  [returnCode,Joint1]=simxGetObjectHandle(clientID,'J1_resp',vrep.simx_opmode_blocking);
  [returnCode,Joint2]=simxGetObjectHandle(clientID,'J2_resp',vrep.simx_opmode_blocking);
  [returnCode,Joint3]=simxGetObjectHandle(clientID,'J3_resp',vrep.simx_opmode_blocking);
  [returnCode,Tcp_Position]=simxGetObjectHandle(clientID,'Scara_tip',vrep.simx_opmode_blocking);
 
  x=0:0.03:1;
  for kk=1:length(x)  
    [returnCode]=simxSetJointTargetPosition(clientID,ScaraJoint1,theta1*x(kk),vrep.simx_opmode_blocking);
    [returnCode]=simxSetJointTargetPosition(clientID,ScaraJoint2,theta2*x(kk),vrep.simx_opmode_blocking);
    [returnCode]=simxSetJointTargetPosition(clientID,ScaraJoint3,d3*x(kk),vrep.simx_opmode_blocking);
    pause(0.01)
    simxSynchronousTrigger(clientID);
  end
  [returnCode,End_point]=simxGetObjectPosition(clientID,Tcp_Position,-1,vrep.simx_opmode_blocking);

  printf("[theta1,theta2,d3]=%.2f, %.2f, %.2f\n", theta1, theta2, d3);
  printf("[x,y,z]=[%.4f, %.4f, %.4f]\n", End_point);
  pause(5)
  
  simxStopSimulation(clientID,vrep.simx_opmode_blocking);
  simxFinish(-1);
  
end









