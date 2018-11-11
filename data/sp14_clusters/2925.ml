
let rec clone x n =
  match n with | 0 -> [] | a -> if a < 0 then [] else (clone x (n - 1)) @ [x];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with | (h::t,(x1,x2)::t2) -> if ((x1 + x2) + h) > 9 then 9 in
    let base = [0] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | 0 -> [] | a -> if a < 0 then [] else (clone x (n - 1)) @ [x];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

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
(16,12)-(16,18)
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
LetG NonRec [CaseG EmptyG [(Nothing,EmptyG)]] (CaseG EmptyG [(Nothing,EmptyG)])

(16,13)-(16,14)
match a with
| (x , y) -> x
CaseG VarG [(Nothing,VarG)]

(16,48)-(16,77)
carry
VarG

(16,51)-(16,66)
x
VarG

(16,51)-(16,66)
((carry + addend_a) + addend_b) / 10
BopG (BopG EmptyG EmptyG) LitG

(16,51)-(16,66)
let new_carry =
  ((carry + addend_a) + addend_b) / 10 in
let digit =
  ((carry + addend_a) + addend_b) mod 10 in
match a with
| (x , y) -> (new_carry , digit :: y)
LetG NonRec [BopG EmptyG EmptyG] (LetG NonRec [EmptyG] EmptyG)

(16,51)-(16,70)
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

(17,15)-(17,18)
(0 , [])
TupleG [LitG,ListG EmptyG Nothing]

(18,4)-(19,51)
[]
ListG EmptyG Nothing

*)
