export XILINX_VIVADO=/tools/Xilinx/Vivado/2020.1
export PATH=${XILINX_VIVADO}/bin:${PATH}
source /tools/Xilinx/Vitis/2020.1/settings64.sh
source /opt/xilinx/xrt/setup.sh
# source /opt/xilinx/fix_vitis_bug.sh
export LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LIBRARY_PATH
export PLATFORM_REPO_PATHS=/opt/xilinx/platforms/xilinx_u200_xdma_201830_2
export AWS_PLATFORM="xilinx_u200_xdma_201830_2"
echo "Platform: xilinx_u200_xdma_201830_2"
