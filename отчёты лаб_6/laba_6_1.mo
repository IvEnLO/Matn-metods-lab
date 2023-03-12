model laba_6_1

  parameter Real N(start=11400);
  parameter Real I0(start=250);
  parameter Real R0(start=47);
  parameter Real a( start=0.01);
  parameter Real b( start=0.02);
  parameter Real S0 = N - I0 - R0;
  Real S(start=S0);
  Real I(start=I0);
  Real R(start=R0);
  
equation

  der(S) = 0;
  der(I) = -b*I;
  der(R) = b*I;
  
  annotation(experiment(StartTime=0, StopTime=100, Tolerance=1e-6, Interval=0.01));

end laba_6_1;
