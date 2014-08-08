function timer_obj=mycalltimerback()
    timer_obj=timer;
    timer_obj.TimerFcn = @timercallback;
    timer_obj.Period = 0.01;
    
   % timer_obj.TasksToExecute = 10; 
    timer_obj.ExecutionMode = 'fixedRate';
    %sensorgroup
    global sensor_obj;
    sensor_obj = sensorgroup('AndroidMobile')
    %3d animation
    global myworld;
    myworld = vrworld('D:\Matlab_Work\3danimation\simple-vrtut3\my3danimation.wrl')
    open(myworld);
    view(myworld);
    vrdrawnow;
    %pause(5);
end
function timercallback(mTimer,~)
    global sensor_obj;
    global myworld;
    %[a, t] = accellog(sensor_obj);
    y=sensor_obj.MagneticField
    x=y*1.0e4
    fprintf('hzq:timer_callback test  %f  %f  %f    \n',y(1),y(2),y(3));
    %whos
   %myworld.B1.rotation = [x(1) x(2) 1 x(3)];
  % myworld.B1.rotation = [1 x(1) x(2) x(3)];
  myworld.B1.rotation = [x(1) x(2) x(3) 1];
end

