
vrep=remApiSetup();

simxFinish(-1);

clientID=simxStart('127.0.0.1',19997,true,true,5000,5);

simxSynchronous(clientID,true);

simxStartSimulation(clientID,vrep.simx_opmode_blocking);

if(clientID>-1)
   disp('Octave mit V-REP verbunden');
   [returnCode,KukaJoint2]=simxGetObjectHandle(clientID,'LBR_iiwa_14_R820_joint2',vrep.simx_opmode_blocking);
   
   Joint2=0:.01:pi/2;
   for kk=1:length(Joint2)
     
   [returnCode]=simxSetJointTargetPosition(clientID,KukaJoint2,Joint2(kk), vrep.simx_opmode_blocking);
     pause(.01)
   simxSynchronousTrigger(clientID);
   end
   simxStopSimulation(clientID,vrep.simx_opmode_blocking);
   simxFinish(-1);
   
 end
 