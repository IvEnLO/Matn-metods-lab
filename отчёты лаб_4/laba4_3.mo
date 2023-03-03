model laba4_3

  Real x(start=0.9);
  Real y(start=1.9);
  parameter Real w( start=0.5);
  parameter Real g( start=7);

equation

  der(x)= y;
  der(y)= -w*x-g*y+0.5*sin(0.7*time);
  
  annotation(experiment(StartTime=0, StopTime=56, Tolerance=1e-6, Interval=0.05));

end laba4_3;
