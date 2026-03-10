

% spid=[];
% for j=1:1000
%     a=(1:11)';
%     spid=[spid;a];
% end
%
% simPostCNOAnimID=cell(1000,1);
% for i=1:1000
%     x=spid(randperm(length(spid)));
%     x=x(1:11);
%     simPostCNOAnimID{i}=x;
% end
% save('simPostCNOAnimID','simPostCNOAnimID');

%%

load postlearnmodeldata.mat
load param2
load simPostCNOAnimID
cnoeffect=(0.61:0.01:0.90);
tic
simPostCNOBoot=cell(30,1000);
for rep=1:1000
    animid=simPostCNOAnimID{rep};
    for j=1:30
        perfanim=zeros(11,1);
        for qq=1:11
            id=animid(qq);
            aw=param2(id,2);
            spw=param2(id,3);
            delta1=param2(id,4);
            delta2=param2(id,5);
            side=cnotest{id};
            side=side(:,5);
            [perf_s awhist spwhist choice_s audp]=model_CNO(delta1,delta2,aw,spw,side,cnoeffect(j));
            pf=sum(perf_s)/length(perf_s);
            perfanim(qq)=mean(100*pf);
        end
        simPostCNOBoot{j,rep}=perfanim;
    end
end
toc
% save('simPostCNOBoot','simPostCNOBoot')