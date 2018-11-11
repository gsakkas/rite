
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
    let f a x = match x with | _ -> a mod 10 | h::t -> (a + h) mod 10 in
    let base = [0] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
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
(15,36)-(15,37)
match a with
| (x , y) -> x
CaseG VarG [(Nothing,VarG)]

(15,36)-(15,44)
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
LetG NonRec [CaseG EmptyG [(Nothing,EmptyG)]] (CaseG EmptyG [(Nothing,EmptyG)])

(15,42)-(15,44)
x
VarG

(15,42)-(15,44)
x
VarG

(15,42)-(15,44)
carry
VarG

(15,42)-(15,44)
add1
VarG

(15,42)-(15,44)
add2
VarG

(15,42)-(15,44)
(carry + add1) + add2
BopG (BopG EmptyG EmptyG) VarG

(15,42)-(15,44)
((carry + add1) + add2) / 10
BopG (BopG EmptyG EmptyG) LitG

(15,42)-(15,44)
carry + add1
BopG VarG VarG

(15,42)-(15,44)
let new_carry =
  ((carry + add1) + add2) / 10 in
let digit =
  ((carry + add1) + add2) mod 10 in
match a with
| (x , y) -> (new_carry , digit :: y)
LetG NonRec [BopG EmptyG EmptyG] (LetG NonRec [EmptyG] EmptyG)

(15,42)-(15,44)
match x with
| (add1 , add2) -> (let new_carry =
                      ((carry + add1) + add2) / 10 in
                    let digit =
                      ((carry + add1) + add2) mod 10 in
                    match a with
                    | (x , y) -> (new_carry , digit :: y))
CaseG VarG [(Nothing,LetG NonRec [EmptyG] EmptyG)]

(15,55)-(15,69)
let digit =
  ((carry + add1) + add2) mod 10 in
match a with
| (x , y) -> (new_carry , digit :: y)
LetG NonRec [BopG EmptyG EmptyG] (CaseG EmptyG [(Nothing,EmptyG)])

(15,60)-(15,61)
carry + add1
BopG VarG VarG

(15,67)-(15,69)
carry
VarG

(15,67)-(15,69)
add1
VarG

(15,67)-(15,69)
add2
VarG

(16,4)-(18,51)
a
VarG

(16,4)-(18,51)
new_carry
VarG

(16,4)-(18,51)
digit
VarG

(16,4)-(18,51)
y
VarG

(16,4)-(18,51)
match a with
| (x , y) -> (new_carry , digit :: y)
CaseG VarG [(Nothing,TupleG [EmptyG,EmptyG])]

(16,4)-(18,51)
(new_carry , digit :: y)
TupleG [VarG,ConAppG (Just (TupleG [VarG,VarG])) Nothing]

(16,4)-(18,51)
digit :: y
ConAppG (Just (TupleG [VarG,VarG])) Nothing

(16,15)-(16,18)
(0 , [])
TupleG [LitG,ListG EmptyG Nothing]

(17,4)-(18,51)
[]
ListG EmptyG Nothing

*)
