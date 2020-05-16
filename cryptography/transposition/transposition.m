function transposition()
    str = input('请输入一个字符串:','s');
    key = input('请输入一个密钥数组。例子：[1,2,3,4]:');
    action = input('你想执行什么操作？[E/D]','s');
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
        disp('请输入E或D来加密和解密');
        flag = 0;
        res = 0;
    end
    return;
end


%检查明文/密文空间
function res = check_space(str)
    for a = str
        if abs(a)-97 < 0 || abs(a)-97 >25
            res = 0;
            disp('明文/密文空间有不是英文字母的元素');
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
            disp('密钥空间不是1-n的序列');
            return;
        end
    end
    res = 1;
    return;
end


function [res,flag] = Encoding_or_Decoding(msg, key)
    if mod(get_len(msg),get_len(key)) ~=0
        disp('无法分组，明文/密文空间的长度不是密钥空间的整数倍');
        flag = 0;
        res = 0;
        return;
    end
    time  = get_len(msg)/get_len(key);
    if time ~= 1
        disp(strcat(strcat('分成了',num2str(time)),'组'));
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
        disp('密钥长度与明文/密钥空间长度不一致');
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