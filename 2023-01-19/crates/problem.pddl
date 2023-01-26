(define (problem crates1)

    (:domain crates)

    (:objects
        r2d2 c3po - robot
        r1 r2 r3 r4 - room
        c1 c2 - crate
    )

    (:init

        (in r1 r2d2)
        (in r4 c3po)

        (connected r1 r2)
        (connected r2 r3)
        (connected r3 r4)
        (connected r4 r3)
        (connected r3 r2)
        (connected r2 r1)

        (in r2 c1)
        (in r3 c2)

        (hands-free r2d2)
        (hands-free c3po)
    )

    (:goal
        (and (in r4 c1)
            (in r1 c2))
    )

)