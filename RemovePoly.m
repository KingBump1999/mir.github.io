function [cleanedMidi] = RemovePoly(inputDirectory)
%Loads midi file names into a table and removes any files that are not
%monophonic. Needed to carry out distance caluclation 
    
    homeDirectory = pwd() 
    cd(inputDirectory);
    midiFiles = dir('*.mid')
    midiFiles = struct2table(midiFiles);
    midiFiles = midiFiles.name; 
    
    cells2delete = [];

    for n = 1 : length(midiFiles)
    
        nmat = readmidi(midiFiles{n});
    
        if ismonophonic(nmat) == 0
            cells2delete(n) = 1;
        else
            cells2delete(n) = 0;
        end
        
    end

    cells2delete = logical(cells2delete);
    midiFiles(cells2delete) = []; 
    cd(homeDirectory);
    cleanedMidi = midiFiles; 

end