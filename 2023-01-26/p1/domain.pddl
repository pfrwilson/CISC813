(define (domain shuttle1)

    (:requirements :equality :negative-preconditions :typing :adl)

    (:types
        locateable location - object
        car person - locateable
        av mv - car
    )

    (:predicates
        (at ?obj - locateable ?loc - location)
        (link ?loc1 ?loc2 - location)
    )

    ; Move manual car from one location to another
    (:action move

        :parameters (?car - mv ?loc1 ?loc2 - location)

        :precondition (and
            ; TODO: Car is at the source and there is a link
            (link ?loc1 ?loc2)
            (at ?car ?loc1)
        )

        :effect (and
            ; TODO: Car shifts to the new location
            (at ?car ?loc2)
            (not (at ?car ?loc1))
        )
    )
)