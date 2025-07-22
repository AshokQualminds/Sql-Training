select *,count(*) from crime_scene where description like '%heart%'
id  	date	        location	                       description
48	19870520	Fontainebleau Hotel             	The Heart of Atlantis necklace disappeared. Many guests were questioned but only two of them gave valuable clues. One of them is a really famous actor. The other one is a woman who works as a consultant for a big company and her first name ends with "an".

select * from guest where occupation ='Actor' result
id   	name	             occupation    	invitation_code
43	  Ruby Baker	          Actor      	VIP-R
129 	Clint Eastwood      	Actor	     VIP-G-------------correct result
164 	River Bowers	        Actor	      VIP-B
189 	Sage Dillon	              Actor	        VIP-G
192	  Phoenix Pitts             	Actor      	VIP-G

select * from guest where  name like '%an%' and occupation = 'Consultant'
id   	name	                 occupation        	invitation_code
116   	Vivian Nair	                  Consultant	VIP-R    --- correct result
-----------138  	Phoenix Sandoval	            Consultant	VIP-G   ----

select * from witness_statements where guest_id in (116,43,129,164,189,192)
id	    guest_id         	clue
16      	116      	I saw someone holding an invitation ending with "-R". He was wearing a navy suit and a white tie.
50	        129      	I overheard someone say, "Meet me at the marina, dock 3.

select * from guest where invitation_code like'%-R%'  --- 68 records found
select * from attire_registry where note like '%navy% %white% %tie%' ---- 8 records found guest_id in (156,145,105,112,190,189,167,190)

select *from guest g inner join attire_registry ar on g.id=ar.guest_id where note like '%navy% %white% %tie%' and invitation_code like '%-R%'---  result 105 Mike Manning 

id	   name	         occupation                   	invitation_code	   i      guest_id       	note
105	   Mike Manning	    Wealth Reallocation Expert	       VIP-R	   48	      105	      navy suit, white tie

select * from   marina_rentals where dock_number = 3 and rental_date = 19870520
--guest inner join marina rentals where dock_number


---select * from   marina_rentals where dock_number = 3 and rental_date = 19870520
--guest inner join marina rentals where dock_number
select * from final_interviews 

--select * from guest g inner join final_interviews fi on g.id=fi.guest_id
--where occupation = 'Wealth Reallocation Expert' and invitation_code ='VIP-R'


victim is 105  Mike Manning	 