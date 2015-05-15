function NamesGroup = GetNamesGroup(A,tipo)
switch tipo
    case 'Lider'
        Aux = [A(:,1),A(:,6)];
        NamesGroup = unique(Aux(:,1));
        for i = 1:size(NamesGroup,1)
            tic
            x = findcellv(Aux(:,1),NamesGroup{i});
            NamesGroup{i,2} = Aux{x,2};
            toc
        end
end

end