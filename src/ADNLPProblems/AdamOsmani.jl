# Full name of the problem (while function_name could be an abbreviation)
#
# Source of the problem
# Don't hesitate to put more than one source if it is mentioned elsewhere
#
# CUTEst classification (if available)
#
# other information related to the problem
#

export AdamOsmani

function AdamOsmani(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T} 
    T = 1
    # γ = ...
    x0 = 0.1
    
    @def ocp begin
      t ∈ [ 0, T ], time
      x ∈ R, state
      u ∈ R, control
      0 ≤ u(t) ≤ 1
      
      x(0) == x0
      ẋ(t) == t^2 * u(t) * x(t) #  # le nouveau γ peut être défini ici directement, et ainsi varier en fonction de t, i.e. γ(t)
    
      ∫((1- u(t)) * x(t)) → max
    end
    f = ocp
    x0 = 0
    nlp = ADNLPModels.ADNLPModel(f, x0, name = "AdamOsmani")
  return nlp
end