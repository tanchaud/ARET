function NamesOfClusterConstituents = ClusterProportion(tree,brain_region, decValue,NamesOfClusterConstituents)
for z = 2:length(NamesOfClusterConstituents)
    ClusterLeaf = NamesOfClusterConstituents{z,1};
    isSubset = CheckSubset(brain_region,ClusterLeaf);
    
    if(isSubset == 1)
        NamesOfClusterConstituents = ClusterLeafPath(NamesOfClusterConstituents,tree,ClusterLeaf,decValue);
    end
    
end
end

