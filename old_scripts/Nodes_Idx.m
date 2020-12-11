function idx_nodes = Nodes_Idx(hierarchy)
numberOfDashes = zeros(length(hierarchy),1);
for a = 1:length(hierarchy)
    numberOfDashes(a) = length(find(hierarchy{a,1}=='-'));
end
a = min(numberOfDashes);
b = max(numberOfDashes);
idx_nodes = cell(b,1);
for q = 1:b
    if(a <= b )
        idx_nodes{q,1} = find(numberOfDashes == a);
    end
    a = a + 1;
end
end