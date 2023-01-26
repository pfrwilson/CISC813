(define (domain helloworld)

    (:requirements :strips
    )

    (:constants
        n0 n1 n2
    )

    (:predicates
        (step ?n)
    )

    (:action hello
        :precondition (and (step n0))
        :effect (and (step n1)
            (not (step n0)))
    )

    (:action world
        :precondition (and (step n1))
        :effect (and (step n2)
            (not (step n1)))
    )

)