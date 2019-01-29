
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + x in
    let base = 0 in
    let args = (l1, l2) in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (x,y) -> x in
      match x with
      | (add1,add2) ->
          let new_carry = ((carry + add1) + add2) / 10 in
          let digit = ((carry + add1) + add2) mod 10 in
          (match a with | (x,y) -> (new_carry, (digit :: y))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,16)-(15,17)
match a with
| (x , y) -> x
CaseG VarG (fromList [(Nothing,VarG)])

(15,16)-(15,21)
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
LetG NonRec (fromList [CaseG EmptyG (fromList [(Nothing,EmptyG)])]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(16,4)-(17,74)
x
VarG

(16,4)-(17,74)
carry
VarG

(16,4)-(17,74)
add1
VarG

(16,4)-(17,74)
add2
VarG

(16,4)-(17,74)
carry
VarG

(16,4)-(17,74)
add1
VarG

(16,4)-(17,74)
add2
VarG

(16,4)-(17,74)
a
VarG

(16,4)-(17,74)
new_carry
VarG

(16,4)-(17,74)
digit
VarG

(16,4)-(17,74)
y
VarG

(16,4)-(17,74)
(carry + add1) + add2
BopG (BopG EmptyG EmptyG) VarG

(16,4)-(17,74)
((carry + add1) + add2) / 10
BopG (BopG EmptyG EmptyG) LitG

(16,4)-(17,74)
carry + add1
BopG VarG VarG

(16,4)-(17,74)
(carry + add1) + add2
BopG (BopG EmptyG EmptyG) VarG

(16,4)-(17,74)
((carry + add1) + add2) mod 10
BopG (BopG EmptyG EmptyG) LitG

(16,4)-(17,74)
carry + add1
BopG VarG VarG

(16,4)-(17,74)
10
LitG

(16,4)-(17,74)
10
LitG

(16,4)-(17,74)
let new_carry =
  ((carry + add1) + add2) / 10 in
let digit =
  ((carry + add1) + add2) mod 10 in
match a with
| (x , y) -> (new_carry , digit :: y)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(16,4)-(17,74)
let digit =
  ((carry + add1) + add2) mod 10 in
match a with
| (x , y) -> (new_carry , digit :: y)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(16,4)-(17,74)
match x with
| (add1 , add2) -> (let new_carry =
                      ((carry + add1) + add2) / 10 in
                    let digit =
                      ((carry + add1) + add2) mod 10 in
                    match a with
                    | (x , y) -> (new_carry , digit :: y))
CaseG VarG (fromList [(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])

(16,4)-(17,74)
match a with
| (x , y) -> (new_carry , digit :: y)
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(16,4)-(17,74)
(new_carry , digit :: y)
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG]))) Nothing])

(16,4)-(17,74)
digit :: y
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(16,15)-(16,16)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(17,4)-(17,74)
[]
ListG EmptyG Nothing

(17,15)-(17,23)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(17,16)-(17,18)
List.rev
VarG

(17,16)-(17,18)
List.combine
VarG

(17,16)-(17,18)
List.combine l1 l2
AppG (fromList [VarG])

*)
