# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/muhammad_osama/Downloads/Downloads/finalProject/digital 2 project/digital 2 project.cache/wt} [current_project]
set_property parent.project_path {C:/Users/muhammad_osama/Downloads/Downloads/finalProject/digital 2 project/digital 2 project.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]
set_property ip_output_repo {c:/Users/muhammad_osama/Downloads/Downloads/finalProject/digital 2 project/digital 2 project.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  {C:/Users/muhammad_osama/Downloads/Downloads/finalProject/digital 2 project/digital 2 project.srcs/sources_1/new/timeCounter.v}
  {C:/Users/muhammad_osama/Downloads/Downloads/finalProject/digital 2 project/digital 2 project.srcs/sources_1/new/signToSeg.v}
  {C:/Users/muhammad_osama/Downloads/Downloads/finalProject/digital 2 project/digital 2 project.srcs/sources_1/new/mux4x1.v}
  {C:/Users/muhammad_osama/Downloads/Downloads/finalProject/digital 2 project/digital 2 project.srcs/sources_1/new/hexToSeg.v}
  {C:/Users/muhammad_osama/Downloads/Downloads/finalProject/digital 2 project/digital 2 project.srcs/sources_1/new/decoder2x4.v}
  {C:/Users/muhammad_osama/Downloads/Downloads/finalProject/digital 2 project/digital 2 project.srcs/sources_1/new/clkDivider.v}
  {C:/Users/muhammad_osama/Downloads/Downloads/finalProject/digital 2 project/digital 2 project.srcs/sources_1/new/main_module.v}
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/muhammad_osama/Downloads/Downloads/finalProject/digital 2 project/digital 2 project.srcs/constrs_1/new/test_cf.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/muhammad_osama/Downloads/Downloads/finalProject/digital 2 project/digital 2 project.srcs/constrs_1/new/test_cf.xdc}}]


synth_design -top main_module -part xc7a35tcpg236-1


write_checkpoint -force -noxdef main_module.dcp

catch { report_utilization -file main_module_utilization_synth.rpt -pb main_module_utilization_synth.pb }
