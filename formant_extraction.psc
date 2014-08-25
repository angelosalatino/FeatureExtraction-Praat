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
	if numberOfFiles > 0
		  for ifile to numberOfFiles
		     
		    #RISELEZIONO AD OGNI INCREMENTO LA LISTA
		    if n==1
			select Strings listA
			emo$ = "A"
		    elsif  n==2
			select Strings listE
			emo$ = "E"
		    elsif  n==3
			select Strings listF
			emo$ = "F"
		    elsif  n==4
			select Strings listL
			emo$ = "L"
		    elsif  n==5
			select Strings listN
			emo$ = "N"
		    elsif  n==6
			select Strings listT
			emo$ = "T"
		    elsif  n==7
			select Strings listW
			emo$ = "W"
		    endif   
		    
	fileName$ = Get string... ifile
	#Read from file... 'fileName$'
	name$ = fileName$ - ".wav"
	
	#PRENDO IL WAV
	select Sound 'name$'
	
		##############################
		#CREO OGGETTO PITCH
	    To Pitch (ac)... 0.0 50.0 15 off 0.1 0.6 0.01 0.35 0.14 500.0
	    ncolp=Get number of frames
	    
		path$="./data/FRM/"+name$+"_formant.txt"
	select Sound 'name$'
		#CREO OGGETTO FORMANTE
		To Formant (burg)... 0.0 5 5500 0.025 200
	    for i to ncolp
		#SELEZIONO PITCH FILE
		 select Pitch 'name$'

		 value=Get value in frame... i Hertz
	 	 if value != undefined
			
			   t = Get time from frame number... i
				select Formant 'name$'
			value1 = Get value at time... 1 t Hertz Linear
			value2 = Get value at time... 2 t Hertz Linear
			value3 = Get value at time... 3 t Hertz Linear
			value4 = Get value at time... 4 t Hertz Linear
			value5 = Get value at time... 5 t Hertz Linear
	

			if value1 = undefined
				value1=0
			endif
			if value2 = undefined
				value2=0
			endif
			if value3 = undefined
				value3=0
			endif
			if value4 = undefined
				value4=0
			endif
			if value5 = undefined
				value5=0
			endif
	
			fileappend 'path$' 't' 'value1' 'value2' 'value3' 'value4' 'value5' 'newline$'
			  endif
		     endfor
		
			#RIMUOVO I FILE
		    	select Pitch 'name$'
		    	Remove
		    	select Formant 'name$'
			Remove
		    	##############################
	
	endfor
	
endif

endfor
