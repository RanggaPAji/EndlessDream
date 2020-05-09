use_debug false

live_loop :ambienta do
  with_fx :reverb, room: 1 do
    use_real_time
    sync "/osc:192.168.100.4:62180/a"
    use_synth (ring :tri, :beep).choose
    play chord((ring :b3, :e4, :e4, :e4, :b4, :e3).choose, :m9),attack: 1, release: 3, pan: rrand(-0.8, 0.8)
  end
end

live_loop :ambientb do
  with_fx :reverb, room: 1 do
    use_real_time
    sync "/osc:192.168.100.4:62180/b"
    use_synth (ring :dtri, :saw, :chiplead, :fm).choose
    play chord(:b4, (ring :m7,:m9).choose), attack: 2, release: 2, pan: rrand(0,1)
  end
end

live_loop :ambientc do
  with_fx :reverb, room: 1 do
    use_real_time
    sync "/osc:192.168.100.4:62180/c"
    use_synth :tri
    play scale(:b3, :minor_pentatonic, num_octaves: 2).choose, amp: 0.4, attack: 1, release: 1.5
  end
end

live_loop :ambientd do
  with_fx :reverb, room: 0.8 do
    use_real_time
    sync "/osc:192.168.100.4:62180/d"
    use_synth :fm
    play scale(:b2, :minor_pentatonic, num_octaves: 2).reverse.tick, release: 0.75
  end
end

live_loop :ambiente do
  with_fx :reverb, room: 1 do
    use_real_time
    sync "/osc:192.168.100.4:62180/e"
    use_synth :subpulse
    play scale(:b4, :minor_pentatonic).tick, release: 1.5, pan: rrand(0.5, -0.5)
  end
end

live_loop :ambientf do
  use_real_time
  sync "/osc:192.168.100.4:62180/f"
  use_synth :pulse
  play scale(:b2, :minor_pentatonic, num_octaves: 3).reverse.tick, amp: 0.6, pan: rrand(0.4, -0.4), release: 2
end

live_loop :ambientg do
  use_real_time
  sync "/osc:192.168.100.4:62180/g"
  use_synth :saw
  play scale(:b3, :minor_pentatonic, num_octaves: 3).reverse.choose, amp: 0.6, pan: rrand(0.2, -0.2), release: 0.5
end