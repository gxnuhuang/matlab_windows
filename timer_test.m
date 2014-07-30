x=1;
mytime_obj=timer('TimerFcn','disp(x);x=x+1;','Period', 1, 'ExecutionMode', 'fixedSpacing','TasksToExecute', 10);
start(mytime_obj);
if isvalid(mytime_obj)
    fprintf('timer is live\n');
end