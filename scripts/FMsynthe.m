function fm_synth()

    % Initialize parameters
    fs = 44100;                 % Sampling rate (Hz)
    duration = 3;               % Duration of the sound (seconds)
    t = 0:1/fs:duration;        % Time array
    sound_samples = zeros(size(t));
    
    % Initial parameter values
    carrier_freq = 440;         % Carrier frequency (Hz)
    modulator_freq = 220;       % Modulator frequency (Hz)
    modulation_index = 5;       % Modulation index
    attack_time = 0.1;          % Attack time (seconds)
    decay_time = 0.5;           % Decay time (seconds)

    % Create figure window and controls
    fig = figure('Name', 'FM Synthesizer', 'Position', [200, 200, 600, 400]);
    
    % Carrier frequency slider
    carrier_freq_slider = uicontrol('Style', 'slider', 'Min', 20, 'Max', 2000, ...
        'Value', carrier_freq, 'Position', [50, 350, 200, 20], ...
        'Callback', @update_carrier_freq);
    carrier_freq_label = uicontrol('Style', 'text', 'Position', [260, 345, 50, 20], ...
        'String', ['Carrier Freq: ', num2str(carrier_freq), ' Hz']);

    % Modulator frequency slider
    modulator_freq_slider = uicontrol('Style', 'slider', 'Min', 10, 'Max', 1000, ...
        'Value', modulator_freq, 'Position', [50, 300, 200, 20], ...
        'Callback', @update_modulator_freq);
    modulator_freq_label = uicontrol('Style', 'text', 'Position', [260, 295, 50, 20], ...
        'String', ['Modulator Freq: ', num2str(modulator_freq), ' Hz']);

    % Modulation index slider
    modulation_index_slider = uicontrol('Style', 'slider', 'Min', 0, 'Max', 10, ...
        'Value', modulation_index, 'Position', [50, 250, 200, 20], ...
        'Callback', @update_modulation_index);
    modulation_index_label = uicontrol('Style', 'text', 'Position', [260, 245, 50, 20], ...
        'String', ['Modulation Index: ', num2str(modulation_index)]);

    % Attack time slider
    attack_time_slider = uicontrol('Style', 'slider', 'Min', 0, 'Max', 1, ...
        'Value', attack_time, 'Position', [50, 200, 200, 20], ...
        'Callback', @update_attack_time);
    attack_time_label = uicontrol('Style', 'text', 'Position', [260, 195, 50, 20], ...
        'String', ['Attack Time: ', num2str(attack_time), ' s']);

    % Decay time slider
    decay_time_slider = uicontrol('Style', 'slider', 'Min', 0, 'Max', 1, ...
        'Value', decay_time, 'Position', [50, 150, 200, 20], ...
        'Callback', @update_decay_time);
    decay_time_label = uicontrol('Style', 'text', 'Position', [260, 145, 50, 20], ...
        'String', ['Decay Time: ', num2str(decay_time), ' s']);

    % Play button
    play_button = uicontrol('Style', 'pushbutton', 'String', 'Play', ...
        'Position', [50, 50, 100, 50], 'Callback', @play_sound);
    
    % Function to generate FM synthesized sound
    function generate_sound()
        % Generate modulating signal
        modulating_signal = sin(2 * pi * modulator_freq * t);
        
        % Generate FM synthesized sound
        sound_samples = sin(2 * pi * (carrier_freq + modulation_index * modulating_signal) .* t);
        
        % Apply amplitude envelope
        sound_samples = apply_amplitude_envelope(sound_samples, attack_time, decay_time, fs);
    end

    % Function to apply amplitude envelope
    function enveloped_signal = apply_amplitude_envelope(signal, attack_time, decay_time, fs)
        envelope = ones(size(signal));
        attack_samples = round(attack_time * fs);
        decay_samples = round(decay_time * fs);
        
        % Attack phase
        envelope(1:attack_samples) = linspace(0, 1, attack_samples);
        
        % Decay phase
        envelope(end-decay_samples+1:end) = linspace(1, 0, decay_samples);
        
        % Apply envelope
        enveloped_signal = signal .* envelope;
    end

    % Callback functions for sliders
    function update_carrier_freq(source, ~)
        carrier_freq = round(source.Value);
        carrier_freq_label.String = ['Carrier Freq: ', num2str(carrier_freq), ' Hz'];
        generate_sound();
    end

    function update_modulator_freq(source, ~)
        modulator_freq = round(source.Value);
        modulator_freq_label.String = ['Modulator Freq: ', num2str(modulator_freq), ' Hz'];
        generate_sound();
    end

    function update_modulation_index(source, ~)
        modulation_index = source.Value;
        modulation_index_label.String = ['Modulation Index: ', num2str(modulation_index)];
        generate_sound();
    end

    function update_attack_time(source, ~)
        attack_time = source.Value;
        attack_time_label.String = ['Attack Time: ', num2str(attack_time), ' s'];
        generate_sound();
    end

    function update_decay_time(source, ~)
        decay_time = source.Value;
        decay_time_label.String = ['Decay Time: ', num2str(decay_time), ' s'];
        generate_sound();
    end

    % Callback function for play button
    function play_sound(~, ~)
        sound(sound_samples, fs);
    end

    % Generate initial sound
    generate_sound();

end


