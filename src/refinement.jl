# Pre-image Computation:
# ======================

abstract InferenceAlgorithm

abstract PartitionAlgorithm <: InferenceAlgorithm
abstract SamplingAlgorithm <: InferenceAlgorithm
abstract MCMCAlgorithm <: SamplingAlgorithm

@doc "A stop function used as dummy stopping criteria in while loops" ->
neverstop(_...) = true

@doc "Is this box small (enough to be accepted)" ->
function issmall(box::Boxes, precision::Float64)
  for dim in dims(box)
    (measure(box[dim]) > precision)&& return false
  end
  return true
end

for finame in ["partition.jl",
               "chain.jl",
               "aim.jl",
               "bfs.jl"]
  include(joinpath("refinement", finame))
end

SIGMA_SOLVER_ON && include(joinpath("refinement","aimcxx.jl"))
