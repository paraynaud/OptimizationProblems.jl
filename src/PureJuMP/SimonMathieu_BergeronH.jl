# Full name of the problem (while function_name could be an abbreviation)

export nonbangbang_SimonMbergeronH.jl

"Non bangbang control of investor problem"
function SimonMathieu_BergeronH(; n::Int = 10)
    T = 1
    x0 = 0.1
    
    @def ocp begin
    t ∈ [ 0, T ], time
    x ∈ R, state
    u ∈ R, control
    0 ≤ u(t) ≤ 1
    
    x(0) == x0
    ẋ(t) == 1*(u(t)-1)*u(t)*x(t) 
    
    ∫( (1-u(t))*x(t) ) → max
    end
    
    docp = DirectTranscription(ocp, grid_size=n)
    nlp = getNLP(docp)
    
    return nlp
end