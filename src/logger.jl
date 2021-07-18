module logger

####################
include("db/que.jl")
include("db/con.jl")
include("kit/structs.jl")
using .que
using .con
using .structs
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

mutable struct friendd
    logs::Array
    unity::Float64
end

# UNPACK SAMPLE
f=[]

function unpack(DataFrame)
  for row in eachrow(DataFrame)
    v = vec(convert(Array, row))
    x = friendd(v,0.1)
    push!(f, x)
  end
  return f
end

##################################################
d = DataFrame(CSV.File("/home/vince/lg.csv"))
run_sq()
unpack(d)

end
