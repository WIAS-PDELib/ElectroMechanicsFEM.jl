# ElectroMechanicsFEM.jl

## Working examples

Instantiate this project after cloning or updating via

```
$ julia --project=.
julia> using Pkg
julia> Pkg.instantiate()
```

For example, to run the simulation for a GaAs/In0.5Al0.5As nanowire with a 50 nm thick core (GaAs) and a 10 nm wide shell/stressor (In0.5Al0.5As) type:

```
julia> using TestEnv; TestEnv.activate(); include("scripts/bimetal.jl")
julia> using PyPlot
julia> nanowire.main(geometry=[30,20,10,2000],stressor_x=0.5,Plotter=PyPlot,postprocess=true)
```

By default, the code uses linear FEM elements without grid refinement and a ZB-(001) crystal orientation. 
These settings (and many others) can be tuned by changing the parameters in `scripts/nanowire.jl`.

The above commands generate a .jld2 file with the solution data and two .vtu files with the bent and unbent nanowire, which can be imported into ParaView to visualize the solution.
In addition, cross-section cuts are created and elastic strain and other solution derivatives are computed on cross-sections perpendicular to the bending direction (by default, a middle cross-section is chosen).

### Scripts

- `scripts/nanowire.jl`: 3D nanowire simulation (nonlinear elasticity + polarisation + postprocessing)
- `notebooks/plotting.jl`: Pluto notebook for visualizing different grids
- [bimetal] `scripts/bimetal.jl`: 3D bimetal simulation (nonlinear elasticity + postprocessing)


<!-- 
## Todo

%- [Done, 16/03/2022] grid generator for nanowire in Julia (currently user must provide sg-files, one can be found in grids folder)
%- fully coupled elasticity + polarisation model (currently only forward coupling)
%- parallelize simulations in run_watson
%- regression tests
-->
