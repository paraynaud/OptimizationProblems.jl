
using OptimalControl, CTDirect
using ADNLPModels, NLPModels
using Percival
T = 1
#γ = 3
x0 = 0.1

@def ocp begin
  t ∈ [ 0, T ], time
  x ∈ R, state
  u ∈ R, control
  0 ≤ u(t) ≤ 1
  
  x(0) == x0
  ẋ(t) ==  sin(π * t / T)*u(t)*x(t) #  le nouveau γ peut être défini ici directement, et ainsi varier en fonction de t, i.e. γ(t)

  ∫((1-u(t))*x(t)) → max
end

n = 10
docp = directTranscription(ocp, grid_size=n)