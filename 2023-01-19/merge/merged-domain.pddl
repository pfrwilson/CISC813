(define (domain merged)

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
        (top ?c - crate)
        (on ?c1 ?c2 - crate)
    )

    (:action move

        :parameters (?rob - robot ?r1 ?r2 - room)

        :precondition (and
            (in ?r1 ?rob)
            (connected ?r1 ?r2)
        )

        :effect (and
            (in ?r2 ?rob)
            (not (in ?r1 ?rob))
        )

    )

    (:action pickup

        :parameters (?rob - robot ?rm - room ?c-top ?c-bot - crate)

        :precondition (and
            (in ?rm ?rob)
            (in ?rm ?c-top)
            (in ?rm ?c-bot)
            (hands-free ?rob)
            (top ?c-top)
            (on ?c-top ?c-bot)
        )

        :effect (and
            (not (hands-free ?rob))
            (holding ?rob ?c-top)
            (not (on ?c-top ?c-bot))
            (top ?c-bot)
            (not (top ?c-top))
            (not (in ?rm ?c-top))
        )

    )
    (:action drop

        :parameters (?rob - robot ?rm - room ?c-top ?c-bot - crate)

        :precondition (and
            (in ?rm ?rob)
            (in ?rm ?c-bot)
            (holding ?rob ?c-top)
            (top ?c-bot)
        )

        :effect (and
            (hands-free ?rob)
            (not (holding ?rob ?c-top))
            (not (top ?c-bot))
            (top ?c-top)
            (on ?c-top ?c-bot)
            (in ?rm ?c-top)
        )
    )

    (:action shift
        :parameters (?rob - robot ?rm - room ?c-top ?c-bot ?c-target - crate)

        :precondition (and
            (in ?rm ?rob)
            (in ?rm ?c-bot)
            (in ?rm ?c-top)
            (in ?rm ?c-target)
            (hands-free ?rob)

            (top ?c-target)
            (top ?c-top)
            (on ?c-top ?c-bot)

            (not (= ?c-top ?c-target))
        )

        :effect (and
            (not (top ?c-target))
            (top ?c-top)
            (on ?c-top ?c-target)

            (top ?c-bot)
            (not (on ?c-top ?c-bot))
        )

    )

)