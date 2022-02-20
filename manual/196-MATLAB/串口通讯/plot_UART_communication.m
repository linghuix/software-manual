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
    global s n linedata_last line
    maxSize = 300;
    n = 0;
    linedata_last = zeros(1,50);
    
    title('�����������ߣ��������Ϊ10')
    h1_1  = animatedline('MaximumNumPoints',maxSize,'color','b');
    h1_2  = animatedline('MaximumNumPoints',maxSize,'color','r');
    h1_3  = animatedline('MaximumNumPoints',maxSize,'color','y');
    h1_4  = animatedline('MaximumNumPoints',maxSize,'color','k');
    h1_5  = animatedline('MaximumNumPoints',maxSize,'color','c');
    h1_6  = animatedline('MaximumNumPoints',maxSize,'color','g');
    h1_7  = animatedline('MaximumNumPoints',maxSize,'color','b','LineStyle','--');
    h1_8  = animatedline('MaximumNumPoints',maxSize,'color','r','LineStyle','--');
    h1_9  = animatedline('MaximumNumPoints',maxSize,'color','y','LineStyle','--');
    h1_10  = animatedline('MaximumNumPoints',maxSize,'color','k','LineStyle','--');
    line = [h1_1 h1_2 h1_3 h1_4 h1_5 h1_6 h1_7 h1_8 h1_9 h1_10]
    legend('show')

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
    
end


%% �жϺ���
function ReceiveCallback( ~,~)
    global s n linedata_last line
    
    b = fgetl(s);
    b = str2num(b);     %�ú���fget(s)�ӻ�������ȡ�������ݣ���������ֹ�������з���ֹͣ��
                        %������Arduino������Ҫʹ��Serial.println()
                        %����������ֶ��Ǻ��֣����硰����6����������[]
    
    if( length(b) > 0 )   %�����Ƿ���[]����Ϊÿ��scanǰ������������֣��ο�arduino�г���
        for Num = 1:length(b)
            n = n + 1;
            b(Num) = 0.8*linedata_last(Num)+0.2*b(Num);
            linedata_last(Num) = b(Num);
            addpoints(line(Num),n,b(Num));
        end
    end
end

