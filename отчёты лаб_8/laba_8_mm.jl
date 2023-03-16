# Вариант 28
using Plots
using DifferentialEquations

Pcr = 35
t1, t2 = 35, 30
p1, p2 = 13.3, 14.5
N = 93
q = 1
M1, M2 = 8, 9
a1 = Pcr / (t1*t1*p1*p1*N*q);
a2 = Pcr / (t2*t2*p2*p2*N*q);
b = Pcr / (t1*t1*t2*t2*p1*p1*p2*p2*N*q);
c1 = (Pcr - p1) / (t1*p1);
c2 = (Pcr - p2) / (t2*p2);
d = 0.00018

function fn_1(du, u, p, t)
    du[1] = u[1]-(b/c1)*u[1]*u[2]-(a1/c1)*u[1]*u[1]
    du[2] = (c2/c1)*u[2]-(b/c1)*u[1]*u[2]-(a2/c1)*u[2]*u[2]
end

function fn_2(du, u, p, t)
    du[1] = u[1]-(b/c1+d)*u[1]*u[2]-(a1/c1)*u[1]*u[1]
    du[2] = (c2/c1)*u[2]-(b/c1)*u[1]*u[2]-(a2/c1)*u[2]*u[2]
end

v0 = [M1,M2]
tspan = (0, 20)
prob = ODEProblem(fn_1, v0, tspan)
sol = solve(prob, dtmax=0.01)
m1 = [u[1] for u in sol.u]
m2 = [u[2] for u in sol.u]
T = [t for t in sol.t]

plt1 = plot(
  dpi=300,
  title="Случай 1",
  legend=false)

plot!(
  plt1,
  T,
  m1,
  color=:blue)

plot!(
  plt1,
  T,
  m2,
  color=:red)



v0 = [M1,M2]
tspan = (0, 20)
prob = ODEProblem(fn_2, v0, tspan)
sol = solve(prob, dtmax=0.01)
m3 = [u[1] for u in sol.u]
m4 = [u[2] for u in sol.u]
T = [t for t in sol.t]

plt2 = plot(
  dpi=300,
  title="Случай 2",
  legend=false)

plot!(
  plt2,
  T,
  m3,
  color=:blue)

plot!(
  plt2,
  T,
  m4,
  color=:red)

savefig(plt1, "Z:/PETON/mm8/lab08_1.png")
savefig(plt2, "Z:/PETON/mm8/lab08_2.png")