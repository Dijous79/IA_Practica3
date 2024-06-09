(define (problem Base)
	(:domain Planification)
	(:objects 	d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
		    	ex1 ex2 ex3 ex4  - exercice
				n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n16 - nivell
	)
	 
	(:init
		(= (nivellO ex1) 1)
		(= (nivellF ex1) 1)
		(= (nivellO ex2) 1)
		(= (nivellF ex2) 9)
		(= (nivellO ex3) 1)
		(= (nivellF ex3) 4)
		(= (nivellO ex4) 1)
		(= (nivellF ex4) 2)
	
		(precursor ex1 ex2)
		(precursor ex1 ex3)
		(precursor ex1 ex4)


		(pendent ex1)
		(pendent ex2)
		(pendent ex3)
		(pendent ex4)


		(= (idDia d0) 0)
		(= (idDia d1) 1)
		(= (idDia d2) 2)
		(= (idDia d3) 3)
		(= (idDia d4) 4)
		(= (idDia d5) 5)
		(= (idDia d6) 6)
		(= (idDia d7) 7)
		(= (idDia d8) 8)
		(= (idDia d9) 9)
		(= (idDia d10) 10)
		(= (idDia d11) 11)
		(= (idDia d12) 12)
		(= (idDia d13) 13)
		(= (idDia d14) 14)
		(= (idDia d15) 15)

		(= (idNivell n1) 1)
		(= (idNivell n2) 2)
		(= (idNivell n3) 3)
		(= (idNivell n4) 4)
		(= (idNivell n5) 5)
		(= (idNivell n6) 6)
		(= (idNivell n7) 7)
		(= (idNivell n8) 8)
		(= (idNivell n9) 9)
		(= (idNivell n10) 10)
		(= (idNivell n11) 11)
		(= (idNivell n12) 12)
		(= (idNivell n13) 13)
		(= (idNivell n14) 14)
		(= (idNivell n15) 15)
		(= (idNivell n16) 16)
	)

	(:goal
    (forall (?ex - exercice) (not (pendent ?ex))
	)
  )
)