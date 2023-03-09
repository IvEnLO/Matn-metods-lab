model laba_5_2

  Real x(start=c/d);
  Real y(start=a/b);
  parameter Real a( start=0.69);
  parameter Real b( start=0.059);
  parameter Real c( start=0.49);
  parameter Real d( start=0.096);
  

equation

  der(x)= -a*x + b*x*y;
  der(y)= c*y - d*x*y;
  
  annotation(experiment(StartTime=0, StopTime=100, Tolerance=1e-6, Interval=0.05));
  
end laba_5_2;
