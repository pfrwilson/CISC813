(define (problem setarc1)

    (:domain setarc)

    (:objects
        b0 b1 s1 s2 s3 s4
    )

    (:init

        (on s1 b0)
        (on s2 s1)
        (on s3 s2)
        (on s4 s3)

        (top s4)
        (top b1)

    )

    (:goal
        (and (on s1 s2)
            (on s2 s3)
            (on s3 s4))
    )

)