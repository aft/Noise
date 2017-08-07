with (oGPUNoise) {
    _seed = irandom_range(0, 10000000);
    scr_cbDataGUI_set_value(oGPUNoise, "seed", string(_seed));
}
