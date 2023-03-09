# Вариант 28
using Plots
using DifferentialEquations

x0 = 8
y0 = 19
a = 0.69
b = 0.059
c = 0.49
d = 0.096
x1 = c/d
y1 = a/b

function fn_1(du, u, p, t)
    x, y = u
    du[1] = -a*u[1] + b*u[1]*u[2]
    du[2] = c*u[2] - d*u[1]*u[2]
end

function fn_2(du, u, p, t)
    x1 = c/d
    y2 = a/b
    x, y = u
    du[1] = -a*u[1] + b*u[1]*u[2]
    du[2] = c*u[2] - d*u[1]*u[2]
end

v0 = [x0, y0]
tspan = (0, 100)
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

v1 = [x1, y1]
tspan = (0, 100)
prob = ODEProblem(fn_2, v1, tspan)
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

savefig(plt, "lab05_1_1.png")
savefig(plt2, "lab05_1_2.png")
savefig(plt3, "lab05_2_1.png")
savefig(plt4, "lab05_2_2.png")
print(x1,"  ",y1)


