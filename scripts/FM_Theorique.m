% Set the sampling frequency to 1kHz and carrier frequency to 200 Hz. 
fs = 1000; 
fc = 200; 
t = (0:1/fs:0.2)';
f = 1/t;

% Create two tone sinusoidal signal with frequencies 30 and 60 Hz.
x = sin(2*pi*50*t) + 2*sin(2*pi*100*t);

% Set the frequency deviation to 100 Hz.
fDev = 100;

% Frequency modulate x.
y = fmmod(x, fc, fs, fDev);

% Plot the graphs to show the original signal and modulated signal.
figure;
subplot(3,1,1)
plot(t, x)
xlabel('Time(s)')
ylabel('Amplitude')
title('Original Signal')
grid on;
subplot(3,1,2)
plot(t, y)
xlabel('Time(s)')
ylabel('Amplitude')
title('Modulated Signal')
grid on;
% Plot both signals on the same plot for comparison.
subplot(3,1,3)
plot(t, x, 'r', t, y, 'b-')
xlabel('Time(s)')
ylabel('Amplitude')
title('Comparison of Original and Modulated Signals')
legend('Original Signal', 'Modulated Signal')
grid on;

% Calculate and plot the Fourier transform of the original signal.
X = fft(x);
Y = fft(y);

figure;
subplot(2,1,1)
frequencies = linspace(0, fs, length(X));
plot(frequencies, abs(X))
title('Fourier Transform of Original Signal')
xlabel('Frequency (Hz)')
ylabel('Amplitude')
subplot(2,1,2)
plot(frequencies, abs(Y))
title('Fourier Transform of Modulated Signal')
xlabel('Frequency (Hz)')
ylabel('Amplitude')

%% 
% Bessels function

% Paramètres
fc = 1000; % Fréquence de la porteuse (en Hz)
fm = 50;   % Fréquence modulante (en Hz)
I = 30;     % Indice de modulation

% Temps
t = 0:0.001:1; % Échantillonnage temporel

% Fonction de Bessel (d'ordre zéro)
k_f = 2*pi*fm; % Coefficient de modulation
I_t = besselj(0, k_f * t); % Fonction de Bessel

% Signal FM
s = cos(2*pi*fc*t + I_t);

% Spectre
N = 1024; % Nombre de points FFT
f = linspace(-fc, fc, N);
S = abs(fftshift(fft(s, N)));

% Affichage
subplot(2,1,1);
plot(t, s);
title('Signal FM avec Fonction de Bessel');
xlabel('Temps (s)');
ylabel('Amplitude');

subplot(2,1,2);
plot(f, S);
title('Spectre du signal FM');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');

% Paramètres
fc = 220; % Fréquence de la porteuse (en Hz)
fm = 10;  % Fréquence modulante (en Hz)
I_values = [1, 2, 5]; % Différents indices de modulation

% Temps
t = 0:0.001:1; % Échantillonnage temporel

% Génération du signal FM pour chaque indice de modulation
figure;
for i = 1:length(I_values)
    I = I_values(i);
    s = cos(2*pi*fc*t + I*sin(2*pi*fm*t));
    
    % Spectre
    N = 1024; % Nombre de points FFT
    f = linspace(-fc, fc, N);
    S = abs(fftshift(fft(s, N)));
    
    % Affichage
    subplot(length(I_values), 2, 2*i-1);
    plot(t, s);
    title(['Signal FM (I = ' num2str(I) ')']);
    xlabel('Temps (s)');
    ylabel('Amplitude');
    
    subplot(length(I_values), 2, 2*i);
    plot(f, S);
    title(['Spectre du signal FM (I = ' num2str(I) ')']);
    xlabel('Fréquence (Hz)');
    ylabel('Amplitude');
end

sgtitle('Modulation de Fréquence (FM) avec différentes valeurs d''indice de modulation');


