
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name UlaUla -dir "/home/sd/ulaula/ulaula2/UlaUla/planAhead_run_3" -part xc3s700anfgg484-5
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/sd/ulaula/ulaula2/UlaUla/ula.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/sd/ulaula/ulaula2/UlaUla} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "ula.ucf" [current_fileset -constrset]
add_files [list {ula.ucf}] -fileset [get_property constrset [current_run]]
link_design
