model laba_7_1

parameter Real N = 1655;
parameter Real N0 = 18;
Real n( start = N0);

function k
  input Real t;
  output Real result;
algorithm
  result:= 0.48*t;
end k;

function p
  input Real t;
  output Real result;
algorithm
  result:=  0.000081*t;
end p;

equation

der(n)=(k(time)+p(time)*n)*(N-n);

  annotation(experiment(StartTime=No, StopTime=4, Tolerance=1e-6, Interval=0.01));

end laba_7_1;
