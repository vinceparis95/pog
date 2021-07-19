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

cur = DBInterface.execute(dbcB, sq4b)
df = DataFrame(cur)


##################################################

cur = DBInterface.execute(dbcB, sq4b)
df = DataFrame(cur)

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
