module logger

####################
include("db/que.jl")
include("db/con.jl")
using .que
using .con
using CSV
using DataFrames
using MySQL

##################################################

# SYNC DATABASE

function run_sq()
    cur = DBInterface.execute(dbcB, sq3b)
    cur = DBInterface.execute(dbcB, sq4b)
    df = DataFrame(cur)
end

##################################################

# UNPACK SAMPLE

mutable struct friend2
    logs::Array
    unity::Float64
end

function unpack(DataFrame)
  for row in eachrow(DataFrame)
    v = vec(convert(Array, row))
    x = friend2(v,0.1)
    push!([], x)
  end
  return []
end

##################################################

run_sq()
unpack(DataFrame(CSV.File("/home/vince/lg.csv")))

end # module
