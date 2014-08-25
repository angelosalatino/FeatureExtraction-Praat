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
	 To LPC (autocorrelation)... 16 0.025 0.015 200.0
	 
	#CREO MATRIX
    Down to Matrix (lpc)
	nRows=Get number of rows
	
    #SELEZIONO IL FILE DAL PRAAT OBJECTS
     select Sound 'name$'

	silenTh = 0.02
	voiceTh = 0.60  
	  
    #CREO OGGETTO PITCH
    To Pitch (ac)... 0.0 50.0 15 off silenTh voiceTh 0.01 0.35 0.14 500.0
    ncolp=Get number of frames
    
	path$="./data/LPC_file/"+name$+"_lpc.txt"
	
    for i to ncolp
	#SELEZIONO PITCH FILE
	 select Pitch 'name$'

         value=Get value in frame... i Hertz
 	 if value != undefined
           for x to nRows
                       mat$=name$+"_lpc"
    	               select Matrix 'mat$'
		       lpc_value=Get value in cell... x i
			   fileappend 'path$' 'lpc_value' 
           endfor 		   
           fileappend 'path$' 'newline$'
          endif
     endfor
        
        #RIMUOVO IL FILE PITCH
    	select Pitch 'name$'
    	Remove
        #RIMUOVO IL FILE LPC
    	select LPC 'name$'
    	Remove
        #RIMUOVO IL FILE MATRIX
	mat$=name$+"_lpc"
    	select Matrix 'mat$'
    	Remove
  endfor
endfor
  echo fine

# at the very end, remove any other objects sitting around - like the strings
#select all
#Remove
