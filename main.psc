
Create Strings as file list... listA ../A/*.wav
numberOfFilesA = Get number of strings

Create Strings as file list... listE ../E/*.wav
numberOfFilesE = Get number of strings

Create Strings as file list... listF ../F/*.wav
numberOfFilesF = Get number of strings

Create Strings as file list... listL ../L/*.wav
numberOfFilesL = Get number of strings

Create Strings as file list... listN ../N/*.wav
numberOfFilesN = Get number of strings

Create Strings as file list... listT ../T/*.wav
numberOfFilesT = Get number of strings

Create Strings as file list... listW ../W/*.wav
numberOfFilesW = Get number of strings

for ifile to numberOfFilesA
  select Strings listA
  fileName$ = Get string... ifile
  Read from file... ../A/'fileName$'
endfor

for ifile to numberOfFilesE
  select Strings listE
  fileName$ = Get string... ifile
  Read from file... ../E/'fileName$'
endfor

for ifile to numberOfFilesF
  select Strings listF
  fileName$ = Get string... ifile
  Read from file... ../F/'fileName$'
endfor

for ifile to numberOfFilesL
  select Strings listL
  fileName$ = Get string... ifile
  Read from file... ../L/'fileName$'
endfor

for ifile to numberOfFilesN
  select Strings listN
  fileName$ = Get string... ifile
  Read from file... ../N/'fileName$'
endfor

for ifile to numberOfFilesT
  select Strings listT
  fileName$ = Get string... ifile
  Read from file... ../T/'fileName$'
endfor

for ifile to numberOfFilesW
  select Strings listW
  fileName$ = Get string... ifile
  Read from file... ../W/'fileName$'
endfor

#RICHIAMO I FILE PER LE ESTRAZIONI
#include pitch_extraction.psc
include pitch_extraction_mod.psc
include formant_extraction.psc
include intensity_extraction.psc
include mfcc_extraction.psc
include LPC_extraction.psc
include HNR_extraction.psc
include pitch_extraction_perc&slope.psc

select all
Remove
