
--select * from person where id in (78,123,34,11,198,178,123,156) ---inner join hotel_checkins hc on p.id=hc.person_id inner join witness_statements ws on ws.witness_id=p.id

select * from crime_scene where date=19871031 and location like '%Coconut%'
id   	date  	  location       	                                   description
75	   19871031	   Miami Mansion, Coconut Grove	                    During a masked ball, a body was found in the garden. Witnesses mentioned a hotel booking and suspicious phone activity.

select * from witness_statements where crime_scene_id=75
id  	crime_scene_id	  witness_id	     clue
83	      75	             37	             I overheard a booking at The Grand Regency.
89	       75	              42	         I noticed someone at the front desk discussing Room 707 for a reservation made yesterday.

select *from hotel_checkins where room_number=707 and check_in_date =19871030

id	person_id	hotel_name	check_in_date	room_number
78	78	The Grand Regency	19871030	707
79	123	The Grand Regency	19871030	707
109	34	The Grand Regency	19871030	707
119	11	The Grand Regency	19871030	707
147	198	The Grand Regency	19871030	707
171	198	The Grand Regency	19871030	707
175	178	The Grand Regency	19871030	707
183	198	The Grand Regency	19871030	707
188	123	The Grand Regency	19871030	707
193	156	The Grand Regency	19871030	707


select * from person where id in (78,123,34,11,198,178,123,156)
id	name                	occupation      	address
11	Antonio Rossi       	Auto Importer	    999 Dark Alley----------------
34	Susan Scott         	Psychologist	    861 Forest Drive
78	Frances Morgan	        Financial Analyst	909 Maplewood Street
123	Christopher Baker	    Insurance Agent	    990 Oakwood Court
156	Kathy Fisher        	Pharmacist	        667 Sycamorewood Drive
178	Lois Henderson       	Painter          	112 Juniperwood Way
198	Gladys Henderson	    Pharmacist	        334 Sycamorewood Drive


119       11	Antonio Rossi	Auto Importer	999 Dark Alley
4	Leonard Pierce	Business Magnate	101 Elite Ave	174	7	4	19871030	22:50	The fence needs painting soon.

58	Victor DiMarco	Jobless	707 Cedarwood Avenue	163	133	58	19871030	22:15	I will do it. Only if you give me that nice Lambo of yours.
select distinct (p.id),* from person p
inner join phone_records pr on pr.recipient_id=p.id  where call_date=19871030 and address like '%707%'
order by id
Results
id	id	name	       occupation	 address	            id	  caller_id	  recipient_id  	call_date	 call_time	      note
58	58	Victor DiMarco	Jobless	    707 Cedarwood Avenue	117	  11	       58	           19871030	      23:30   	Why did you kill him, bro? You should have left the carpenter do it himself!
58	58	Victor DiMarco	Jobless	707 Cedarwood Avenue	    163	   133	       58	19871030	22:15	I will do it. Only if you give me that nice Lambo of yours.



select * from person p inner join phone_records pr  on p.id=pr.caller_id where caller_id in(11,133)

Results
id	name	occupation	address	id	caller_id	recipient_id	call_date	call_time	note
11	Antonio Rossi	Auto Importer	999 Dark Alley	117	11	58	19871030	23:30	Why did you kill him, bro? You should have left the carpenter do it himself!
133	Unknown	Unknown	Unknown	163	133	58	19871030	22:15	I will do it. Only if you give me that nice Lambo of yours.



select * from person p inner join phone_records pr  on p.id=pr.caller_id inner join final_interviews fi on fi.person_id=p.id where caller_id in(11,133)


Results
id	name	occupation	address	id	caller_id	recipient_id	call_date	call_time	note	id	person_id	confession
11	Antonio Rossi	Auto Importer	999 Dark Alley	117	11	58	19871030	23:30	Why did you kill him, bro? You should have left the carpenter do it himself!	11	11	Im a peaceful person. I wouldnt kill anyone ever.
133	Unknown	Unknown	Unknown	163	133	58	19871030	22:15	I will do it. Only if you give me that nice Lambo of yours.	133	133	I was attending a wedding that day. I couldnt have killed anyone.



select * from person p inner join final_interviews fi on fi.person_id=p.id inner join witness_statements ws on ws.witness_id=p.id inner join
crime_scene cs  on cs.id = ws.crime_scene_id inner join vehicle_registry vr on vr.person_id=p.id left join catering_orders co on co.person_id =p.id
inner join hotel_checkins hc on hc.person_id=p.id inner join surveillance_records sr on sr.hotel_checkin_id=hc.id



select  * from surveillance_records sr
 inner join hotel_checkins hc on hc.id=sr.hotel_checkin_id where hotel_name ='The Grand Regency' and room_number= 707 and check_in_date =19871031


Results
id	hotel_checkin_id	note	id	person_id	hotel_name	check_in_date	room_number
88	88	Subject used hotel notary services for business documents.	88	134	The Grand Regency	19871031	707
98	98	Subject requested directions to nearest conference center location.	98	67	The Grand Regency	19871031	707
104	104	Subject used hotel dry cleaning service.	104	156	The Grand Regency	19871031

select * from vehicle_registry vr inner join person p on p.id=vr.person_id 
inner join final_interviews fi on fi.person_id=p.id where occupation ='Carpenter'

41	97	EFG901	Lamborghini	Countach	97	Marco Santos	Carpenter	112 Forestwood Way	97	97	I ordered the hit. It was me. You caught me.
