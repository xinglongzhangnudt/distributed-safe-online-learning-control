function [MSJ1,MCJ1,MSJ12]=sys_process12(ep,u,PresentState1,PresentState2)
global tau;
ep1=ep(1);
ep2=ep(2);
ep3=ep(3);
ep4=ep(4);
u1=u(1);
u2=u(2);
wr=0;
vr=1;
v2=PresentState2(4);
thita2=PresentState2(3);
thita1=PresentState1(3);
% 
% FutureState1=[ ep1 + tau*(ep2*u2 - 2*(vr-ep4) + cos(ep3)*(vr)+cos(thita2-thita1)*(v2));
%                ep2 + tau*(sin(ep3)*(vr)-ep1*u2+sin(thita2-thita1)*(v2));
%                ep3 + tau*(wr-u2);
%                ep4 - tau*(u1)];
MSJ1 = [1, tau*u2, -tau*sin(ep3)*vr-tau*sin(thita2-thita1)*(v2),2*tau;
        -tau*u2, 1, tau*cos(ep3)*vr+tau*cos(thita2-thita1)*(v2),0;
        0,      0,    1,0;
        0,0,0,1];
MCJ1 =[ 0,  ep2*tau;
    0, -ep1*tau;
    0,     -tau;
    -tau,0];
MSJ12 = [0, 0, tau*sin(thita2-thita1)*(v2),-tau*cos(thita2-thita1);
        0, 0, -tau*cos(thita2-thita1)*(v2),-tau*sin(thita2-thita1);
        0,0, 0,0;
        0,0,0,0];