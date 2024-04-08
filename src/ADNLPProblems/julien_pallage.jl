export julien_pallage
using OptimalControl, Plots, JSOSolvers, NLPModels, ADNLPModels, Percival, Percival, NLPModelsModifiers, CTDirect, NLPModelsIpopt

function julien_pallage(n::Int = 10, T::Float64 = 1.0, x0::Float64 = 0.1 )

    @def ocp begin
        t ∈ [ 0, T ], time
        x ∈ R, state
        u ∈ R, control
        0 ≤ u(t) ≤ 1
        x(0) == x0
        ẋ(t) == (1+u(t))*u(t)*x(t) # 
      
        ∫((1-u(t))x(t)) → max
      end
      
      docp = directTranscription(ocp, grid_size=n)
      
      nlp = getNLP(docp)

      return nlp 

end