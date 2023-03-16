# Вариант 28
using Plots
using DifferentialEquations

N = 1655
N0 = 18

function fn_1(du, u, p, t)
    du[1] = (0.48*t + 0.000081*t*u[1])*(N-u[1])
end

function fn_2(du, u, p, t)
    du[1] = (0.000049*t + 0.82*t*u[1])*(N-u[1])
end

function fn_3(du, u, p, t)
    du[1] = (0.6*t + 0.3*sin(3*t)*u[1])*(N-u[1])
end

v0 = [N0]
tspan = (0, 4)
prob = ODEProblem(fn_1, v0, tspan)
sol = solve(prob, dtmax=0.001)

N1 = [u[1] for u in sol.u]
T = [t for t in sol.t]

plt = plot(
  dpi=300,
  title="Случай 1",
  legend=false)

plot!(
  plt,
  T,
  N1,
  color=:blue)

v0 = [N0]
tspan = (0, 4)
prob = ODEProblem(fn_2, v0, tspan)
sol = solve(prob, dtmax=0.001)

N2 = [u[1] for u in sol.u]
T = [t for t in sol.t]

plt2 = plot(
  dpi=300,
  title="Случай 2",
  legend=false)

plot!(
  plt2,
  T,
  N2,
  color=:blue)

v0 = [N0]
tspan = (0, 4)
prob = ODEProblem(fn_3, v0, tspan)
sol = solve(prob, dtmax=0.001)

N3 = [u[1] for u in sol.u]
T = [t for t in sol.t]

plt3 = plot(
  dpi=300,
  title="Случай 3",
  legend=false)

plot!(
  plt3,
  T,
  N3,
  color=:blue)

savefig(plt, "Z:/PETON/mm7/lab07_1.png")
savefig(plt2, "Z:/PETON/mm7/lab07_2.png")
savefig(plt3, "Z:/PETON/mm7/lab07_3.png")
