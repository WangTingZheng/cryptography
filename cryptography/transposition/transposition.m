function transposition()
    str = input('������һ���ַ���:','s');
    key = input('������һ����Կ���顣���ӣ�[1,2,3,4]:');
    action = input('����ִ��ʲô������[E/D]','s');
    [res,flag] =transposition_function(str,key,action);
    if flag == 1 
        disp(res);
    end
    return;
end

function [res,flag] = transposition_function(str, key, action)
    if strcmp(action, 'E') == 1
        [res,flag] = Encoding(str,key);
    elseif strcmp(action, 'D') == 1
        [res,flag] = Decoding(str,key);
    else
        disp('������E��D�����ܺͽ���');
        flag = 0;
        res = 0;
    end
    return;
end


%�������/���Ŀռ�
function res = check_space(str)
    for a = str
        if abs(a)-97 < 0 || abs(a)-97 >25
            res = 0;
            disp('����/���Ŀռ��в���Ӣ����ĸ��Ԫ��');
            return;
        end
    end
    res = 1;
    return;
end


function res = check_key(str)
    str_sorted = sort(str);
    for i=1:size(str)
        if str_sorted(i) ~= i 
            res = 0;
            disp('��Կ�ռ䲻��1-n������');
            return;
        end
    end
    res = 1;
    return;
end


function [res,flag] = Encoding_or_Decoding(msg, key)
    if mod(get_len(msg),get_len(key)) ~=0
        disp('�޷����飬����/���Ŀռ�ĳ��Ȳ�����Կ�ռ��������');
        flag = 0;
        res = 0;
        return;
    end
    time  = get_len(msg)/get_len(key);
    if time ~= 1
        disp(strcat(strcat('�ֳ���',num2str(time)),'��'));
    end
    time_temp = time;
    flag_time = 0;
    res='';
    while time ~= 0
        [res_time,flag_time] = Encoding_or_Decoding_time(msg(1+(time_temp-time)*get_len(key):(time_temp-time+1)*get_len(key)),key);
        if flag_time ~= 0
            res = strcat(res, res_time);
        end
        time = time -1;
    end
    flag = flag_time;
    return;
end
function [res,flag] = Encoding_or_Decoding_time(msg, key)
    if get_len(msg) ~= get_len(key)
        disp('��Կ����������/��Կ�ռ䳤�Ȳ�һ��');
        flag = 0;
        res = 0;
        return;
    end
    
    if check_space(msg) == 0 || check_key(key) == 0 
        flag = 0;
        res = 0;
        return;
    end
    
    for i = 1:get_len(msg)
        res(i) = msg(key(i));
    end
    flag = 1;
    return;
end

function [res] = Inverse(key)
    for i=1:get_len(key)
        res(key(i)) = i;
    end
    return;
end

function [res,flag]  = Encoding(msg, key)
    [res,flag] = Encoding_or_Decoding(msg,key);
    return;
end

function [res,flag] = Decoding(cip,key)
    [key_inverse] = Inverse(key);
    [res,flag] = Encoding_or_Decoding(cip,key_inverse);
end

function res = get_len(data)
    temp = size(data);
    res = temp(2);
end