using Test
using StrainedBandstructures
using ExplicitImports
using Aqua
using Printf

@testset "Aqua.jl" begin
    Aqua.test_all(StrainedBandstructures)
end

@testset "ExplicitImports" begin
    @test ExplicitImports.check_no_implicit_imports(StrainedBandstructures, skip=(Base, Core, Printf)) === nothing # @printf macro is falsely detected
    @test ExplicitImports.check_no_stale_explicit_imports(StrainedBandstructures) === nothing
end