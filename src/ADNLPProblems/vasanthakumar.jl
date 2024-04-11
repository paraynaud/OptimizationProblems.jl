export function_name

function function_name(; n::Int = 10, type::Type{T} = Float64, kwargs...) where {T} 
  x0 = 0.1
  @def ocp begin
    t ∈ [ 0, 1 ], time
    x ∈ R, state
    u ∈ R, control
    0 ≤ u(t) ≤ 1
    x(0) == x0
    ẋ(t) == t*u(t)*x(t)
    ∫((1-u(t))*x(t)) → max
  end

  docp = directTranscription(ocp, grid_size=n)
  nlp = getNLP(docp)

  return nlp
end