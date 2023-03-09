model laba_5_1

  Real x(start=8);
  Real y(start=19);
  parameter Real w( start=0.69);
  parameter Real e( start=0.059);
  parameter Real r( start=0.49);
  parameter Real t( start=0.096);
  

equation

  der(x)= -w*x + e*x*y;
  der(y)= r*y - t*x*y;
  
  annotation(experiment(StartTime=0, StopTime=100, Tolerance=1e-6, Interval=0.05));

end laba_5_1;
