
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
      match x with
      | ([],[]) -> 0
      | ((h1::t1)::[],(h2::t2)::[]) -> if (h1 + h2) > 9 then a @ x in
    let base = [] in
    let args = l1 l2 in let (_,res) = List.fold_left f base args in res in
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
(16,6)-(18,66)
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

(16,12)-(16,13)
a
VarG

(16,12)-(16,13)
match a with
| (x , y) -> x
CaseG VarG [(Nothing,VarG)]

(18,39)-(18,66)
(new_carry , digit :: y)
TupleG [VarG,ConAppG (Just (TupleG [VarG,VarG])) Nothing]

(18,42)-(18,51)
x
VarG

(18,42)-(18,51)
((carry + addend_a) + addend_b) / 10
BopG (BopG EmptyG EmptyG) LitG

(18,42)-(18,51)
let new_carry =
  ((carry + addend_a) + addend_b) / 10 in
let digit =
  ((carry + addend_a) + addend_b) mod 10 in
match a with
| (x , y) -> (new_carry , digit :: y)
LetG NonRec [BopG EmptyG EmptyG] (LetG NonRec [EmptyG] EmptyG)

(18,42)-(18,55)
match x with
| (addend_a , addend_b) -> (let new_carry =
                              ((carry + addend_a) + addend_b) / 10 in
                            let digit =
                              ((carry + addend_a) + addend_b) mod 10 in
                            match a with
                            | (x , y) -> (new_carry , digit :: y))
CaseG VarG [(Nothing,LetG NonRec [EmptyG] EmptyG)]

(18,61)-(18,62)
carry
VarG

(18,61)-(18,62)
addend_a
VarG

(18,61)-(18,62)
addend_b
VarG

(18,61)-(18,62)
carry
VarG

(18,61)-(18,62)
addend_a
VarG

(18,61)-(18,62)
addend_b
VarG

(18,61)-(18,62)
(carry + addend_a) + addend_b
BopG (BopG EmptyG EmptyG) VarG

(18,61)-(18,62)
((carry + addend_a) + addend_b) mod 10
BopG (BopG EmptyG EmptyG) LitG

(18,61)-(18,62)
carry + addend_a
BopG VarG VarG

(18,61)-(18,62)
10
LitG

(18,61)-(18,62)
10
LitG

(18,61)-(18,62)
let digit =
  ((carry + addend_a) + addend_b) mod 10 in
match a with
| (x , y) -> (new_carry , digit :: y)
LetG NonRec [BopG EmptyG EmptyG] (CaseG EmptyG [(Nothing,EmptyG)])

(18,61)-(18,62)
match a with
| (x , y) -> (new_carry , digit :: y)
CaseG VarG [(Nothing,TupleG [EmptyG,EmptyG])]

(18,63)-(18,64)
carry + addend_a
BopG VarG VarG

(19,4)-(20,71)
new_carry
VarG

(19,4)-(20,71)
digit
VarG

(19,4)-(20,71)
y
VarG

(19,4)-(20,71)
digit :: y
ConAppG (Just (TupleG [VarG,VarG])) Nothing

(19,15)-(19,17)
0
LitG

(19,15)-(19,17)
(0 , [])
TupleG [LitG,ListG EmptyG Nothing]

(20,15)-(20,17)
List.rev
VarG

(20,15)-(20,17)
List.combine
VarG

(20,15)-(20,17)
List.combine l1 l2
AppG [VarG,VarG]

*)
