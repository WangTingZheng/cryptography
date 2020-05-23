function virginia(  )
    str = input('请输入一个字符串:','s');
    key = input('请输入一个密钥字符串:','s');
    action = input('你想执行什么操作？[E/D]','s');
    [res,flag] = Encoding_or_Decoding(str,key,action);
    if flag == 1 
        disp(res);
    end
    return;
end


function flag = check_space(space)
    flag = 0;
    temp = size(space);
    if temp(1) ~=1
        disp('明文/密文/密钥空间必须是一维矩阵');
        return;
    end
    for a = space
        if a-'a'<0 || a-'a' >25
            disp('明文/密文/密钥空间中含有非字母字符');
            return;
        end
    end
    flag = 1;
end

function [res, flag] = Encoding_or_Decoding(msg, key, action)
    if (check_space(msg) || checkspace(key)) == 0
        return;
    elseif(length(msg)< length(key))
        disp('密钥空间过长');
        return;
    end
    
    msg_length = length(msg);
    key_length = length(key);
    time = fix(msg_length/key_length);
    left = mod(msg_length, key_length);
    if strcmp(action,'E')==1
        for i =1:time
            group  = msg((i-1)*key_length+1:i* key_length);
            comp((i-1)*key_length+1:i*key_length) = mod(group - 'a'+(key - 'a'),26);
        end
        after = mod(msg(time*key_length+1:end)-'a'+key(1:left)-'a',26);
    elseif(strcmp(action,'D')==1)
        for i =1:time
            group  = msg((i-1)*key_length+1:i* key_length);
            comp((i-1)*key_length+1:i*key_length) = mod(group - 'a'-(key - 'a'),26);
        end
        after = mod(msg(time*key_length+1:end)-'a'-(key(1:left)-'a'),26);
    else
        flag = 0;
        res = 0;
        return;
    end

    temp = char([comp, after]);
    res = char(temp+'a');
    flag = 1;
end