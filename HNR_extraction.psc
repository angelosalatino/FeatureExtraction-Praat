#ELIMINO I FILE DI TESTO (SU CUI SALVERò I DATI ALLA FINE) SE GIA' PRESENTI

#CREO UN CICLO PER SELEZIONARE UNA LISTA ALLA VOLTA
for n to 7
  
  if n==1
	select Strings listA
  elsif  n==2
	select Strings listE
  elsif  n==3
	select Strings listF
  elsif  n==4
    select Strings listL
  elsif  n==5
    select Strings listN
  elsif  n==6
	select Strings listT
  elsif  n==7
	select Strings listW
  endif  
 
    numberOfFiles = Get number of strings

  # CREO UN CICLO FINO ALLA FINE DELLA LISTA
  for ifile to numberOfFiles
     
  if n==1
	select Strings listA
  elsif  n==2
	select Strings listE
  elsif  n==3
	select Strings listF
  elsif  n==4
    select Strings listL
  elsif  n==5
    select Strings listN
  elsif  n==6
	select Strings listT
  elsif  n==7
	select Strings listW
  endif 
    numberOfFiles = Get number of strings

    # APRO IL FILE
    fileName$ = Get string... ifile

    #ELIMINO .WAV DALLA STRINGA
    name$ = fileName$ - ".wav"

    #SELEZIONO IL FILE DAL PRAAT OBJECTS
    select Sound 'name$'

	#CREO OGGETTO LPC
	 To Harmonicity (cc)... 0.015 50 0.1 1.0
	
	
    #SELEZIONO IL FILE DAL PRAAT OBJECTS
     select Sound 'name$'

	silenTh = 0.02
	voiceTh = 0.60  
	  
    #CREO OGGETTO PITCH
    To Pitch (ac)... 0.0 50.0 15 off silenTh voiceTh 0.01 0.35 0.14 500.0
    ncolp=Get number of frames
    
	path$="./data/HNR_file/"+name$+"_hnr.txt"
	
    for i to ncolp
	#SELEZIONO PITCH FILE
	 select Pitch 'name$'
         value=Get value in frame... i Hertz
 	 if value != undefined
                       select Harmonicity 'name$'
		       hnr_value=Get value in frame... i
                       if hnr_value != -200
		            fileappend 'path$' 'hnr_value''newline$' 
		       endif
     endif
    endfor
        
        #RIMUOVO IL FILE PITCH
    	select Pitch 'name$'
    	Remove
        #RIMUOVO IL FILE LPC
    	select Harmonicity 'name$'
    	Remove
  endfor
endfor
  echo fine

# at the very end, remove any other objects sitting around - like the strings
#select all
#Remove
