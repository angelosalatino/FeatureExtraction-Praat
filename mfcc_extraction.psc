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
		   		
			To MFCC... 12 0.06 0.015 100 100 0.0
			To Matrix
			Transpose
	


		path$="./data/MFCC/"+name$+"_mfcc.txt"
		Save as headerless spreadsheet file... 'path$'
		#fileappend 'path$' 'mat' 'newline$'
	    endfor
		select MFCC 'name$'
		Remove
		select Matrix 'name$'
		Remove
		trn$ = "_transposed"
		transp$ = name$ +  trn$
		
		select Matrix 'transp$'
		Remove
endif

endfor
