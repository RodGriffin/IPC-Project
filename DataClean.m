%% Read Data
% feature('DefaultCharacterSet','UTF-8');
% Lider = read_mixed_csv('C:\Users\Rockman\Desktop\Data IPC Project\Data Last\lider hasta 30-04-2015.csv',',');
% Odepa = read_mixed_csv('C:\Users\Rockman\Desktop\Data IPC Project\Data Last\odepa hasta 30-04-2015.csv',',');
% Easy = read_mixed_csv('C:\Users\Rockman\Desktop\Data IPC Project\Data Last\easy hasta 30-04-2015.csv',',');
% Chileautos = read_mixed_csv('C:\Users\Rockman\Desktop\Data IPC Project\Data Last\chileautos hasta 30-04-2015.csv',',');

%% Strip useless columns & clear formats
% **Lider**
Lider(2,:) = [];Lider(:,1:3) = [];Lider(:,9:11) = [];
% N�meros
Lider(:,3:5) = strrep(Lider(:,3:5),'$','');Lider(:,3:5) = strrep(Lider(:,3:5),'.','');
% Comillas
Lider = strrep(Lider,'"','');

% **Easy**
Easy(:,1:2) = [];Easy(:,10:12) = [];
% N�meros
Easy(:,4:6) = strrep(Easy(:,4:6),'$','');Easy(:,4:6) = strrep(Easy(:,4:6),'.','');
% Comillas
Easy = strrep(Easy,'"','');

% **Easy**
Easy(:,1:2) = [];Easy(:,10:12) = [];
% N�meros
Easy(:,4:6) = strrep(Easy(:,4:6),'$','');Easy(:,4:6) = strrep(Easy(:,4:6),'.','');
% Comillas
Easy = strrep(Easy,'"','');


%% Go through the variables and order for priceseries

%% Calculate statistics (descriptive and time-based)
