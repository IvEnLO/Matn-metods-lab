# Вариант 28
using Plots
using DifferentialEquations

N = 11400
I0 = 250
R0 = 47
a = 0.01
b = 0.02
S0 = N - I0 - R0

function fn_1(du, u, p, t)
    S0 , I0, R0 = u
    du[1] = 0
    du[2] = -b*u[2]
    du[3] = b*u[2]
end

function fn_2(du, u, p, t)
    S0, I0, R0 = u
    du[1] = -a*u[1]
    du[2] = a*u[1] - b*u[2]
    du[3] = b*u[2]
end

v0 = [S0, I0, R0]
tspan = (0, 100)
prob = ODEProblem(fn_1, v0, tspan)
sol = solve(prob, dtmax=0.01)

S = [u[1] for u in sol.u]
I = [u[2] for u in sol.u]
R = [u[3] for u in sol.u]
T = [t for t in sol.t]

plt = plot(
  dpi=300,
  title="Решение уравнения",
  legend=false)

plot!(
  plt,
  T,
  S,
  color=:blue)

plot!(
  plt,
  T,
  I,
  color=:red)

  plot!(
  plt,
  T,
  R,
  color=:green)

v0 = [S0, I0, R0]
tspan = (0, 100)
prob = ODEProblem(fn_2, v0, tspan)
sol = solve(prob, dtmax=0.01)

S = [u[1] for u in sol.u]
I = [u[2] for u in sol.u]
R = [u[3] for u in sol.u]
T = [t for t in sol.t]

plt2 = plot(
  dpi=300,
  title="Решение уравнения",
  legend=false)

plot!(
  plt2,
  T,
  S,
  color=:blue)

plot!(
  plt2,
  T,
  I,
  color=:red)

  plot!(
  plt2,
  T,
  R,
  color=:green)


  savefig(plt, "lab06_1.png")
  savefig(plt2, "lab06_2.png")