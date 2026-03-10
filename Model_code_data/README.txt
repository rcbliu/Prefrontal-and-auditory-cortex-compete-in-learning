
%cno_mpfc2--performance data

%Fit data to 3 models
Fit_Model_chemo_control

%Evaluate models, get rmsd
Eva_chemo_control_mod

%Compare models, Simulation example, Illustration
Model_Figure_final.m

%Simulate CNO effect in mPFC
sim_CNO_mult.m

%Simulate CNO effect in ACx during learning
sim_cno_ac_learn_boot2.m

%Simulate CNO effect in ACx during Post-CNO test
sim_post_learn_boot.m