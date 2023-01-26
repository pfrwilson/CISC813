(define (domain crates)

    (:requirements :typing :strips
    )

    (:types
        room locatable - object
        robot crate - locatable
    )

    (:predicates
        (in ?r - room ?o - locatable)
        (holding ?r - robot ?c - crate)
        (hands-free ?r - robot)
        (connected ?r1 ?r2 - room)
    )

    (:action move

        :parameters (?rob - robot ?r1 ?r2 - room)

        :precondition (and (in ?r1 ?rob)
            (connected ?r1 ?r2))

        :effect (and
            (in ?r2 ?rob)
            (not (in ?r1 ?rob))
        )

    )

    (:action pickup

        :parameters (?rob - robot ?rm - room ?c - crate)

        :precondition (and
            (hands-free ?rob)
            (in ?rm ?rob)
            (in ?rm ?c)
        )

        :effect (and
            (not (hands-free ?rob))
            (holding ?rob ?c)
            (not (in ?rm ?c))

        )
    )

    (:action drop

        :parameters (?rob - robot ?rm - room ?c - crate)

        :precondition (and
            (holding ?rob ?c)
            (in ?rm ?rob)
        )

        :effect (and
            (not (holding ?rob ?c))
            (hands-free ?rob)
            (in ?rm ?c)
        )
    )

)