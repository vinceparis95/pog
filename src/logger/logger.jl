module logger

"""
# Logs DataFrame into structs
  - updates struct logs + vars
  - log updated structs into db
take in daylog
for each row :
    if friend is in db:
        sp + append log as column to the matching struct
    if friend is not in db:
        "plant" a new struct in  the db, sp + append log
"""

include("struct.jl")

using .structs
using CSV
using DataFrames
using DBInterface
using MySQL

##########################################################

# UNPACK SAMPLE

sample = DataFrame(CSV.File("src/logger/data/daylog.csv"))
f = []

function unpack(DataFrame)
  for row in eachrow(DataFrame)
    v = vec(convert(Array, row))
    x = friend(v,0.1)
    push!(f, x)
  end
  return f
end

unpack(sample)


##################################################

# structured queries

sq1 = "SHOW COLUMNS FROM pgdb1.aloha;"
sq2 = "CREATE TABLE furniture( item VARCHAR(10));"
sq3 = "INSERT INTO pgdb1.friends VALUES('ziai', 'dorri');"
sq4 = "SELECT first_name, last_name FROM friends;"
##################################################

# SYNC DATABASE

# db connection
dbc = DBInterface.connect(MySQL.Connection,
                            "pgdb-1.cy6onqf2jyfs.us-east-2.rds.amazonaws.com",
                            "admin", "Musonda1991", db="pgdb1")
print(dbc)

# complete some task
function run_sq()
    cur = DBInterface.execute(dbc, sq3)
    cur = DBInterface.execute(dbc, sq4)
    df = DataFrame(cur)
end

run_sq()

##############################################################################

end # module
