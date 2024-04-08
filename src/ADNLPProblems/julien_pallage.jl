export julien_pallage

function julien_pallage(n::Int = 10, T::Float64 = 1.0, x0::Float64 = 0.1 )

    @def ocp begin
        t ∈ [ 0, T ], time
        x ∈ R, state
        u ∈ R, control
        #γ ∈ R, state
        0 ≤ u(t) ≤ 1
        #γ(t) ==(1+ u(t))
        x(0) == x0
        ẋ(t) == (1+u(t))*u(t)*x(t) # 
      
        ∫((1-u(t))x(t)) → max
      end
      
      docp = directTranscription(ocp, grid_size=n)
      
      nlp = getNLP(docp)

      return nlp 

end