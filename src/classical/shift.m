function shift()
    str = input('请输入一个字符串:','s');
    key = input('请输入一个密钥数字：');
    action = input('你想执行什么操作？[E/D]','s');
    [res,flag] = Encoding_or_Decoding(str,key,action);
    if flag == 1 
        disp(res);
    end
    return;
end

function flag = check_key(key)
    flag = 0;
    if length(key) ~=1
        disp('密钥空间长度不能超过1');
        return;
    end
    if key<0 || key>25
        disp('请输入正确的密钥');
        return;
    end
    flag = 1;
end


function flag = check_space(space)
    flag = 0;
    temp = size(space);
    if temp(1) ~=1
        disp('明文/密文空间必须是一维矩阵');
        return;
    end
    for a = space
        if a-'a'<0 || a-'a' >25
            disp('明文/密文空间中含有非字母字符');
            return;
        end
    end
    flag = 1;
end
function [res,flag] = Encoding_or_Decoding(str, key, action)
    flag = check_key(key) && check_space(str);
    if flag == 0
        res = 0;
        return;
    end
    if strcmp(action, 'D') == 1
        res = char(mod(str-'a'-key,26)+'a');
    elseif(strcmp(action,'E')==1)
        res = char(mod(str-'a'+key,26)+'a');
    else
        res = 0;
        flag = 0;
        disp('请输入正确的指令（E或者D）');
    end
    return;
end