function shift()
    str = input('������һ���ַ���:','s');
    key = input('������һ����Կ���֣�');
    action = input('����ִ��ʲô������[E/D]','s');
    [res,flag] = Encoding_or_Decoding(str,key,action);
    if flag == 1 
        disp(res);
    end
    return;
end

function flag = check_key(key)
    flag = 0;
    if length(key) ~=1
        disp('��Կ�ռ䳤�Ȳ��ܳ���1');
        return;
    end
    if key<0 || key>25
        disp('��������ȷ����Կ');
        return;
    end
    flag = 1;
end


function flag = check_space(space)
    flag = 0;
    temp = size(space);
    if temp(1) ~=1
        disp('����/���Ŀռ������һά����');
        return;
    end
    for a = space
        if a-'a'<0 || a-'a' >25
            disp('����/���Ŀռ��к��з���ĸ�ַ�');
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
        disp('��������ȷ��ָ�E����D��');
    end
    return;
end