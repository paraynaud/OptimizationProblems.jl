aircrfta_meta = Dict(
  :nvar => 10,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => false,
  :name => "SimonMathieu_BergeronH.jl",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => true,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => 0,
  :best_known_upper_bound => 1,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_SimonMathieu_BergeronH_nvar(; n::Integer = default_nvar, kwargs...) = 10
get_SimonMathieu_BergeronH_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_SimonMathieu_BergeronH_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_SimonMathieu_BergeronH_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_SimonMathieu_BergeronH_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_SimonMathieu_BergeronH_nineq(; n::Integer = default_nvar, kwargs...) = 0
