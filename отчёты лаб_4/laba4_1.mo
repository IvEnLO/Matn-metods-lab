model laba4_1

  Real x(start=0.9);
  Real y(start=1.9);
  parameter Real w( start=4.7);

equation
  der(x)= y;
  der(y)= -w*x;
  
  annotation(experiment(StartTime=0, StopTime=56, Tolerance=1e-6, Interval=0.05));


end laba4_1;
