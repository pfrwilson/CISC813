(define (domain helloworld)

    (:requirements
        :strips
    )

    (:predicates
        (step0)
        (step1)
        (step2)
    )

    (:action hello
        :precondition (and (step0))
        :effect (and (step1)
                     (not (step0)))
    )


    (:action world
        :precondition (and (step1))
        :effect (and (step2)
                     (not (step1)))
    )

)