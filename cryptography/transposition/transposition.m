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