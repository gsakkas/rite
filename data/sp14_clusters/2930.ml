
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
    let f a x = match x with | (h1,h2) -> (h2, h1) in
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
(15,16)-(15,50)
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

(15,22)-(15,23)
a
VarG

(15,22)-(15,23)
match a with
| (x , y) -> x
CaseG VarG [(Nothing,VarG)]

(15,42)-(15,50)
x
VarG

(15,42)-(15,50)
carry
VarG

(15,42)-(15,50)
addend_a
VarG

(15,42)-(15,50)
addend_b
VarG

(15,42)-(15,50)
carry
VarG

(15,42)-(15,50)
addend_a
VarG

(15,42)-(15,50)
addend_b
VarG

(15,42)-(15,50)
a
VarG

(15,42)-(15,50)
(carry + addend_a) + addend_b
BopG (BopG EmptyG EmptyG) VarG

(15,42)-(15,50)
((carry + addend_a) + addend_b) / 10
BopG (BopG EmptyG EmptyG) LitG

(15,42)-(15,50)
carry + addend_a
BopG VarG VarG

(15,42)-(15,50)
(carry + addend_a) + addend_b
BopG (BopG EmptyG EmptyG) VarG

(15,42)-(15,50)
((carry + addend_a) + addend_b) mod 10
BopG (BopG EmptyG EmptyG) LitG

(15,42)-(15,50)
carry + addend_a
BopG VarG VarG

(15,42)-(15,50)
10
LitG

(15,42)-(15,50)
10
LitG

(15,42)-(15,50)
let new_carry =
  ((carry + addend_a) + addend_b) / 10 in
let digit =
  ((carry + addend_a) + addend_b) mod 10 in
match a with
| (x , y) -> (new_carry , digit :: y)
LetG NonRec [BopG EmptyG EmptyG] (LetG NonRec [EmptyG] EmptyG)

(15,42)-(15,50)
let digit =
  ((carry + addend_a) + addend_b) mod 10 in
match a with
| (x , y) -> (new_carry , digit :: y)
LetG NonRec [BopG EmptyG EmptyG] (CaseG EmptyG [(Nothing,EmptyG)])

(15,42)-(15,50)
match x with
| (addend_a , addend_b) -> (let new_carry =
                              ((carry + addend_a) + addend_b) / 10 in
                            let digit =
                              ((carry + addend_a) + addend_b) mod 10 in
                            match a with
                            | (x , y) -> (new_carry , digit :: y))
CaseG VarG [(Nothing,LetG NonRec [EmptyG] EmptyG)]

(15,42)-(15,50)
match a with
| (x , y) -> (new_carry , digit :: y)
CaseG VarG [(Nothing,TupleG [EmptyG,EmptyG])]

(15,47)-(15,49)
new_carry
VarG

(16,4)-(18,51)
digit
VarG

(16,4)-(18,51)
y
VarG

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
