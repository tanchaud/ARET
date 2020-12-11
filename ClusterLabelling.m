
function [ClusterLabels, ClusterParents] = ClusterLabelling(ClusterIntensities,ANO)

% Description: Labelling detected brain regions in each cluster blob in the
% cluster image. 

% -----------------------------------------%
% Tanusree Chaudhuri
% Max Planck Institute of Psychiatry, Munich
% tanusree_chaudhuri@psych.mpg.de
% -----------------------------------------%
Region = table2array(ANO(:,1));
ID = table2array(ANO(:,4));
colHex = table2array(ANO(:,2));
Children = table2array(ANO(:,5));

Region_index = {}; ClusterLabels = {}; ClusterParents = {};
for i = 1:length(ClusterIntensities)
        
    Region_index{end + 1} = find(ID == ClusterIntensities(i));
    ClusterLabels{end + 1} = Region(Region_index{end});
    

    % if a cluster label is a leaf continue, else leave the label
    % as it is.
    ClusterLabel_children = str2num(Children{Region_index{end},1})';
    
    if(isempty(ClusterLabel_children) == 1) % if the label is a leaf, find parent. 
        
        dec = 1;
        arr = Children{Region_index{end} - dec,1};  arr = str2num(arr);
        cond = isempty(find(ismember(arr,ClusterIntensities(i)), 1));
        while cond == 1
            dec = dec + 1;
            arr = Children{Region_index{end} - dec,1};
            arr = str2num(arr);
            cond = isempty(find(ismember(arr,ClusterIntensities(i)), 1));
            
        end
        ClusterParents{end + 1} = Region(Region_index{end} - dec,1);
    else % if the label is a parent, leave parent column in output table empty. 
        ClusterParents{end +1} = [];
        
    end
    
    disp(i);
end
 
ClusterLabels = ClusterLabels';
end