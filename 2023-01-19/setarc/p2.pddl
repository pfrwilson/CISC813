(define (problem setarc2)

    (:domain setarc)

    (:objects
        b0 b1 b2 s1 s2 s3 s4 s5
    )

    (:init

        (on s1 b0)
        (on s2 s1)
        (on s3 s2)
        (on s4 s3)
        (on s5 s4)

        (top s5)
        (top b1)
        (top b2)

    )

    (:goal
        (and (on s1 b2)
            (on s5 s1)
            (on s2 s5)
            (on s4 s2)
            (on s3 s4))
    )

)