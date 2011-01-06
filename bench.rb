$:.unshift File.join(File.dirname(__FILE__), "lib")

require "benchmark"
require "fsck/deep"

N = 1_000

Benchmark.bmbm(10) do |r|
  r.report("vanilla") { N.times { 42.succ } }
  r.report("fscked") { N.times { 42.gimme_succ_please } }
end

# v0.0.4
# Rehearsal ---------------------------------------------
# vanilla     0.000000   0.000000   0.000000 (  0.000163)
# fscked      0.000000   0.000000   0.000000 (  0.003473)
# ------------------------------------ total: 0.000000sec
# 
#                 user     system      total        real
# vanilla     0.000000   0.000000   0.000000 (  0.000100)
# fscked      0.000000   0.000000   0.000000 (  0.000199)

# v0.0.3
#                 user     system      total        real
# vanilla     0.000000   0.000000   0.000000 (  0.000246)
# fscked      0.010000   0.000000   0.010000 (  0.005068)

# results on my machine (v0.0.2)
#                 user     system      total        real
# vanilla     0.000000   0.000000   0.000000 (  0.000130)
# fscked      2.960000   0.090000   3.050000 (  3.053142)
