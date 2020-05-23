function virginia(  )
    str = input('������һ���ַ���:','s');
    key = input('������һ����Կ�ַ���:','s');
    action = input('����ִ��ʲô������[E/D]','s');
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
        disp('����/����/��Կ�ռ������һά����');
        return;
    end
    for a = space
        if a-'a'<0 || a-'a' >25
            disp('����/����/��Կ�ռ��к��з���ĸ�ַ�');
            return;
        end
    end
    flag = 1;
end

function [res, flag] = Encoding_or_Decoding(msg, key, action)
    if (check_space(msg) || checkspace(key)) == 0
        return;
    elseif(length(msg)< length(key))
        disp('��Կ�ռ����');
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