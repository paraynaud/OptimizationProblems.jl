export no_bang_bang

"Problème non bang bang du laboratoire 6"
 function no_bang_bang(n::Int = 10)
     T = 1
     x0 = 0.1
     @def ocp begin
     tf ∈ R, variable
     t ∈ [ 0, T ], time
     x ∈ R, state
     u ∈ R, control
     0 ≤ u(t) ≤ 1

     x(0) == x0
     ẋ(t) == u(t)*u(t)*x(t) # on choisit γ(t) = u(t) pour avoir le caractère non bang bang
     ∫((1-u(t))*x(t)) → max
     end
     docp = directTranscription(ocp, grid_size=n)
     # convertir le problème en NLP
     nlp = getNLP(docp)
   return nlp
 end
