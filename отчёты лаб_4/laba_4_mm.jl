# Вариант 28
using Plots
using DifferentialEquations

x0 = 0.9
y0 = 1.9

function fn_1(du, u, p, t)
    x, y = u
    du[1] = u[2]
    du[2] = -4.7*u[1]
end

function fn_2(du, u, p, t)
    x, y = u
    du[1] = u[2]
    du[2] = -7*u[1] - 0.5*u[2]

end

function fn_3(du, u, p, t)
    x, y = u
    du[1] = u[2]
    du[2] = -0.5*u[1] - 7*u[2] + 0.5*sin(0.7t)

end

v0 = [x0, y0]
tspan = (0, 56)
prob = ODEProblem(fn_1, v0, tspan)
sol = solve(prob, dtmax=0.05)

X1 = [u[1] for u in sol.u]
Y1 = [u[2] for u in sol.u]
T = [t for t in sol.t]

plt = plot(
  dpi=300,
  title="Решение уравнения",
  legend=false)

plot!(
  plt,
  T,
  X1,
  color=:blue)

plot!(
  plt,
  T,
  Y1,
  color=:red)

plt2 = plot(
  dpi=300,
  title="Фазовый портрет",
  legend=false)

plot!(
  plt2,
  X1,
  Y1,
  color=:blue)

v0 = [x0, y0]
tspan = (0, 56)
prob = ODEProblem(fn_2, v0, tspan)
sol = solve(prob, dtmax=0.05)

X2 = [u[1] for u in sol.u]
Y2 = [u[2] for u in sol.u]
T = [t for t in sol.t]

plt3 = plot(
  dpi=300,
  title="Решение уравнения",
  legend=false)

plot!(
  plt3,
  T,
  X2,
  color=:blue)

plot!(
  plt3,
  T,
  Y2,
  color=:red)

plt4 = plot(
  dpi=300,
  title="Фазовый портрет",
  legend=false)

plot!(
  plt4,
  X2,
  Y2,
  color=:blue)

v0 = [x0, y0]
tspan = (0, 56)
prob = ODEProblem(fn_3, v0, tspan)
sol = solve(prob, dtmax=0.05)

X3 = [u[1] for u in sol.u]
Y3 = [u[2] for u in sol.u]
T = [t for t in sol.t]

plt5 = plot(
  dpi=300,
  title="Решение уравнения",
  legend=false)

plot!(
  plt5,
  T,
  X3,
  color=:blue)

plot!(
  plt5,
  T,
  Y3,
  color=:red)

plt6 = plot(
  dpi=300,
  title="Фазовый портрет",
  legend=false)

plot!(
  plt6,
  X3,
  Y3,
  color=:blue)


savefig(plt, "lab04_1_1.png")
savefig(plt2, "lab04_1_2.png")
savefig(plt3, "lab04_2_1.png")
savefig(plt4, "lab04_2_2.png")
savefig(plt5, "lab04_3_1.png")
savefig(plt6, "lab04_3_2.png")