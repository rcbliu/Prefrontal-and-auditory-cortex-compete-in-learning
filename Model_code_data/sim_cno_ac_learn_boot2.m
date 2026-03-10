%
%%
% spid=[];
% for j=1:1000
%     a=(1:39)';
%     spid=[spid;a];
% end
%
% simLearnAnimID=cell(1000,1);
% for i=1:1000
%     x=spid(randperm(length(spid)));
%     x=x(1:39);
%     simLearnAnimID{i}=x;
% end
% save('simLearnAnimID','simLearnAnimID');

%%

%Simulate experimental derived CNO effect levels
clear all
load ac_cno_effect
perfdayall=perfdayall*100;
load mod2lp_control_result
load simLearnAnimID;
load model_chem_control.mat

parm_results2=parm_results;
parm_results2(:,2:4)=parm_results2(:,2:4)/10e7;

tic
simLearnBoot=cell(30,1000);
cnoeffect=(0.61:0.01:0.90);
for rep=1:1000
    animid=simLearnAnimID{rep};
    for j=1:30
        
        perfanim=zeros(39,1);
        weight2=cell(39,2);
        for qq=1:39
            id=animid(qq);
%             qq=parm_results(id,1);
            param=parm_results(id,2:5);
            Disc=parm_results(id,end);
            ResModData=modeldata{id,1};
            
            param(:,1:3)=param(:,1:3)/10e7;
            delta1=param(1);
            spw=param(2);
            delta2=param(3);
            aw=0;
            side=ResModData(:,1);
            choice=ResModData(:,2);
            perf=ResModData(:,3);
            day=ResModData(:,4);
            
            [perf_s awhist spwhist choice_s audp]=model_CNO(delta1,delta2,aw,spw,side,cnoeffect(j));
            
            awhist1=awhist;
            spwhist1=spwhist;
            perf_s=double(perf_s);
            
            pfsd=zeros(8,1);
            for d=1:8;
                
                
                row=find(day==d);
                if isempty(row)
                    continue
                end
                pfs=perf_s(row,1);
                pfs=sum(perf_s(row,1))/length(row);
                pfsd(d)=pfs;
 
            end
            pfsd(find(pfsd==0),:)=[];
            perfanim(qq)=mean(100*pfsd);
            %
        end
        
        simLearnBoot{j,rep}=perfanim;
    end
end
toc
%  save('simLearnBoot_2','simLearnBoot')
