function [E4,D4] =phrase()
%������ʵ����
M = 'wangtingzheng'; %======�����Լ�������======
count =length(M);

%�趨��Կ�������Կ
key_phrase='aabb'; %=====������Կ����=========
key_letter='a'; %ƫ������ԭ�㷨û�У�

%==�����滻��======
key_count=size(key_phrase);%��Կ���ﳤ��%
origin_letter_box='abcdefghijklmnopqrstuvwxyz';%ԭ������ĸ��%


%���γ��� ������Կ�������ظ�����ĸ�����ҽ�����Կ�����г��ֵ��ַ���ԭ��ĸ����ȡ��%
k=1;
for i=1:key_count(2)
    signal = 0;
    for j=1:i-1
        if key_phrase(i) == key_phrase(j)       %=====�жϵ�iλ����ĸkey_phrase(i)��ǰ��λ��ĸkey_phrase(j)�Ƿ���ͬ=======
            signal=1; %����ͬ�趨Ϊ1
        end
    end
    if  signal == 0              %======����ǰ��λ������ͬ=======
        fkey_phrase(k)= key_phrase(i); %======�����ظ�����ĸkey_phrase(i)��ֵ��fkey_phrase(k)========
        origin_letter_box(fkey_phrase(k)-'a'+1)=' '; %�ҵ�����ĸ��ԭ����ĸ���е�λ������Ϊ��
        k = k + 1;
    end
end
fkey_count = size(fkey_phrase);%ȥ���ظ������Կ���ﳤ��%
phrase_plus=key_letter-'a';%��ĸƫ����%
for i=1:fkey_count(2)
    letter_box(i+phrase_plus) =  fkey_phrase(i) ;%=====����Կ�����е���ĸfkey_phrase(i)Ƕ����ĸ��letter_box�е�ǰ��λ=====
end


k=1;%��������ĸǶ����ĸ��%
for i=1:26
    if (origin_letter_box(i)~=' ') %������ǿգ���˵������ĸ������Կ�����е���ĸ
        target= phrase_plus+fkey_count(2)+k;
        letter_box(target)=origin_letter_box(i);
        k = k+1; 
    end
end

%====����====
for i=1:count%������ĸ������%
    E4(i)=  letter_box(M(i)-'a'+1);%======�ҵ���iλ����M(i)����λ�ö�Ӧletter_box����ĸ��ֵ��E4(i)(MATLAB�м����Ǵ�1��ʼ��������Ҫ��1)=========
end
miwen = E4
    
%====����=====
for i = 1:count
    d1 = E4(i);
    d2 =find(letter_box==d1)    ;   %=======�ҵ�letter_box��d1���ڵ�λ��=======
    D4(i) = d2+'a'-1;  
end
mingwen = char(D4)