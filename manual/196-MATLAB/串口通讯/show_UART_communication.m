%{
ͨ���жϣ���ȡ�������ݣ���ʾ������ѹ�������ٶȱ仯���ߺ�ĳ���������˲�ǰ���ѹ����������
%}

function myserial_Arduino_interupt


%% ���matlab�Ѿ����˴��ڣ��ر�������ֹռ��
    if ~isempty(instrfind)
         fprintf('�ر��Ѵ򿪴���: \r\n');
         fclose(instrfind);
         delete(instrfind);
    end
    
    
    %% �ж�����
    global s h1_2 h1_1 tt h2_1 h2_2 h2_3 h2_4 h3_1 h3_2 base_t pre_angle pre_angle2
    maxSize = 300;
    subplot 221
    title('�Ƕ�����')
    h1_1  = animatedline('MaximumNumPoints',maxSize,'color','b');
    h1_2  = animatedline('MaximumNumPoints',maxSize,'color','r');
    legend('acc1','acc2')
    subplot 222
    title('���ٶ�����')
    h2_1 = animatedline('MaximumNumPoints',maxSize,'color','b');
    h2_2 = animatedline('MaximumNumPoints',maxSize,'color','r');
    h2_3 = animatedline('MaximumNumPoints',maxSize,'color','g');
    h2_4 = animatedline('MaximumNumPoints',maxSize,'color','y');
    legend('acc1','acc2')
    subplot 223
    title('��������')
    h3_1 = animatedline('MaximumNumPoints',maxSize,'color','b');
    h3_2 = animatedline('MaximumNumPoints',maxSize,'color','r');
    legend('acc1','acc2')

    s = serial('COM34');         %���崮�ڶ���
    set(s,'BaudRate',115200);    %���ò�����,ȱʡ9600bit/s 
    s.parity='none';            %����У��λ����żУ�飬Ĭ��none
    s.stopbits=1;               %����ֹͣλ��Ĭ��1
    s.Terminator='LF';          %�������뻺����Ϊ256b��ȱʡֵ 
    
    % �����ж���Ӧģʽ���С�byte���͡�Terminator������ģʽ��ѡ����byte���Ǵﵽһ���ֽ��������жϣ���Terminator������������ĳ�������¼��������жϣ�
    s.BytesAvailableFcnMode = 'terminator';

    % �򿪴��ڣ����������ͳ�ʼ��
    fopen(s);                  %�򿪴��ڶ���s
    s.BytesAvailableFcn = @ReceiveCallback;
    fprintf('�򿪴���: %s\r\n',s.Port);
    
    %����Ҷ�任�����tt
    tt = -1;
    base_t = 0;0
    
    
    pre_angle = 0;
    pre_angle2 = 0;
end


%% �жϺ���
function ReceiveCallback( ~,~)
    global s h1_2 h1_1 tt h2_1 h2_2 h2_3 h2_4 h3_1 h3_2 base_t pre_angle pre_angle2
    
    b = fgetl(s);
%     b
    b = str2num(b);     %�ú���fget(s)�ӻ�������ȡ�������ݣ���������ֹ�������з���ֹͣ��
                        %������Arduino������Ҫʹ��Serial.println()
                        %����������ֶ��Ǻ��֣����硰����6����������[]

    if( size(b,2)>5 )        %�����Ƿ���[]����Ϊÿ��scanǰ������������֣��ο�arduino�г���
        if(tt == -1)
            base_t = b(1);
        end
        tt = b(1) - base_t;
        addpoints(h1_1,tt,b(2));
        drawnow limitrate;
        addpoints(h2_1,tt,b(3));
        drawnow limitrate;
        addpoints(h3_1,tt,b(6));
        drawnow limitrate;
        
        
        
        addpoints(h1_2,tt,b(4));
        drawnow limitrate;
        addpoints(h2_2,tt,b(5));
        drawnow limitrate;
        addpoints(h3_2,tt,b(7));
        drawnow limitrate;
        
%         addpoints(h2_3,tt,(b(2)-pre_angle)/0.01);
%         addpoints(h2_4,tt,(b(4)-pre_angle2)/0.01);
%         pre_angle = b(2);
%         pre_angle2 = b(4);
       % tt = tt+1;
    end
end

