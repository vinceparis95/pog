module structs
using DataFrames

"""
build a MACRO unit
"""


mutable struct friend
    logs::Array
    unity::Float64
end

mutable struct group
    thing::friend
end

mutable struct network
    func::Function
end

export friend, group


end # module
