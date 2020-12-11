%function NamesOfClusterConstituents = ClusterLeafPath(NamesOfClusterConstituents,tree,ClusterLeaf,decValue)
function single_path = ClusterLeafPath(tree,ClusterLeaf)

% --Path of cluster leaf-- %
% load TREE
[table idxLUT] = buildtable(tree);
cluster_const = {};
paths_in_brain = {};

for c = 1:length(table)
    
    paths_in_brain{end + 1} = extractfield(table{c,1},'name');
end

for d = 1:length(paths_in_brain)
    single_path = paths_in_brain{1,d};
    
        indication_of_presence = find(ismember(single_path,ClusterLeaf));
        if(~isempty(indication_of_presence) == 1)
            % cluster_const{end + 1} = single_path(end - 1); %% Replace string 'Flocculus' in Cluster_leaves with..
            % disp(strcat('ClusterLeaf in path ',num2str(d)));
            % disp(single_path);
            %NamesOfClusterConstituents = strrep(NamesOfClusterConstituents,ClusterLeaf,single_path(end - decValue));
            break;
        end    
        
end

end
