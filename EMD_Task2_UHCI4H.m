%%EM 1st assignemt 
%%Mohammed Emad , UHCI4H , 23/3/2026
%%DC motor modeling 

%Dc motor parmaeters
v_an = 12; %V, nominal voltage
R_a = 1.27; %Ohm, arm. res.
L_a = 0.000136 ; %H, arm. ind.
kfi = 0.0213; %Vs/rad, torque const.
I_anl = 0.238;%A, no-load current
B_m = (kfi^2*I_anl)/(v_an-R_a*I_anl); %Nms, viscous fr. coeff.
J_m = 25*10^-7; %kgm2, inertia

%load parameters
T_nl = 0 ; %NM no load t.
T_1 = 10*10^-3; %NM ,between n_l and nominal t.
T_n = 38.9*10^-3 ; %NM , nominal t.
T_2 = 100*10^-3 ;%NM , between nominal and stall t.
T_s = 185*10^-3 % NM , stall t.

%Transfer function for Omega output (rad/s)
num1 = [kfi];
denom = [(J_m*L_a) (B_m*L_a+J_m*R_a) (kfi^2+B_m*R_a)];
SYS1 = tf(num1, denom)

%Transfer function for current output (A) 
num2 = [ J_m B_m ;];
SYSTFE = tf(num2, denom)

%TF using feedback command
Num1 = [1];
eDen = [L_a R_a];
mDen = [J_m B_m];
TFe = tf(Num1, eDen);
TFm = tf(Num1, mDen);
kfi1 = tf(kfi);
W1 = TFe * kfi1 * TFm;
W2 = kfi1;

SYS2 = feedback(W1, W2)

%TF from Simulink model, using Model Linearizer (ss - state-space)
%First step: In model linearizer app you must export linsys to Matlab
%workspace

%ss = linsys1;   
%SYS3 = tf(ss)

%ss = linsys2;   
%SYS4 = tf(ss)

%residue command - partial fraction expansion
[r1,p1,k1] = residue(num1,denom)
[r2,p2,k2] = residue(num2,denom)
