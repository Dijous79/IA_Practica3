(define (domain Planification)
  (:requirements :adl :typing :fluents)
  (:types exercice day nivell - obj)

  (:predicates 
	(preparador ?ex - exercice ?ex2 - exercice)
	(pendent ?ex - exercice)
	(assignat ?d - day ?ex - exercice)
  )
  (:functions
  (nivellO ?ex - exercice)
  (nivellF ?ex - exercice)
  (nivellD ?d - day ?ex - exercice)
	(idDia ?d - day)
  (idNivell ?n - nivell)
  )

    (:action assignaExercici
    :parameters (?d - day ?ex - exercice ?n - nivell)
    :precondition (and (not (assignat ?d ?ex)) (<= (idNivell ?n) (nivellF ?ex))
                  (or (= (idNivell ?n) (nivellO ?ex))
                      (exists (?d2 - day)
                        (and
                          (< (idDia ?d2) (idDia ?d))
                          (and (assignat ?d2 ?ex) (= (+ (nivellD ?d2 ?ex) 1) (idNivell ?n)))
                        )
                      )
                  )
                  (imply (exists (?exAux - exercice) (preparador ?exAux ?ex)) (exists (?exAux - exercice) (and (preparador ?exAux ?ex) (assignat ?d ?exAux))))
    )
    :effect (and (assignat ?d ?ex) (assign (nivellD ?d ?ex) (idNivell ?n)) (when (= (idNivell ?n) (nivellF ?ex)) (not(pendent ?ex)))
    )
  )

)