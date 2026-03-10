function [perf_s awhist spwhist choice_s audp]=model_CNO(delta1,delta2,aw,spw,side,cnoeffect);

perf_s=[];
choice_s=[];
awhist=aw;
spwhist=spw;
audp=[];
for i=1:length(side);

    
    percept_rate=binornd(1,cnoeffect);
    p=aw/(aw+spw);
    audp=[audp;p];
    awspw=binornd(1,p);
    if awspw==1;
        if percept_rate==1;
            act=side(i);
        else
            act=~side(i);
        end
    else
        if i>1
            act=side(i-1);
        else
            act=randi([0, 1]);
        end
    end
    
    outcome=abs(act-side(i)) ;%if 1 wrong, if 0 correct
    perf_s=[perf_s;outcome];
    choice_s=[choice_s;act];
    %update spatial weight
    if i>1
        
        altside=abs(side(i)-side(i-1)); %if 1 alt, if 0 ss
        
        if outcome==0 %correct
            if aw<1
                if percept_rate==1;
                    aw=aw+delta1; %if correct alt trial, aw + delta1
                end
                spw=spw-delta1;  %if correct spw - delta1
            end
            if altside==0&spw<1
                spw=spw+delta1;  %if correct & ss, spw + delta
            end
            
            
            
        else
            if aw<1
                if percept_rate==1;
                    aw=aw+delta2; %if wrong, aw + small delta
                end
            end
            if altside==0 &spw>0
                spw=spw-delta1;  %if wrong & ss, spw - delta
            end
        end
    end
    
    
    awhist=[awhist;aw];
    spwhist=[spwhist;spw];
    
end


perf_s=~perf_s;
% figure;plot(cumsum(perf_s))

