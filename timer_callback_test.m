%����Ϊ createErgoTimer.m ���ļ��д���һ�����ؼ�ʱ������ĺ������ڴ��ļ��а��������ֲ������Դ����ʱ��������ִ�к�ֹͣ����

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
%ʹ�� StartDelay ������������ʱ����������ʾ��������Ϣ����ִ��ģʽ����Ϊ 'fixedSpacing'��ʹ��� TimerFcn ִ�л��ѵ�ʱ��Ϊ 10 �� 30 �� (t.Period)�����������Ϳ�������һ�� 10 ���Ӽ����ʼΪ�Լ����� 30 �����Ϣʱ�䡣
%
%�� createErgoTimer.m �ļ��У����һ���ֲ�������������������ʱ������������Ĭ������£�timer ������������¼����ݴ��ݸ��ص��������ú���������¼����ݡ�

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
%���һ���ֲ�������������ִ�м�ʱ������������TimerFcn �ص�Ӧָʾ����Ϣ 30 ���ӡ�

function takeBreak(mTimer,~)
disp('Take a 30 second break.')
end
%���һ���ֲ�������������ֹͣ��ʱ������������

function ergoTimerCleanup(mTimer,~)
disp('Stopping Ergonomic Break Timer.');
delete(mTimer)
end
%ɾ����ʱ������Ὣ����ڴ����Ƴ���

%���������У����� createErgoTimer �����Դ�����������ʱ����

t = createErgoTimer;
start(t)
Starting Ergonomic Break Timer.  For the next 8 hours you will be notified to take a 30 second break every 10 minutes.
%ϵͳ��ÿ 10 ������������Ϣ 30 ���ӡ�

%Take a break.
%������ʹ��ʱ���� 8 Сʱ�ڱ������У����߽����ֶ�ֹͣ���ǵ����� StopFcn �ص��а����˽���ʱ�����ڴ���ɾ��������

stop(t)
%Stopping Ergonomic Break Timer.