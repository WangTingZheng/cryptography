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