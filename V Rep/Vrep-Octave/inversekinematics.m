
vrep=remApiSetup();

simxFinish(-1);

clientID= simxStart('127.0.0.1',19997,true,true,5000,5);

simxSynchronous(clientID,true);

simxStartSimulation(clientID,vrep.simx_opmode_blocking);
% Position Eingabe 
  x=-0.5;
  y=0.58;
  z=0.16;
inverse= invScara(x,y,z)

theta1=inverse(1);
theta2=inverse(2);
d3=inverse(3);      %maximal 0.35

if(clientID>-1)
  disp('Octave verbunden');
  [returnCode,ScaraJoint1]=simxGetObjectHandle(clientID,'Scara_J1',vrep.simx_opmode_blocking);
  [returnCode,ScaraJoint2]=simxGetObjectHandle(clientID,'Scara_J2',vrep.simx_opmode_blocking);
  [returnCode,ScaraJoint3]=simxGetObjectHandle(clientID,'Scara_J3',vrep.simx_opmode_blocking);
  [returnCode,Tcp_Position]=simxGetObjectHandle(clientID,'Scara_tip',vrep.simx_opmode_blocking);
 
  a=0:0.03:1;
  for kk=1:length(a)  
    [returnCode]=simxSetJointTargetPosition(clientID,ScaraJoint1,theta1*a(kk),vrep.simx_opmode_blocking);
    [returnCode]=simxSetJointTargetPosition(clientID,ScaraJoint2,theta2*a(kk),vrep.simx_opmode_blocking);
    [returnCode]=simxSetJointTargetPosition(clientID,ScaraJoint3,d3*a(kk),vrep.simx_opmode_blocking);
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









