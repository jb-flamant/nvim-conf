return {
  {
    'meck/nvim-dap-cortex-debug',
    opts = function()
      require('dap').configurations.c = {
        {
          name = 'Attach STM32U5G9 - ST-Link',
          cwd = '${workspaceFolder}',
          type = 'cortex-debug',
          request = 'attach',
          servertype = 'stlink',
          device = 'STM32U5G9',
          interface = 'swd',
          serialNumber = '',
          runToEntryPoint = 'main',
          svdFile = '${STM32_CLT_PATH}/STMicroelectronics_CMSIS_SVD/STM32U5GX.svd',
          v1 = false,
          serverpath = '${STM32_CLT_PATH}/STLink-gdb-server/bin/ST-LINK_gdbserver',
          stm32cubeprogrammer = '${STM32_CLT_PATH}/STM32CubeProgrammer/bin',
          stlinkPath = '${STM32_CLT_PATH}/STLink-gdb-server/bin/ST-LINK_gdbserver',
          armToolchainPath = '${STM32_CLT_PATH}/GNU-tools-for-STM32/bin',
          gdbPath = 'arm-none-eabi-gdb',
          serverArgs = {
            '-m',
            '0',
          },
        },
      }
    end,
  },
}
