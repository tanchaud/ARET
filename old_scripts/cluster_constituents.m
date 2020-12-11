%% Cluster Constituents %%

% --Locate Cluster Leaves-- %% 
load('Regions_in_Cluster_gtm');
hierarchy = regions_in_cluster; 
idx_nodes = Nodes_Idx(hierarchy); 
root_idx = idx_nodes{1,1};
leaves_idx = []; 
for i=2:length(root_idx)
leaves_idx(end + 1) = root_idx(i)-1;
end
Cluster_leaves = hierarchy(leaves_idx);
freq_table_Cluster_leaves = tabulate(Cluster_leaves);

% --Locate Brain Leaves-- % 
x_br = load('WB_Reghierarchy');
hierarchy_br = x_br.Regions_hierarchy; 
numberOfDashes = zeros(length(hierarchy_br),1); 
for a = 1:length(hierarchy_br)
numberOfDashes(a) = length(find(hierarchy_br{a,1}=='-')); 
end  
brain_leaves = {}; 
for b = 2:length(numberOfDashes)
    if(numberOfDashes(b) < numberOfDashes(b-1))
        brain_leaves{end + 1,1} = hierarchy_br(b-1); 
    end
end

% --Check if cluster leaf is a part of the entered brain region-- %    
addpath(genpath('~/Annotation_Task/')); 
brain_region = input('Enter region of interest: ');
Int_region = annotation_tan(brain_region);
Cluster_leaves = freq_table_Cluster_leaves(:,1); 
Cluster_leaf = input('Enter name of leaf without the ''-'' characters from Cluster_leaves: '); 
Int_Cluster_leaf = annotation_tan(Cluster_leaf);
isSubset = all(ismember(Int_Cluster_leaf,Int_region)); 

% % if (isSubset == 1)
% % Find path of cluster leaf.
% % Find brainleaf in that path. 
% % cluster_const = brainleaf - 1; (for Isocortex) 

%% --Path of cluster leaf-- % 
load TREE
[table idxLUT] = buildtable(tree); 
cluster_const = {};
paths_in_brain = {};

for i = 1:length(table)
    
    paths_in_brain{end + 1} = extractfield(table{i,1},'name'); 
end

for j = 1:length(paths_in_brain)
    single_path = paths_in_brain{1,j}; 
    indication_of_presence = find(ismember(single_path,'Flocculus'));
    if(~isempty(indication_of_presence) == 1)
        cluster_const{end + 1} = single_path(end - 1); 
    end
end

%% 

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









%% -- Displaying results -- %% 
% 
% figure
% x = cell2mat(freq_table_reqParts(:,2))'; 
% p = pie(x);
% pText = findobj(p,'Type','text');
% 
% percentValues = get(pText,'String');
% txt = freq_table_reqParts(:,1);
% combinedtxt = strcat(txt,percentValues);
% for i = 1:length(combinedtxt)
%     
%     pText(i).String = combinedtxt(i);
% end
% 
% t = title('Cluster Constituents');
% t.Color = 'red'; 
% %t.FontSize = '15'; 
% 
% figure
% x = cell2mat(freq_table_leaves(:,2))'; 
% p = pie(x);
% pText = findobj(p,'Type','text');
% percentValues = get(pText,'String');
% txt = freq_table_leaves(:,1);
% combinedtxt = strcat(txt,percentValues);
% for i = 1:length(combinedtxt)
%     
%     pText(i).String = combinedtxt(i);
% end
% 
% t = title('Cluster Constituents (Leaves)');
% t.Color = 'red'; 