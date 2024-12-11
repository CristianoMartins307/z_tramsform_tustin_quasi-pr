clear all
clc
close all

format long e


%%DADOS DE ENTRADA
T_shunt = 0; % 0 = liga FAP shunt em 0 segundos
T_serie = 0; % 0 = liga FAP serie em 0 segundos

k_damping = 2;

kp_serie=11;%GANHO PROPORCIONAL SERIE 
kp_paralelo=200;%GANHO PROPORCIONAL PARALELO

kr_serie=200; %%GANHO DO RESSONANTE SERIE
kr_paralelo=35;%GANHO RESSONANTE PARALELO

fs_pwm = 100000;
fs = 100000; %frquencia de amostragem
Ts = 1/fs;

pi = 3.141592653;

w0_1=2*pi*60*1;%%FREQUENCIA DE RESSONANCIA FUNDAMENTAL
w0_3=2*pi*60*3;%%FREQUENCIA DE RESSONANCIA TERCEIRA HARMONICA
w0_5=2*pi*60*5;%%FREQUENCIA DE RESSONANCIA QUINTA HARMONICA
w0_7=2*pi*60*7;%%FREQUENCIA DE RESSONANCIA SETIMA HARMONICA
w0_9=2*pi*60*9;%%FREQUENCIA DE RESSONANCIA NONA HARMONICA
w0_11=2*pi*60*11;%%FREQUENCIA DE RESSONANCIA 11 HARMONICA
w0_13=2*pi*60*13;%%FREQUENCIA DE RESSONANCIA 11 HARMONICA
w0_15=2*pi*60*15;%%FREQUENCIA DE RESSONANCIA 11 HARMONICA

zeta_serie= 0.0003;

wc0_1_serie = zeta_serie*w0_1;
wc0_3_serie = zeta_serie*w0_3;
wc0_5_serie = zeta_serie*w0_5;
wc0_7_serie = zeta_serie*w0_7;
wc0_9_serie = zeta_serie*w0_9;
wc0_11_serie = zeta_serie*w0_11;
wc0_13_serie = zeta_serie*w0_13;
wc0_15_serie = zeta_serie*w0_15;



zeta_paralelo= 0.0005;

wc0_1_paralelo = zeta_paralelo*w0_1;
wc0_3_paralelo = zeta_paralelo*w0_3;
wc0_5_paralelo = zeta_paralelo*w0_5;
wc0_7_paralelo = zeta_paralelo*w0_7;
wc0_9_paralelo = zeta_paralelo*w0_9;
wc0_11_paralelo = zeta_paralelo*w0_11;
wc0_13_paralelo = zeta_paralelo*w0_13;
wc0_15_paralelo = zeta_paralelo*w0_15;





%%CALCULOS

%%NUMERADORES E DENOMINADORES DA FUNCAO TRANSFERENCIA

%SERIE
n1_serie=kr_serie*[0 2*wc0_1_serie 0]; %numerador da funcao g(s) fundamental serie 
d1_serie=[1 2*wc0_1_serie w0_1^2]; %denomidador da funcao g(s) fundamental serie

n3_serie=kr_serie*[0 2*wc0_3_serie 0]; %numerador da funcao g(s) terceira harmonica serie
d3_serie=[1 2*wc0_3_serie w0_3^2]; %denomidador da funcao g(s) terceira harmonica serie

n5_serie=kr_serie*[0 2*wc0_5_serie 0]; %numerador da funcao g(s) quinta harmonica serie
d5_serie=[1 2*wc0_5_serie w0_5^2]; %denomidador da funcao g(s) quinta harmonica serie

n7_serie=kr_serie*[0 2*wc0_7_serie 0]; %numerador da funcao g(s) setima harmonica serie
d7_serie=[1 2*wc0_7_serie w0_7^2]; %denomidador da funcao g(s) setima harmonica serie

n9_serie=kr_serie*[0 2*wc0_9_serie 0]; %numerador da funcao g(s) nona harmonica serie
d9_serie=[1 2*wc0_9_serie w0_9^2]; %denomidador da funcao g(s) nona harmonica serie

n11_serie=kr_serie*[0 2*wc0_11_serie 0]; %numerador da funcao g(s) nona harmonica serie
d11_serie=[1 2*wc0_11_serie w0_11^2]; %denomidador da funcao g(s) nona harmonica serie

n13_serie=kr_serie*[0 2*wc0_13_serie 0]; %numerador da funcao g(s) nona harmonica serie
d13_serie=[1 2*wc0_13_serie w0_13^2]; %denomidador da funcao g(s) nona harmonica serie

n15_serie=kr_serie*[0 2*wc0_15_serie 0]; %numerador da funcao g(s) nona harmonica serie
d15_serie=[1 2*wc0_15_serie w0_15^2]; %denomidador da funcao g(s) nona harmonica serie

%PARALELO
n1_paralelo=kr_paralelo*[0 2*wc0_1_paralelo 0]; %numerador da funcao g(s) fundamental paralelo
d1_paralelo=[1 2*wc0_1_paralelo w0_1^2]; %denomidador da funcao g(s) fundamental paralelo

n3_paralelo=kr_paralelo*[0 2*wc0_3_paralelo 0]; %numerador da funcao g(s) quinta harmonica paralelo
d3_paralelo=[1 2*wc0_3_paralelo w0_3^2]; %denomidador da funcao g(s) quinta harmonica paralelo

n5_paralelo=kr_paralelo*[0 2*wc0_5_paralelo 0]; %numerador da funcao g(s) quinta harmonica paralelo
d5_paralelo=[1 2*wc0_5_paralelo w0_5^2]; %denomidador da funcao g(s) quinta harmonica paralelo

n7_paralelo=kr_paralelo*[0 2*wc0_7_paralelo 0]; %numerador da funcao g(s) setima harmonica paralelo
d7_paralelo=[1 2*wc0_7_paralelo w0_7^2]; %denomidador da funcao g(s) setima harmonica paralelo

n9_paralelo=kr_paralelo*[0 2*wc0_9_paralelo 0]; %numerador da funcao g(s) nona harmonica paralelo
d9_paralelo=[1 2*wc0_9_paralelo w0_9^2]; %denomidador da funcao g(s) nona harmonica paralelo

n11_paralelo=kr_paralelo*[0 2*wc0_11_paralelo 0]; %numerador da funcao g(s) 11 harmonica paralelo
d11_paralelo=[1 2*wc0_11_paralelo w0_11^2]; %denomidador da funcao g(s) 11 harmonica paralelo

n13_paralelo=kr_paralelo*[0 2*wc0_13_paralelo 0]; %numerador da funcao g(s) 13 harmonica paralelo
d13_paralelo=[1 2*wc0_13_paralelo w0_13^2]; %denomidador da funcao g(s) 13 harmonica paralelo

n15_paralelo=kr_paralelo*[0 2*wc0_15_paralelo 0]; %numerador da funcao g(s) 15 harmonica paralelo
d15_paralelo=[1 2*wc0_15_paralelo w0_15^2]; %denomidador da funcao g(s) 15 harmonica paralelo

%%FUNCAO TRANSFERENCIA

%SERIE
G1_serie = tf(n1_serie,d1_serie);
G3_serie = tf(n3_serie,d3_serie);
G5_serie = tf(n5_serie,d5_serie);
G7_serie = tf(n7_serie,d7_serie);
%PARALELO
G1_paralelo = tf(n1_paralelo,d1_paralelo);
G3_paralelo = tf(n3_paralelo,d3_paralelo);
G5_paralelo = tf(n5_paralelo,d5_paralelo);
G7_paralelo = tf(n7_paralelo,d7_paralelo);

%Controle ressonante em tempo discreto

%SERIE
[n1z_serie,d1z_serie] = c2dm(n1_serie,d1_serie,Ts,'tustin'); %conversao para tempo discreto ; nao entra C nem D porque eles discretizados sao iguais no domonio do tempo
[n3z_serie,d3z_serie] = c2dm(n3_serie,d3_serie,Ts,'tustin'); %conversao para tempo discreto ; nao entra C nem D porque eles discretizados sao iguais no domonio do tempo
[n5z_serie,d5z_serie] = c2dm(n5_serie,d5_serie,Ts,'tustin'); %conversao para tempo discreto ; nao entra C nem D porque eles discretizados sao iguais no domonio do tempo
[n7z_serie,d7z_serie] = c2dm(n7_serie,d7_serie,Ts,'tustin'); %conversao para tempo discreto ; nao entra C nem D porque eles discretizados sao iguais no domonio do tempo
[n9z_serie,d9z_serie] = c2dm(n9_serie,d9_serie,Ts,'tustin'); %conversao para tempo discreto ; nao entra C nem D porque eles discretizados sao iguais no domonio do tempo
[n11z_serie,d11z_serie] = c2dm(n11_serie,d11_serie,Ts,'tustin'); %conversao para tempo discreto ; nao entra C nem D porque eles discretizados sao iguais no domonio do tempo
[n13z_serie,d13z_serie] = c2dm(n13_serie,d13_serie,Ts,'tustin'); %conversao para tempo discreto ; nao entra C nem D porque eles discretizados sao iguais no domonio do tempo
[n15z_serie,d15z_serie] = c2dm(n15_serie,d15_serie,Ts,'tustin'); %conversao para tempo discreto ; nao entra C nem D porque eles discretizados sao iguais no domonio do tempo
%PARALELO
[n1z_paralelo,d1z_paralelo] = c2dm(n1_paralelo,d1_paralelo,Ts,'tustin'); %conversao para tempo discreto ; nao entra C nem D porque eles discretizados sao iguais no domonio do tempo
[n3z_paralelo,d3z_paralelo] = c2dm(n3_paralelo,d3_paralelo,Ts,'tustin'); %conversao para tempo discreto ; nao entra C nem D porque eles discretizados sao iguais no domonio do tempo
[n5z_paralelo,d5z_paralelo] = c2dm(n5_paralelo,d5_paralelo,Ts,'tustin'); %conversao para tempo discreto ; nao entra C nem D porque eles discretizados sao iguais no domonio do tempo
[n7z_paralelo,d7z_paralelo] = c2dm(n7_paralelo,d7_paralelo,Ts,'tustin'); %conversao para tempo discreto ; nao entra C nem D porque eles discretizados sao iguais no domonio do tempo
[n9z_paralelo,d9z_paralelo] = c2dm(n9_paralelo,d9_paralelo,Ts,'tustin'); %conversao para tempo discreto ; nao entra C nem D porque eles discretizados sao iguais no domonio do tempo
[n11z_paralelo,d11z_paralelo] = c2dm(n11_paralelo,d11_paralelo,Ts,'tustin'); %conversao para tempo discreto ; nao entra C nem D porque eles discretizados sao iguais no domonio do tempo
[n13z_paralelo,d13z_paralelo] = c2dm(n13_paralelo,d13_paralelo,Ts,'tustin'); %conversao para tempo discreto ; nao entra C nem D porque eles discretizados sao iguais no domonio do tempo
[n15z_paralelo,d15z_paralelo] = c2dm(n15_paralelo,d15_paralelo,Ts,'tustin'); %conversao para tempo discreto ; nao entra C nem D porque eles discretizados sao iguais no domonio do tempo
G_7z=tf(n7z_paralelo,d7z_paralelo,Ts,'Variable','z^-1')

%COEFIECIENTES
%SERIE
beta0_1_serie=n1z_serie(1);
beta1_1_serie=n1z_serie(2);
beta2_1_serie=n1z_serie(3);
alfa0_1_serie=d1z_serie(1);
alfa1_1_serie=d1z_serie(2);
alfa2_1_serie=d1z_serie(3);

beta0_3_serie=n3z_serie(1);
beta1_3_serie=n3z_serie(2);
beta2_3_serie=n3z_serie(3);
alfa0_3_serie=d3z_serie(1);
alfa1_3_serie=d3z_serie(2);
alfa2_3_serie=d3z_serie(3);

beta0_5_serie=n5z_serie(1);
beta1_5_serie=n5z_serie(2);
beta2_5_serie=n5z_serie(3);
alfa0_5_serie=d5z_serie(1);
alfa1_5_serie=d5z_serie(2);
alfa2_5_serie=d5z_serie(3);

beta0_7_serie=n7z_serie(1);
beta1_7_serie=n7z_serie(2);
beta2_7_serie=n7z_serie(3);
alfa0_7_serie=d7z_serie(1);
alfa1_7_serie=d7z_serie(2);
alfa2_7_serie=d7z_serie(3);

beta0_9_serie=n9z_serie(1);
beta1_9_serie=n9z_serie(2);
beta2_9_serie=n9z_serie(3);
alfa0_9_serie=d9z_serie(1);
alfa1_9_serie=d9z_serie(2);
alfa2_9_serie=d9z_serie(3);

beta0_11_serie=n11z_serie(1);
beta1_11_serie=n11z_serie(2);
beta2_11_serie=n11z_serie(3);
alfa0_11_serie=d11z_serie(1);
alfa1_11_serie=d11z_serie(2);
alfa2_11_serie=d11z_serie(3);

beta0_13_serie=n13z_serie(1);
beta1_13_serie=n13z_serie(2);
beta2_13_serie=n13z_serie(3);
alfa0_13_serie=d13z_serie(1);
alfa1_13_serie=d13z_serie(2);
alfa2_13_serie=d13z_serie(3);

beta0_15_serie=n15z_serie(1);
beta1_15_serie=n15z_serie(2);
beta2_15_serie=n15z_serie(3);
alfa0_15_serie=d15z_serie(1);
alfa1_15_serie=d15z_serie(2);
alfa2_15_serie=d15z_serie(3);

%PARALELO
beta0_1_paralelo=n1z_paralelo(1);
beta1_1_paralelo=n1z_paralelo(2);
beta2_1_paralelo=n1z_paralelo(3);
alfa0_1_paralelo=d1z_paralelo(1);
alfa1_1_paralelo=d1z_paralelo(2);
alfa2_1_paralelo=d1z_paralelo(3);

beta0_3_paralelo=n3z_paralelo(1);
beta1_3_paralelo=n3z_paralelo(2);
beta2_3_paralelo=n3z_paralelo(3);    
alfa0_3_paralelo=d3z_paralelo(1);
alfa1_3_paralelo=d3z_paralelo(2);                                                    
alfa2_3_paralelo=d3z_paralelo(3);

beta0_5_paralelo=n5z_paralelo(1);
beta1_5_paralelo=n5z_paralelo(2);
beta2_5_paralelo=n5z_paralelo(3);    
alfa0_5_paralelo=d5z_paralelo(1);
alfa1_5_paralelo=d5z_paralelo(2);                                                    
alfa2_5_paralelo=d5z_paralelo(3);

beta0_7_paralelo=n7z_paralelo(1)
beta1_7_paralelo=n7z_paralelo(2)
beta2_7_paralelo=n7z_paralelo(3)
alfa0_7_paralelo=d7z_paralelo(1)
alfa1_7_paralelo=d7z_paralelo(2)
alfa2_7_paralelo=d7z_paralelo(3)

beta0_9_paralelo=n9z_paralelo(1)
beta1_9_paralelo=n9z_paralelo(2)
beta2_9_paralelo=n9z_paralelo(3)
alfa0_9_paralelo=d9z_paralelo(1)
alfa1_9_paralelo=d9z_paralelo(2)
alfa2_9_paralelo=d9z_paralelo(3)

beta0_11_paralelo=n11z_paralelo(1)
beta1_11_paralelo=n11z_paralelo(2)
beta2_11_paralelo=n11z_paralelo(3)
alfa0_11_paralelo=d11z_paralelo(1)
alfa1_11_paralelo=d11z_paralelo(2)
alfa2_11_paralelo=d11z_paralelo(3)

beta0_13_paralelo=n13z_paralelo(1)
beta1_13_paralelo=n13z_paralelo(2)
beta2_13_paralelo=n13z_paralelo(3)
alfa0_13_paralelo=d13z_paralelo(1)
alfa1_13_paralelo=d13z_paralelo(2)
alfa2_13_paralelo=d13z_paralelo(3)

beta0_15_paralelo=n15z_paralelo(1)
beta1_15_paralelo=n15z_paralelo(2)
beta2_15_paralelo=n15z_paralelo(3)
alfa0_15_paralelo=d15z_paralelo(1)
alfa1_15_paralelo=d15z_paralelo(2)
alfa2_15_paralelo=d15z_paralelo(3)

% Nome do arquivo de texto
filename = 'F:\Documentos\UFSM_2024_2\TCC\TCC2\matlab\arquivos_txt\\parameters-z.txt';

% Abrir o arquivo para escrita
fileID = fopen(filename, 'w');
fprintf(fileID, 'pi=%.8f \n', pi);
fprintf(fileID, 'fs=%.8f \n', fs);
fprintf(fileID, 'fs_pwm=%.8f \n', fs_pwm);
fprintf(fileID, 'T_shunt=%.8f \n', T_shunt);
fprintf(fileID, 'T_serie=%.8f \n', T_serie);
fprintf(fileID, 'k_damping=%.8f \n', k_damping)

%PARALELO
fprintf(fileID, 'ksi_paralelo=%.8f \n', zeta_paralelo);
fprintf(fileID, 'kp_paralelo=%.8f \n', kp_paralelo);
fprintf(fileID, 'kr_paralelo=%.8f \n', kr_paralelo);

%SERIE
fprintf(fileID, 'ksi_serie=%.8f \n', zeta_serie);
fprintf(fileID, 'kp_serie=%.8f \n', kp_serie);
fprintf(fileID, 'kr_serie=%.8f \n', kr_serie);

% Fechar o arquivo
fclose(fileID);

% Exibir mensagem de sucesso
disp(['Arquivo ' filename ' criado com sucesso.']);


filename = 'F:\Documentos\UFSM_2024_2\TCC\TCC2\matlab\arquivos_txt\\variaveis.h';
fileID2 = fopen(filename, 'w');



%PARALELO
fprintf(fileID2, '//=========================================================================================\n');
fprintf(fileID2, '                                  //VARIABLES OF SHUNT FILTER\n');
fprintf(fileID2, '//=========================================================================================\n');
fprintf(fileID2, '\n');
fprintf(fileID2, '\n');
fprintf(fileID2, '//Proportional Gain shunt\n');
fprintf(fileID2, '\n');
fprintf(fileID2, '#define KP_PARALELO %.8f \n', kp_paralelo);
%fundamental paralelo
fprintf(fileID2, '\n');
fprintf(fileID2, '//60Hz\n');
fprintf(fileID2, '#define B0_1_PARALELO %.8f \n', beta0_1_paralelo);
fprintf(fileID2, '#define B1_1_PARALELO %.8f \n', beta1_1_paralelo);
fprintf(fileID2, '#define B2_1_PARALELO %.8f \n', beta2_1_paralelo);
fprintf(fileID2, '#define A0_1_PARALELO %.8f \n', alfa0_1_paralelo);
fprintf(fileID2, '#define A1_1_PARALELO %.8f \n', alfa1_1_paralelo);
fprintf(fileID2, '#define A2_1_PARALELO %.8f \n', alfa2_1_paralelo);

%terceira harmonica paralelo
fprintf(fileID2, '\n');
fprintf(fileID2, '//180Hz\n');
fprintf(fileID2, '#define B0_3_PARALELO %.8f \n', beta0_3_paralelo);
fprintf(fileID2, '#define B1_3_PARALELO %.8f \n', beta1_3_paralelo);
fprintf(fileID2, '#define B2_3_PARALELO %.8f \n', beta2_3_paralelo);
fprintf(fileID2, '#define A0_3_PARALELO %.8f \n', alfa0_3_paralelo);
fprintf(fileID2, '#define A1_3_PARALELO %.8f \n', alfa1_3_paralelo);
fprintf(fileID2, '#define A2_3_PARALELO %.8f \n', alfa2_3_paralelo);

%quinta harmonica paralelo
fprintf(fileID2, '\n');
fprintf(fileID2, '//300Hz\n');
fprintf(fileID2, '#define B0_5_PARALELO %.8f \n', beta0_5_paralelo);
fprintf(fileID2, '#define B1_5_PARALELO %.8f \n', beta1_5_paralelo);
fprintf(fileID2, '#define B2_5_PARALELO %.8f \n', beta2_5_paralelo);
fprintf(fileID2, '#define A0_5_PARALELO %.8f \n', alfa0_5_paralelo);
fprintf(fileID2, '#define A1_5_PARALELO %.8f \n', alfa1_5_paralelo);
fprintf(fileID2, '#define A2_5_PARALELO %.8f \n', alfa2_5_paralelo);

%setima harmonica paralelo
fprintf(fileID2, '\n');
fprintf(fileID2, '//420Hz\n');
fprintf(fileID2, '#define B0_7_PARALELO %.8f \n', beta0_7_paralelo);
fprintf(fileID2, '#define B1_7_PARALELO %.8f \n', beta1_7_paralelo);
fprintf(fileID2, '#define B2_7_PARALELO %.8f \n', beta2_7_paralelo);
fprintf(fileID2, '#define A0_7_PARALELO %.8f \n', alfa0_7_paralelo);
fprintf(fileID2, '#define A1_7_PARALELO %.8f \n', alfa1_7_paralelo);
fprintf(fileID2, '#define A2_7_PARALELO %.8f \n', alfa2_7_paralelo);

%nona harmonica paralelo
fprintf(fileID2, '\n');
fprintf(fileID2, '//540Hz\n');
fprintf(fileID2, '#define B0_9_PARALELO %.8f \n', beta0_9_paralelo);
fprintf(fileID2, '#define B1_9_PARALELO %.8f \n', beta1_9_paralelo);
fprintf(fileID2, '#define B2_9_PARALELO %.8f \n', beta2_9_paralelo);
fprintf(fileID2, '#define A0_9_PARALELO %.8f \n', alfa0_9_paralelo);
fprintf(fileID2, '#define A1_9_PARALELO %.8f \n', alfa1_9_paralelo);
fprintf(fileID2, '#define A2_9_PARALELO %.8f \n', alfa2_9_paralelo);

%11 harmonica paralelo
fprintf(fileID2, '\n');
fprintf(fileID2, '//660Hz\n');
fprintf(fileID2, '#define B0_11_PARALELO %.8f \n', beta0_11_paralelo);
fprintf(fileID2, '#define B1_11_PARALELO %.8f \n', beta1_11_paralelo);
fprintf(fileID2, '#define B2_11_PARALELO %.8f \n', beta2_11_paralelo);
fprintf(fileID2, '#define A0_11_PARALELO %.8f \n', alfa0_11_paralelo);
fprintf(fileID2, '#define A1_11_PARALELO %.8f \n', alfa1_11_paralelo);
fprintf(fileID2, '#define A2_11_PARALELO %.8f \n', alfa2_11_paralelo);

%13 harmonica paralelo
fprintf(fileID2, '\n');
fprintf(fileID2, '//780Hz\n');
fprintf(fileID2, '#define B0_13_PARALELO %.8f \n', beta0_13_paralelo);
fprintf(fileID2, '#define B1_13_PARALELO %.8f \n', beta1_13_paralelo);
fprintf(fileID2, '#define B2_13_PARALELO %.8f \n', beta2_13_paralelo);
fprintf(fileID2, '#define A0_13_PARALELO %.8f \n', alfa0_13_paralelo);
fprintf(fileID2, '#define A1_13_PARALELO %.8f \n', alfa1_13_paralelo);
fprintf(fileID2, '#define A2_13_PARALELO %.8f \n', alfa2_13_paralelo);

%15 harmonica paralelo
fprintf(fileID2, '\n');
fprintf(fileID2, '//900Hz\n');
fprintf(fileID2, '#define B0_15_PARALELO %.8f \n', beta0_15_paralelo);
fprintf(fileID2, '#define B1_15_PARALELO %.8f \n', beta1_15_paralelo);
fprintf(fileID2, '#define B2_15_PARALELO %.8f \n', beta2_15_paralelo);
fprintf(fileID2, '#define A0_15_PARALELO %.8f \n', alfa0_15_paralelo);
fprintf(fileID2, '#define A1_15_PARALELO %.8f \n', alfa1_15_paralelo);
fprintf(fileID2, '#define A2_15_PARALELO %.8f \n', alfa2_15_paralelo);


%SERIE
fprintf(fileID2, '//=========================================================================================\n');
fprintf(fileID2, '                                  //VARIABLES OF SERIE FILTER\n');
fprintf(fileID2, '//=========================================================================================\n');
fprintf(fileID2, '\n');
fprintf(fileID2, '\n');
fprintf(fileID2, '//Proportional Gain serie\n');
fprintf(fileID2, '\n');
fprintf(fileID, '#define KP_SERIE %.8f \n', kp_serie);
fprintf(fileID2, '\n');
fprintf(fileID2, '//Damping Gain serie\n');
fprintf(fileID2, '\n');
fprintf(fileID, '#define K_DAMPING %.8f \n', k_damping);

%fundamental serie
fprintf(fileID2, '\n');
fprintf(fileID2, '//60Hz\n');
fprintf(fileID2, '#define B0_1_SERIE %.8f \n', beta0_1_serie);
fprintf(fileID2, '#define B1_1_SERIE %.8f \n', beta1_1_serie);
fprintf(fileID2, '#define B2_1_SERIE %.8f \n', beta2_1_serie);
fprintf(fileID2, '#define A0_1_SERIE %.8f \n', alfa0_1_serie);
fprintf(fileID2, '#define A1_1_SERIE %.8f \n', alfa1_1_serie);
fprintf(fileID2, '#define A2_1_SERIE %.8f \n', alfa2_1_serie);

%terceira harmonica serie
fprintf(fileID2, '\n');
fprintf(fileID2, '//180Hz\n');
fprintf(fileID2, '#define B0_3_SERIE %.8f \n', beta0_3_serie);
fprintf(fileID2, '#define B1_3_SERIE %.8f \n', beta1_3_serie);
fprintf(fileID2, '#define B2_3_SERIE %.8f \n', beta2_3_serie);
fprintf(fileID2, '#define A0_3_SERIE %.8f \n', alfa0_3_serie);
fprintf(fileID2, '#define A1_3_SERIE %.8f \n', alfa1_3_serie);
fprintf(fileID2, '#define A2_3_SERIE %.8f \n', alfa2_3_serie);

%quinta harmonica serie
fprintf(fileID2, '\n');
fprintf(fileID2, '//300Hz\n');
fprintf(fileID2, '#define B0_5_SERIE %.8f \n', beta0_5_serie);
fprintf(fileID2, '#define B1_5_SERIE %.8f \n', beta1_5_serie);
fprintf(fileID2, '#define B2_5_SERIE %.8f \n', beta2_5_serie);
fprintf(fileID2, '#define A0_5_SERIE %.8f \n', alfa0_5_serie);
fprintf(fileID2, '#define A1_5_SERIE %.8f \n', alfa1_5_serie);
fprintf(fileID2, '#define A2_5_SERIE %.8f \n', alfa2_5_serie);

%setima harmonica serie
fprintf(fileID2, '\n');
fprintf(fileID2, '//420Hz\n');
fprintf(fileID2, '#define B0_7_SERIE %.8f \n', beta0_7_serie);
fprintf(fileID2, '#define B1_7_SERIE %.8f \n', beta1_7_serie);
fprintf(fileID2, '#define B2_7_SERIE %.8f \n', beta2_7_serie);
fprintf(fileID2, '#define A0_7_SERIE %.8f \n', alfa0_7_serie);
fprintf(fileID2, '#define A1_7_SERIE %.8f \n', alfa1_7_serie);
fprintf(fileID2, '#define A2_7_SERIE %.8f \n', alfa2_7_serie);


%nona harmonica serie
fprintf(fileID2, '\n');
fprintf(fileID2, '//540Hz\n');
fprintf(fileID2, '#define B0_9_SERIE %.8f \n', beta0_9_serie);
fprintf(fileID2, '#define B1_9_SERIE %.8f \n', beta1_9_serie);
fprintf(fileID2, '#define B2_9_SERIE %.8f \n', beta2_9_serie);
fprintf(fileID2, '#define A0_9_SERIE %.8f \n', alfa0_9_serie);
fprintf(fileID2, '#define A1_9_SERIE %.8f \n', alfa1_9_serie);
fprintf(fileID2, '#define A2_9_SERIE %.8f \n', alfa2_9_serie);

%11 harmonica serie
fprintf(fileID2, '\n');
fprintf(fileID2, '//660Hz\n');
fprintf(fileID2, '#define B0_11_SERIE %.8f \n', beta0_11_serie);
fprintf(fileID2, '#define B1_11_SERIE %.8f \n', beta1_11_serie);
fprintf(fileID2, '#define B2_11_SERIE %.8f \n', beta2_11_serie);
fprintf(fileID2, '#define A0_11_SERIE %.8f \n', alfa0_11_serie);
fprintf(fileID2, '#define A1_11_SERIE %.8f \n', alfa1_11_serie);
fprintf(fileID2, '#define A2_11_SERIE %.8f \n', alfa2_11_serie);

%13 harmonica serie
fprintf(fileID2, '\n');
fprintf(fileID2, '//780Hz\n');
fprintf(fileID2, '#define B0_13_SERIE %.8f \n', beta0_13_serie);
fprintf(fileID2, '#define B1_13_SERIE %.8f \n', beta1_13_serie);
fprintf(fileID2, '#define B2_13_SERIE %.8f \n', beta2_13_serie);
fprintf(fileID2, '#define A0_13_SERIE %.8f \n', alfa0_13_serie);
fprintf(fileID2, '#define A1_13_SERIE %.8f \n', alfa1_13_serie);
fprintf(fileID2, '#define A2_13_SERIE %.8f \n', alfa2_13_serie);

%15 harmonica serie
fprintf(fileID2, '\n');
fprintf(fileID2, '//900Hz\n');
fprintf(fileID2, '#define B0_15_SERIE %.8f \n', beta0_15_serie);
fprintf(fileID2, '#define B1_15_SERIE %.8f \n', beta1_15_serie);
fprintf(fileID2, '#define B2_15_SERIE %.8f \n', beta2_15_serie);
fprintf(fileID2, '#define A0_15_SERIE %.8f \n', alfa0_15_serie);
fprintf(fileID2, '#define A1_15_SERIE %.8f \n', alfa1_15_serie);
fprintf(fileID2, '#define A2_15_SERIE %.8f \n', alfa2_15_serie);


% Fechar o arquivo
fclose(fileID2);
