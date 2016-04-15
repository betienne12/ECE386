

 
 
 




window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"

      waveform add -signals /Program_Ram_tb/status
      waveform add -signals /Program_Ram_tb/Program_Ram_synth_inst/bmg_port/CLKA
      waveform add -signals /Program_Ram_tb/Program_Ram_synth_inst/bmg_port/ADDRA
      waveform add -signals /Program_Ram_tb/Program_Ram_synth_inst/bmg_port/DINA
      waveform add -signals /Program_Ram_tb/Program_Ram_synth_inst/bmg_port/WEA
      waveform add -signals /Program_Ram_tb/Program_Ram_synth_inst/bmg_port/CLKB
      waveform add -signals /Program_Ram_tb/Program_Ram_synth_inst/bmg_port/ADDRB
      waveform add -signals /Program_Ram_tb/Program_Ram_synth_inst/bmg_port/DOUTB

console submit -using simulator -wait no "run"
