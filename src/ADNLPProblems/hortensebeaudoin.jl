# Full name of the problem (while function_name could be an abbreviation)
#
# Source of the problem
# Don't hesitate to put more than one source if it is mentioned elsewhere
#
# CUTEst classification (if available)
#
# other information related to the problem
#

export function_name

"Problem created during the MTH8408 Class by HB"
function function_name(; n::Int = 10)
    nlp = Model()
    T = 1
    x0 = 0.1
    
    @def ocp begin
      tf ∈ R, variable
      t ∈ [ 0,T ], time
      x ∈ R, state
      u ∈ R, control
      0 ≤ u(t) ≤ 1
      
      x(0) == x0
      ẋ(t) == (t^2)*u(t)*x(t) # le nouveau γ peut être défini ici directement, et ainsi varier en fonction de t, i.e. γ(t)
    
      ∫((1-u(t))*x(t)) → max
    end

    docp = directTranscription(ocp, grid_size=n) 
    nlp = getNLP(docp)
    
  return nlp
end
