IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (LetG Rec (fromList [EmptyG]) EmptyG)
if n = 0
then [0]
else (let rec integers =
        fun a ->
          fun b ->
            if a = 0
            then b
            else integers (a / 10)
                          ((a mod 10) :: b) in
      integers n [])
