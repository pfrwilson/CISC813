(define (domain setarc)

    (:requirements :strips
    )

    (:predicates
        (top ?s)
        (on ?s1 ?s2)
    )

    (:action shift

        :parameters ( ?source ?target ?below_source)

        :precondition (and
            ( top ?source)
            ( top ?target)
            ( on ?source ?below_source)
        )

        :effect (and
            ( not ( top ?target))
            ( not ( on ?source ?below_source))
            ( on ?source ?target)
            ( top ?below_source)
        )

    )

)