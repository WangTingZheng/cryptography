function [E4,D4] =  phrase()
%本函数实现密
M = 'wangtingzheng'; %======换成自己的名字======
count =length(M);

%设定密钥短语的密钥
key_phrase='aabb'; %=====设置密钥短语===========

end

function res =  Encoding(msg,letter_box)
    count =length(msg);
    for i=1:count%依照字母表加密%
        res(i)=  letter_box(M(i)-'a'+1);%======找到第i位明文M(i)所在位置对应letter_box中字母赋值给E4(i)(MATLAB中计数是从1开始，所以需要加1)=========
    end
    return;
end

function res =  Decoding(cip, letter_box)
    for i = 1:count
        d1 = E4(i);
        d2 =find(letter_box==d1)    ;   %=======找到letter_box中d1所在的位置=======
        D4(i) = d2 + 'a'-1;  
    end
    res = char(D4);
end

function [res,origin_letter_box_res] = deduplication(str, origin_letter_box,key_phrase,key_letter)
    key_count=size(key_phrase);%密钥短语长度%
    %本段程序： 消除密钥短语中重复的字母，并且将在密钥短语中出现的字符从原字母表中取出%
    k=1;
    for i=1:key_count(2)
        signal = 0;
        for j=1:i-1
            if key_phrase(i) == key_phrase(j)       %=====判断第i位的字母key_phrase(i)与前几位字母key_phrase(j)是否相同=======
                signal=1; %若相同设定为1
            end
        end
        if  signal == 0              %======若与前几位都不相同=======
            fkey_phrase(k)= key_phrase(i); %======将不重复的字母key_phrase(i)赋值给fkey_phrase(k)========
            origin_letter_box(fkey_phrase(k)-'a'+1)=' '; %找到该字母在原本字母表中的位置设置为空
            k = k + 1;
        end
    end
    fkey_count = size(fkey_phrase);%去除重复后的密钥短语长度%
    phrase_plus=key_letter-'a';%字母偏移量%
    for i=1:fkey_count(2)
        letter_box(i+phrase_plus) =  fkey_phrase(i) ;%=====将密钥短语中的字母fkey_phrase(i)嵌入字母表letter_box中的前几位=====
    end
    k=1;%将其他字母嵌入字母表%
    for i=1:26
        if (origin_letter_box(i)~=' ') %如果不是空，则说明该字母不是密钥短语中的字母
            target= phrase_plus+fkey_count(2)+k;
            letter_box(target)=origin_letter_box(i);
            k = k+1; 
        end
    end
    origin_letter_box_res = origin_letter_box;
    res = fkey_phrase;
    return;
end