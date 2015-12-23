#BOOM LANGUAGE
@(Defined by )[Complier| @SJTU_SE|]
**Entrance** : The function : fuse
- **Def.** �� DEF fuse() AS NUM! { }! 
- **Meaning**:  (������)


**Demo:** : Eight Queen
``` python
	DEF line AS NUM[8]!
	DEF answer AS NUM!
	
	DEF show() AS NUM    # the func for show the Queens
	{ 
		DEF i AS NUM! 
		DEF j AS NUM! 
		LET i AS 0! 
		LET j AS 0! 
		LOOP(i<8) 
		{  
			LOOP(j<8)  
			{
			
				 ?(line[i]=j             ) {printcha(81)!}!#print 'Q'
				 ?(line[i]>j OR line[i]<j) {printcha(42)!}!#print '*'  
				  
				 LET j AS j+1! 
			}!  
				 LET j AS 0!  
				 printcha(10)!  # print '\n'
				 LET i AS i+1! 
		}! 
		LET answer AS answer+1! 
		printnum(answer)! 
		printcha(10)! 
		inputcha()! 
		RET 0!
	}!
	
	DEF judge(NUM n) AS NUM
	{ 
		DEF i AS NUM! 
		LET i AS 0! LOOP(i<n) 
		{
			  ?(line[n]=line[i]    ) {RET 1!}!  
			  ?(line[n]-n=line[i]-i) {RET 1!}!  
			  ?(line[n]+n=line[i]+i) {RET 1!}!  
			  LET i AS i+1! 
		}! 
		RET 0!
	}!
	
	DEF control(NUM n) AS NUM
	{ 
		DEF k AS NUM! 
		LET k AS 8! 
		DEF temp AS NUM! 
		LET line[n] AS 0! 
		LOOP(line[n]<k) 
		{  
			LET temp AS judge(n)!  
			?(temp =0)  {?(n>7 OR n<7){control(n+1)!}!
			?(n=7    )  {show()!}!  
		}!  
		LET line[n] AS line[n]+1! }! 
		RET 0!
	}!
	
	DEF fuse() AS NUM{ control(0)! RET 0!}!
	# fuse ,the main entrance to the bomb :)
	@BOOM!
```

**Result:** : Eight Queen
``` python
	...
	Q*******
	******Q*
	***Q****
	*****Q**
	*******Q
	*Q******
	****Q***
	**Q*****
	3
	...
```
