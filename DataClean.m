%% Read Data
feature('DefaultCharacterSet','UTF-8');
Lider = read_mixed_csv('C:\Users\Rockman\Desktop\Data IPC Project\Data Last\lider hasta 30-04-2015.csv',',');
Odepa = read_mixed_csv('C:\Users\Rockman\Desktop\Data IPC Project\Data Last\odepa hasta 30-04-2015.csv',',');
Easy = read_mixed_csv('C:\Users\Rockman\Desktop\Data IPC Project\Data Last\easy hasta 30-04-2015.csv',',');
Chileautos = read_mixed_csv('C:\Users\Rockman\Desktop\Data IPC Project\Data Last\chileautos hasta 30-04-2015.csv',',');

%% Strip useless columns & clear formats
% **Lider**
if size(Lider,2)> 10 
    % Ordenamos las filas corridas
    Lider(~cellfun('isempty', Lider(:,13)),:) = [];
    N = size(Lider,1);
    for i =2:N
        if ~isempty(Lider{i,12})
            Lider(i,6:12)=Lider(i,7:13);            
        end
    end
    Lider(2,:) = [];Lider(:,1:3) = [];Lider(:,9:11) = [];
    % Números
    Lider(:,3:5) = strrep(Lider(:,3:5),'$','');Lider(:,3:5) = strrep(Lider(:,3:5),'.','');
    % Comillas
    Lider = strrep(Lider,'"','');
    
    % **Easy**
    Easy(:,1:2) = [];Easy(:,10:12) = [];
    % Números
    Easy(:,4:6) = strrep(Easy(:,4:6),'$','');Easy(:,4:6) = strrep(Easy(:,4:6),'.','');
    % Comillas
    Easy = strrep(Easy,'"','');
   
    % **Odepa**
    Odepa(:,1) = [];Odepa(:,14:17) = [];
    % Números
    Odepa(:,5:8) = strrep(Odepa(:,5:8),'$','');Odepa(:,5:8) = strrep(Odepa(:,5:8),'.','');
    % Comillas
    Odepa = strrep(Odepa,'"','');
    % Acentos
%     Odepa = strrep(Odepa,'Ã³','ó');Odepa = strrep(Odepa,'Ãº','ú');Odepa = strrep(Odepa,'Ã­','í');Odepa = strrep(Odepa,'Ã¡','á');Odepa = strrep(Odepa,'','');Odepa = strrep(Odepa,'Ã±','ñ');

    % **Chileautos**
    % Ordenamos las filas corridas
%     Aux1 = Chileautos(:,23);
%     Aux2 = Chileautos(:,2);
%     N = size(Chileautos,1);
%     for i =2:N
%         tic
%         if ~isempty(Aux2{i})
%             Aux1{i-1}=Aux2{i};
%             Chileautos(i,:)=[];Aux1(i)=[];Aux2(i)=[];
%             i = i-1;
%             N = N-1;
%         end
%         toc
%     end
%     Chileautos(:,23) = Aux1;
%     Chileautos(:,2) = Aux2;
%     % Números
%     Chileautos(:,7:10) = strrep(Chileautos(:,7:10),'$','');Chileautos(:,7:10) = strrep(Chileautos(:,7:10),'.','');
%     Chileautos(:,5) = strrep(Chileautos(:,5),'_.','');Chileautos(:,17) = strrep(Chileautos(:,17),'.','');
%     % Comillas
%     Chileautos = strrep(Chileautos,'"','');

end



%% Go through the variables and order for priceseries
% Lider
[N,M] = size(Lider);
Lider(:,1) = strcat(Lider(:,2),{' - '},Lider(:,1));
Lider(:,2) = [];
NamesGroup = GetNamesGroup(Lider,'Lider');
LiderSeries = NamesGroup;
LiderSeries{1,3}=[];
for i = 2:N
    name = Lider{i,1};
    pos = findcellv(NamesGroup,name);
    LiderSeries{pos,3}=[LiderSeries{pos,3};[datenum(Lider{i,7}),str2double(Lider{i,2}),str2double(Lider{i,3}),str2double(Lider{i,4})]];
end


%% Calculate statistics (descriptive and time-based)

