<#
 # File: 	config.ps1
 # Author: 	Prof. Rob Marano
 # Build and test file for Verilog on Windows using PowerShell
 # Note: icarus verilog and gtkwave must be installed
 #>

$COMPONENT = "mux_4to1"
#
$SRC = "$COMPONENT.sv"
$TESTBENCH = "tb_$COMPONENT.sv"
$TBOUTPUT = "tb_$COMPONENT.vcd"
$filesToRemove = @("$COMPONENT", "$TBOUTPUT")

# TOOLS
# You need to update the paths below to the tools in your system
$COMPILER = "C:\ProgramData\chocolatey\bin\iverilog.exe"
$SIMULATOR = "C:\ProgramData\chocolatey\bin\vvp.exe"
$VIEWER = "C:\ProgramData\chocolatey\bin\gtkwave.exe" # GUI app
# TOOL OPTIONS
$COFLAGS = "-g2012"
$SFLAGS = "-M ."		#SIMULATOR FLAGS
$SOUTPUT = "-lxt2"		#SIMULATOR OUTPUT TYPE