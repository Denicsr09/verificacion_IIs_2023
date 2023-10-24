simSetSimulator "-vcssv" -exec "./salida" -args " " -uvmDebug on
debImport "-i" "-simflow" "-dbdir" "./salida.daidir"
srcTBInvokeSim
srcHBSelect "tb.dut._rw_\[1\]._clm_\[1\].rtr" -win $_nTrace1
srcHBSelect "tb.dut._rw_\[1\]._clm_\[1\].rtr" -win $_nTrace1
wvCreateWindow
srcHBAddObjectToWave -clipboard
wvDrop -win $_nWave3
verdiDockWidgetHide -dock widgetDock_<Watch>
srcTBSetHiddenView -view WatchView
srcTBRunSim
wvSelectSignal -win $_nWave3 {( "rtr" 6 )} 
wvSetPosition -win $_nWave3 {("rtr" 6)}
wvExpandBus -win $_nWave3
wvSetPosition -win $_nWave3 {("rtr" 12)}
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSelectSignal -win $_nWave3 {( "rtr" 3 )} 
wvSelectSignal -win $_nWave3 {( "rtr" 3 )} 
wvSelectSignal -win $_nWave3 {( "rtr" 3 )} 
wvSetPosition -win $_nWave3 {("rtr" 3)}
wvExpandBus -win $_nWave3
wvSetPosition -win $_nWave3 {("rtr" 16)}
debExit
