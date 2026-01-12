using Test
using ElectroMechanicsFEM
using ExplicitImports
using Aqua
using Printf

@testset "Aqua.jl" begin
    Aqua.test_all(ElectroMechanicsFEM)
end

@testset "ExplicitImports" begin
    @test ExplicitImports.check_no_implicit_imports(ElectroMechanicsFEM, skip=(Base, Core, Printf)) === nothing # @printf macro is falsely detected
    @test ExplicitImports.check_no_stale_explicit_imports(ElectroMechanicsFEM) === nothing
end