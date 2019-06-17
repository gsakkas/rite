CaseG VarG [(TuplePatG (fromList [EmptyPatG]),Nothing,LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)]
match x with
| (y , z) -> (let sum =
                y + z in
              match a with
              | h :: t -> ((sum + h) / 10) :: (((sum + h) mod 10) :: t)
              | _ -> [sum / 10 ; sum mod 10])
match x with
| (l2digit , templ1) -> (let (l2digit2 , templ12) =
                           a in
                         let multres =
                           mulByDigit l2digit templ1 in
                         (0 , bigAdd (templ12 @ [0])
                                     multres))
match x with
| (addend_a , addend_b) -> (let new_carry =
                              ((carry + addend_a) + addend_b) / 10 in
                            let digit =
                              ((carry + addend_a) + addend_b) mod 10 in
                            match a with
                            | (x , y) -> (new_carry , digit :: y))
