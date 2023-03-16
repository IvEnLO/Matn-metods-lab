model laba_8_2

parameter Real p_cr = 35;
parameter Real t1 = 35;
parameter Real p1 = 13.3;
parameter Real t2 = 30;
parameter Real p2 = 14.5;
parameter Real N = 93;
parameter Real q = 1; 

parameter Real a1 = p_cr/(t1*t1*p1*p1*N*q);
parameter Real a2 = p_cr/(t2*t2*p2*p2*N*q);
parameter Real b = p_cr/(t1*t1*t2*t2*p1*p1*p2*p2*N*q);
parameter Real c1 = (p_cr-p1)/(t1*p1);
parameter Real c2 = (p_cr-p2)/(t2*p2);

parameter Real d = 0.00018;

Real M1(start=8);
Real M2(start=9);

equation

der(M1) = M1-(b/c1+d)*M1*M2-(a1/c1)*M1*M1;
der(M2) = (c2/c1)*M2-(b/c1)*M1*M2-(a2/c1)*M2*M2;



  annotation(experiment(StartTime=0, StopTime=20, Tolerance=1e-6, Interval=0.01));
  
end laba_8_2;
