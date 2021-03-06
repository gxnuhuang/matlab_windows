%在名为 createErgoTimer.m 的文件中创建一个返回计时器对象的函数。在此文件中包含三个局部函数以处理计时器启动、执行和停止任务。

function t = createErgoTimer()
secondsBreak = 30;
secondsBreakInterval = 600;
secondsPerHour = 60^2;
secondsWorkTime = 8*secondsPerHour;

t = timer;
t.UserData = secondsBreak;
t.StartFcn = @ergoTimerStart;
t.TimerFcn = @takeBreak;
t.StopFcn = @ergoTimerCleanup;
t.Period = secondsBreakInterval+secondsBreak;
t.StartDelay = t.Period-secondsBreak;
t.TasksToExecute = ceil(secondsWorkTime/t.Period);
t.ExecutionMode = 'fixedSpacing';
end 
%使用 StartDelay 可以先启动计时器，而不提示您立即休息。将执行模式设置为 'fixedSpacing'，使完成 TimerFcn 执行花费的时间为 10 分 30 秒 (t.Period)。这样，您就可以在下一个 10 分钟间隔开始为自己留出 30 秒的休息时间。
%
%在 createErgoTimer.m 文件中，添加一个局部函数来处理与启动计时器关联的任务。默认情况下，timer 对象将其自身和事件数据传递给回调函数。该函数会忽略事件数据。

function ergoTimerStart(mTimer,~)
secondsPerMinute = 60;
secondsPerHour = 60*secondsPerMinute;
str1 = 'Starting Ergonomic Break Timer.  ';
str2 = sprintf('For the next %d hours you will be notified',...
    round(mTimer.TasksToExecute*(mTimer.Period + ...
    mTimer.UserData)/secondsPerHour));
str3 = sprintf(' to take a %d second break every %d minutes.',...
    mTimer.UserData, (mTimer.Period - ...
    mTimer.UserData)/secondsPerMinute);
disp([str1 str2 str3]);
end
%添加一个局部函数来处理与执行计时器关联的任务。TimerFcn 回调应指示您休息 30 秒钟。

function takeBreak(mTimer,~)
disp('Take a 30 second break.')
end
%添加一个局部函数来处理与停止计时器关联的任务。

function ergoTimerCleanup(mTimer,~)
disp('Stopping Ergonomic Break Timer.');
delete(mTimer)
end
%删除计时器对象会将其从内存中移除。

%在命令行中，调用 createErgoTimer 函数以创建和启动计时器。

t = createErgoTimer;
start(t)
Starting Ergonomic Break Timer.  For the next 8 hours you will be notified to take a 30 second break every 10 minutes.
%系统会每 10 分钟提醒您休息 30 秒钟。

%Take a break.
%您可以使计时器在 8 小时内保持运行，或者将其手动停止。记得您在 StopFcn 回调中包含了将计时器从内存中删除的任务。

stop(t)
%Stopping Ergonomic Break Timer.