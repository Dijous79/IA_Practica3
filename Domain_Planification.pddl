(define (domain Planification)
  (:requirements :adl :typing :fluents)
  (:types exercice day nivell - obj)

  (:predicates 
	(precursor ?ex - exercice ?ex2 - exercice)
	(preparador ?ex - exercice ?ex2 - exercice)
	(pendent ?ex - exercice)
	(ordres ?ex - exercice)
	(assignat ?d - day ?ex - exercice)
  (nivellPrevi ?n - nivell ?n2 - nivell)
	(previousInDay ?d - day ?ex1 - exercice ?ex2 - exercice)

  )
  (:functions
  (nivellO ?ex - exercice)
  (nivellF ?ex - exercice)
  (nivellD ?d - day ?ex - exercice)
	(idDia ?d - day)
  (idNivell ?n - nivell)
  )
  (:action assignaExerciciAmbNouNivell
    :parameters (?d - day ?ex - exercice ?n - nivell)
    :precondition (and (not (assignat ?d ?ex)) (<= (idNivell ?n) (nivellF ?ex))
                  (exists (?n2 - nivell ?d2 - day)
                    (and
                      (or (nivellPrevi ?n2 ?n) (= (idNivell ?n2) (idNivell ?n)))
                      (< (idDia ?d2) (idDia ?d))
                      (or
                        (and (assignat ?d2 ?ex) (or (= (nivellD ?d2 ?ex) (idNivell ?n2)) (= (nivellD ?d2 ?ex) (idNivell ?n))))
                        (= (idNivell ?n) (nivellO ?ex))
                      )
                      (forall (?exAux - exercice) 
                        (imply (preparador ?exAux ?ex) (assignat ?d ?exAux))
                      )
                    )
                  )
    )
    :effect (and (assignat ?d ?ex) (assign (nivellD ?d ?ex) (idNivell ?n))
    )
  )

  (:action check
      :parameters (?ex - exercice)
      :precondition (exists (?d - day) (and (assignat ?d ?ex) (= (nivellD ?d ?ex) (nivellF ?ex)))
      )
      :effect (not (pendent ?ex))
  )
  

)