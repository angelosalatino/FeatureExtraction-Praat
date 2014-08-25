


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
	
	name$ = fileName$ - ".wav"

	silenTh = 0.02
	voiceTh = 0.60

	#PRENDO IL WAV
	select Sound 'name$'
   		
	To Pitch (ac)... 0.0 50.0 15 off silenTh voiceTh 0.01 0.35 0.14 500.0
	
	numFrame=Get number of frames
	    for i to numFrame
		time=Get time from frame number... i
		value=Get value in frame... i Hertz
		if value = undefined
			value=0
		endif
		path$="./data/PITCH/"+name$+"_pitch.txt"
		fileappend 'path$' 'time' 'value' 'newline$'
	    endfor
		select Pitch 'name$'
		Remove
	endfor

endfor
