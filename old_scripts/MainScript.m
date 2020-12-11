% ---------------------------------------------------------%
%%%% --Determining proportion of Cluster Constituents-- %%%%
% ---------------------------------------------------------%
% by Tanusree Chaudhuri
% Documentation:- 
%%% The cluster is a nifti file that depicts regions in the brain where changes were
%%% observed in a study involving several mice. 

clear all;clc;
addpath ~/toolboxes/spm12;
SPMJobs_in_ClusterTask;
ClusterMasks_files = {
    'Mask_rW_ABAPgtM_pu0_005_20'
    'Mask_rW_ABAPltM_pu0_005_20'
    };

for i = 1:length(ClusterMasks_files)
  
    
    % ------ Cluster Constituents.------ %%
    ClusterMask = niftiread(ClusterMasks_files{i,1});
    IndicesOfClusterIntensities = find(ClusterMask == 1);
    AnnotatedAllenBrain = niftiread('ANO_x10.nii');
    ClusterIntensitiesArr = AnnotatedAllenBrain(IndicesOfClusterIntensities);
    
    % ------ Cluster Known Constituents.------ %%
    addpath(genpath('/home/tchaudhuri/toolboxes/antx-master/freiburgLight/allen'));
    addpath(genpath('~/code/matlab/Annotation_Task'));
    load TREE
    [table idxLUT] = buildtable(tree);
    RegionsHierarchyOfAllenBrain = extractfield(idxLUT,'nameinlist')';
    IntensityHierarchyOfAllenBrain = {};
    for j = 1:length(idxLUT)
        IntensityHierarchyOfAllenBrain{end + 1} = extractfield(idxLUT(j),'children');
    end
    IntensityHierarchyOfAllenBrain = IntensityHierarchyOfAllenBrain';
    ClusterKnownConstituents = {};
    for k = 1:length(ClusterIntensitiesArr)
        for l = 1:length(IntensityHierarchyOfAllenBrain)
            idx = find(IntensityHierarchyOfAllenBrain{l,1} == ClusterIntensitiesArr(k));
            if(isempty(idx) == 0)
                ClusterKnownConstituents{end + 1} = RegionsHierarchyOfAllenBrain{l,1};
            end
        end
    end
    ClusterKnownConstituents = ClusterKnownConstituents';
    save(strcat('Paths_',ClusterMasks_files{i,1}),'ClusterKnownConstituents');
    
    %  --Proportion of cluster constituents in voxels-- %
    ClusterSizeInVoxels = length(ClusterIntensitiesArr);
    hierarchy = ClusterKnownConstituents;
    idx_nodes = Nodes_Idx(hierarchy);
    KnownCluster_SizeInVoxels = length(idx_nodes{1,1});
    UnknownCluster_SizeInVoxels = ClusterSizeInVoxels - KnownCluster_SizeInVoxels;
    
    % --Names of Cluster Leaves-- %%
    root_idx = idx_nodes{1,1};
    leaves_idx = [];
    for m=2:length(root_idx)
        leaves_idx(end + 1) = root_idx(m)-1;
    end
    Cluster_leaves = hierarchy(leaves_idx);
    Cluster_leaves = strip(Cluster_leaves,'left','-');
    
    name = 'Unknown';[ClusterUnknown{1:UnknownCluster_SizeInVoxels(1)}] = deal(name);
    ClusterUnknown = ClusterUnknown';
    ClusterKnown = Cluster_leaves;
    ClusterConstituents = [ClusterUnknown;ClusterKnown];
    ClusterConstituents = tabulate(ClusterConstituents);
    NamesOfClusterConstituents = ClusterConstituents(:,1);
    
    for z = 2:length(NamesOfClusterConstituents)
        ClusterLeaf = NamesOfClusterConstituents{z,1};
        
        isSubset_Cerebrum = CheckSubset('Cerebrum',ClusterLeaf);
        isSubset_BrainStem = CheckSubset('Brain stem',ClusterLeaf);
        isSubset_Cerebellum = CheckSubset('Cerebellum',ClusterLeaf);
        if(isSubset_Cerebrum == 1)
            isSubset_Isocortex = CheckSubset('Isocortex',ClusterLeaf);
            isSubset_OLF = CheckSubset('Olfactory areas',ClusterLeaf);
            isSubset_HPF = CheckSubset('Hippocampal formation',ClusterLeaf);
            if(isSubset_Isocortex == 1)
                Path = ClusterLeafPath(tree,ClusterLeaf);
                NamesOfClusterConstituents = strrep(NamesOfClusterConstituents,ClusterLeaf,Path(end - 1));
            end
            
            if(isSubset_OLF == 1)
                Path = ClusterLeafPath(tree,ClusterLeaf);
                NamesOfClusterConstituents = strrep(NamesOfClusterConstituents,ClusterLeaf,Path(end - 1));
            end
            
            
            if(isSubset_HPF == 1)
                isSubset_HIP = CheckSubset('Hippocampal region',ClusterLeaf);
                isSubset_RHP = CheckSubset('Retrohippocampal region',ClusterLeaf);
                if(isSubset_HIP == 1)
                    isSubset_FC = CheckSubset('Fasciola cinerea',ClusterLeaf);
                    isSubset_IG = CheckSubset('Induseum griseum',ClusterLeaf);
                    if((isSubset_FC == 1) || (isSubset_IG == 1))
                        Path = ClusterLeafPath(tree,ClusterLeaf);
                        NamesOfClusterConstituents = strrep(NamesOfClusterConstituents,ClusterLeaf,Path(end - 0));
                    else
                        Path = ClusterLeafPath(tree,ClusterLeaf);
                        NamesOfClusterConstituents = strrep(NamesOfClusterConstituents,ClusterLeaf,Path(end - 1));
                    end
                end
                if(isSubset_RHP == 1)
                    Path = ClusterLeafPath(tree,ClusterLeaf);
                    NamesOfClusterConstituents = strrep(NamesOfClusterConstituents,ClusterLeaf,Path(end - 1));
                end
                
            end
            
            isSubset_CTXsp = CheckSubset('Cortical subplate',ClusterLeaf);
            if(isSubset_CTXsp == 1)
                Path = ClusterLeafPath(tree,ClusterLeaf);
                NamesOfClusterConstituents = strrep(NamesOfClusterConstituents,ClusterLeaf,Path(end - 0));
            end
            
            isSubset_CNU = CheckSubset('Cerebral nuclei',ClusterLeaf);
            if(isSubset_CNU == 1)
                isSubset_CNU = CheckSubset('Olfactory tubercle',ClusterLeaf);
                if(isSubset_CNU == 1)
                    Path = ClusterLeafPath(tree,ClusterLeaf);
                    NamesOfClusterConstituents = strrep(NamesOfClusterConstituents,ClusterLeaf,Path(end - 1));
                else
                    Path = ClusterLeafPath(tree,ClusterLeaf);
                    NamesOfClusterConstituents = strrep(NamesOfClusterConstituents,ClusterLeaf,Path(end - 0));
                end
            end
        end
        
        if(isSubset_BrainStem == 1)
            isSubset_TH = CheckSubset('Thalamus',ClusterLeaf);
            isSubset_HY = CheckSubset('Hypothalamus',ClusterLeaf);
            isSubset_MB = CheckSubset('Midbrain',ClusterLeaf);
            isSubset_HB = CheckSubset('Hindbrain',ClusterLeaf);
            
            if(isSubset_TH == 1)
                Path = ClusterLeafPath(tree,ClusterLeaf);
                NamesOfClusterConstituents = strrep(NamesOfClusterConstituents,ClusterLeaf,Path(end - 0));
            end
            %         if(isSubset_HY == 1)
            %
            %         end
            if(isSubset_MB == 1)
                Path = ClusterLeafPath(tree,ClusterLeaf);
                NamesOfClusterConstituents = strrep(NamesOfClusterConstituents,ClusterLeaf,Path(end - 0));
            end
            if(isSubset_HB == 1)
                Path = ClusterLeafPath(tree,ClusterLeaf);
                NamesOfClusterConstituents = strrep(NamesOfClusterConstituents,ClusterLeaf,Path(end - 0));
            end
        end
        
        if(isSubset_Cerebellum == 1)
            isSubset_VERM = CheckSubset('Vermal regions',ClusterLeaf);
            isSubset_HEM = CheckSubset('Hemispheric regions',ClusterLeaf);
            isSubset_CBN = CheckSubset('Cerebellar nuclei',ClusterLeaf);
            if(isSubset_VERM == 1)
                Path = ClusterLeafPath(tree,ClusterLeaf);
                VERM_id = find(contains(Path,'Vermal regions'));
                NamesOfClusterConstituents = strrep(NamesOfClusterConstituents,ClusterLeaf,Path(VERM_id + 1));
            end
            if(isSubset_HEM == 1)
                Path = ClusterLeafPath(tree,ClusterLeaf);
                HEM_id = find(contains(Path,'Hemispheric regions'));
                NamesOfClusterConstituents = strrep(NamesOfClusterConstituents,ClusterLeaf,Path(HEM_id + 1));
            end
            if(isSubset_CBN == 1)
                Path = ClusterLeafPath(tree,ClusterLeaf);
                CBN_id = find(contains(Path,'Cerebellar nuclei'));
                NamesOfClusterConstituents = strrep(NamesOfClusterConstituents,ClusterLeaf,Path(CBN_id + 1));
            end
        end
    end
    ClusterConstituents(:,1) = NamesOfClusterConstituents;
    
    
    
       %% DISPLAY RESULTS
    
       x = cell2mat(ClusterConstituents(:,2));
       p = pie(x);
    
       % Get the percent contributions for each pie slice from the String properties of the text objects.Then, specify the text that you want in the cell array txt. Concatenate the text with the associated percent values in the cell array combinedtxt.
    
       pText = findobj(p,'Type','text');
       percentValues = get(pText,'String');
       NamesOfClusterConstituents = ClusterConstituents(:,1);
       txt = strcat(NamesOfClusterConstituents,': ');
       combinedtxt = strcat(txt,percentValues);
       %disp(combinedtxt); 
       
%        % Change the labels by setting the String properties of the text objects to combinedtxt.
     
%        pText(1).String = combinedtxt(1);
%        pText(2).String = combinedtxt(2);
%        pText(3).String = combinedtxt(3);
%        pText(4).String = combinedtxt(4);
%        pText(5).String = combinedtxt(5);
%        pText(6).String = combinedtxt(6);
%        pText(7).String = combinedtxt(7);
%        pText(8).String = combinedtxt(8);
%        
end












