
function [ClusterLabels,ClusterParents, ClusterLabelsPercent] = ClusterProportionInPercentages(TemplatesDir,CC,img_cluster)


% ---------- Annotation Template  ------------ %
AnnotatedAllenBrain = spm_vol(strcat(TemplatesDir,'/','wANO.nii'));
AnnotatedAllenBrain = spm_read_vols(AnnotatedAllenBrain);
ClusterIntensitiesArr = AnnotatedAllenBrain(CC.PixelIdxList{1,img_cluster});

% Counts & Percent of unique intensities in Cluster intensities array %
a = ClusterIntensitiesArr;
[C,ia,ic] = unique(a);
a_counts = accumarray(ic,1);
value_counts = [C, a_counts];
value_counts(:,end+1) = (value_counts(:,2)/sum(value_counts(:,2)))*100;
ClusterIntensitiesFreq = value_counts;

ClusterIntensities = ClusterIntensitiesFreq(:,1);
ClusterIntensities = ClusterIntensities(find(ClusterIntensities));
ClusterLabelsPercent = ClusterIntensitiesFreq(:,3);
ClusterLabelsPercent = ClusterLabelsPercent(find(ClusterIntensities));
while((isempty(ClusterIntensities) == 1) && (isempty(ClusterLabelsPercent) == 1))
    break;
end

ANO = readtable(strcat(TemplatesDir,'/ANO.xlsx'));
[ClusterLabels, ClusterParents] = ClusterLabelling(ClusterIntensities,ANO);

