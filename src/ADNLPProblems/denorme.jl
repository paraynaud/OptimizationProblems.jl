# Problème défini dans la question 3 du laboratoire 6
#
# Lab 6, Q3
# https://github.com/paraynaud/MTH8408-Hiv24/tree/master/lab6
#


export no_bang_bang_denorme

"Problème défini dans la question 3 du laboratoire 6"
function no_bang_bang_denorme(; n::Int = 10, kwargs...)
    T = 1
    x0 = 0.1
    @def ocp begin
    tf ∈ R, variable
    t ∈ [ 0, T ], time
    x ∈ R, state
    u ∈ R, control
    0 ≤ u(t) ≤ 1
    
    x(0) == x0
    ẋ(t) == u(t)*u(t)*x(t) # le nouveau γ peut être défini ici directement, et ainsi varier en fonction de t, i.e. γ(t)
    ∫((1-u(t))*x(t)) → max
    end
    docp = directTranscription(ocp, grid_size=n)
    # convertir le problème en NLP
    nlp = getNLP(docp)
  return nlp
end

