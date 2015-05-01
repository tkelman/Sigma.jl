using Sigma
using AbstractDomains
using Base.Test
x = uniform(0,0,1)
y = uniform(1,0,1)
@test isequal(prob(x+y > - 1.0), Interval(1.0,1.0))

# Conditional probability query
@test isequal(cond_prob(x+y > 1.5, y < 0.5),Interval(0.0,0.0))