inputDirectory = 'DATASET MIDI';
midifiles = RemovePoly(inputDirectory);
dst = [];
for n = 1:length(midifiles)
tuneN = readmidi(midifiles{n});
for m = 1:length(midifiles)
tuneM = readmidi(midifiles{m});
dst(n,m) = meldistance(tuneN,tuneM,'pcdist1','euc');
end
end
dstTr = tril(dst);
tree = linkage(dstTr,'average');
dendrogram(tree);
