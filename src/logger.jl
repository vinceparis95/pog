module logger

####################
include("db/query.jl")
include("db/conn.jl")
using .query
using .conn
using CSV
using DataFrames
using MySQL

##################################################

# SYNC DATABASE

cur = DBInterface.execute(dbcB, sq3)
df = DataFrame(cur)


##################################################

# extract columns from db or add new column
cur = DBInterface.execute(dbcB, sq4b)
df = DataFrame(cur)
print(df)

mutable struct transformer
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
