LetG NonRec (fromList [(VarPatG,CaseG (fromList [(TuplePatG (fromList [EmptyPatG]),Nothing,EmptyG)]))]) (CaseG (fromList [(TuplePatG (fromList [EmptyPatG]),Nothing,EmptyG)]))
let carry =
  match a with
  | (x , y) -> x in
match x with
| (add1 , add2) -> (let new_carry =
                      ((carry + add1) + add2) / 10 in
                    let digit =
                      ((carry + add1) + add2) mod 10 in
                    match a with
                    | (x , y) -> (new_carry , digit :: y))
let carry =
  match a with
  | (x , y) -> x in
match x with
| (addend_a , addend_b) -> (let new_carry =
                              ((carry + addend_a) + addend_b) / 10 in
                            let digit =
                              ((carry + addend_a) + addend_b) mod 10 in
                            match a with
                            | (x , y) -> (new_carry , digit :: y))
let carry =
  match a with
  | (x , y) -> x in
match x with
| (d1 , d2) -> (let new_carry =
                  ((carry + d1) + d2) / 10 in
                let digit =
                  ((carry + d1) + d2) mod 10 in
                match a with
                | (x , y) -> (new_carry , digit :: y))
