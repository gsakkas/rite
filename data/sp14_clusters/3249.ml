
let t x = x + 1;;

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let carry = x in carry in
    let base = failwith "to be implemented" in
    let args = List.rev List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let t x = x + 1;;

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (x,y) -> x in
      match x with
      | (addend_a,addend_b) ->
          let new_carry = ((carry + addend_a) + addend_b) / 10 in
          let digit = ((carry + addend_a) + addend_b) mod 10 in
          (match a with | (x,y) -> (new_carry, (digit :: y))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,28)-(16,29)
a
VarG

(16,28)-(16,29)
match a with
| (x , y) -> x
CaseG VarG [(Nothing,VarG)]

(16,33)-(16,38)
x
VarG

(16,33)-(16,38)
(carry + addend_a) + addend_b
BopG (BopG EmptyG EmptyG) VarG

(16,33)-(16,38)
((carry + addend_a) + addend_b) / 10
BopG (BopG EmptyG EmptyG) LitG

(16,33)-(16,38)
carry + addend_a
BopG VarG VarG

(16,33)-(16,38)
let new_carry =
  ((carry + addend_a) + addend_b) / 10 in
let digit =
  ((carry + addend_a) + addend_b) mod 10 in
match a with
| (x , y) -> (new_carry , digit :: y)
LetG NonRec [BopG EmptyG EmptyG] (LetG NonRec [EmptyG] EmptyG)

(16,33)-(16,38)
match x with
| (addend_a , addend_b) -> (let new_carry =
                              ((carry + addend_a) + addend_b) / 10 in
                            let digit =
                              ((carry + addend_a) + addend_b) mod 10 in
                            match a with
                            | (x , y) -> (new_carry , digit :: y))
CaseG VarG [(Nothing,LetG NonRec [EmptyG] EmptyG)]

(17,4)-(19,51)
addend_a
VarG

(17,4)-(19,51)
addend_b
VarG

(17,4)-(19,51)
carry
VarG

(17,4)-(19,51)
addend_a
VarG

(17,4)-(19,51)
addend_b
VarG

(17,4)-(19,51)
a
VarG

(17,4)-(19,51)
new_carry
VarG

(17,4)-(19,51)
digit
VarG

(17,4)-(19,51)
y
VarG

(17,4)-(19,51)
(carry + addend_a) + addend_b
BopG (BopG EmptyG EmptyG) VarG

(17,4)-(19,51)
((carry + addend_a) + addend_b) mod 10
BopG (BopG EmptyG EmptyG) LitG

(17,4)-(19,51)
carry + addend_a
BopG VarG VarG

(17,4)-(19,51)
10
LitG

(17,4)-(19,51)
10
LitG

(17,4)-(19,51)
let digit =
  ((carry + addend_a) + addend_b) mod 10 in
match a with
| (x , y) -> (new_carry , digit :: y)
LetG NonRec [BopG EmptyG EmptyG] (CaseG EmptyG [(Nothing,EmptyG)])

(17,4)-(19,51)
match a with
| (x , y) -> (new_carry , digit :: y)
CaseG VarG [(Nothing,TupleG [EmptyG,EmptyG])]

(17,4)-(19,51)
(new_carry , digit :: y)
TupleG [VarG,ConAppG (Just (TupleG [VarG,VarG])) Nothing]

(17,4)-(19,51)
digit :: y
ConAppG (Just (TupleG [VarG,VarG])) Nothing

(17,24)-(17,43)
(0 , [])
TupleG [LitG,ListG EmptyG Nothing]

(18,4)-(19,51)
0
LitG

(18,4)-(19,51)
[]
ListG EmptyG Nothing

(18,15)-(18,42)
List.rev (List.combine l1 l2)
AppG [AppG [EmptyG,EmptyG]]

(18,24)-(18,36)
List.combine l1 l2
AppG [VarG,VarG]

*)
