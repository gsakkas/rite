
let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  match (List.length l1) > (List.length l2) with
  | true  -> (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  | false  -> (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  let rec removeZH templ =
    match templ with
    | [] -> []
    | hd::tl -> if hd = 0 then removeZH tl else hd :: tl in
  removeZH l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + x in
    let base = 9 in
    let args = l1 l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  match (List.length l1) > (List.length l2) with
  | true  -> (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  | false  -> (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  let rec removeZH templ =
    match templ with
    | [] -> []
    | hd::tl -> if hd = 0 then removeZH tl else hd :: tl in
  removeZH l;;

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
(23,16)-(23,17)
match a with
| (x , y) -> x
CaseG VarG [(Nothing,VarG)]

(23,16)-(23,21)
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

(24,4)-(25,71)
x
VarG

(24,4)-(25,71)
carry
VarG

(24,4)-(25,71)
addend_a
VarG

(24,4)-(25,71)
addend_b
VarG

(24,4)-(25,71)
carry
VarG

(24,4)-(25,71)
addend_a
VarG

(24,4)-(25,71)
addend_b
VarG

(24,4)-(25,71)
a
VarG

(24,4)-(25,71)
new_carry
VarG

(24,4)-(25,71)
digit
VarG

(24,4)-(25,71)
y
VarG

(24,4)-(25,71)
(carry + addend_a) + addend_b
BopG (BopG EmptyG EmptyG) VarG

(24,4)-(25,71)
((carry + addend_a) + addend_b) / 10
BopG (BopG EmptyG EmptyG) LitG

(24,4)-(25,71)
carry + addend_a
BopG VarG VarG

(24,4)-(25,71)
(carry + addend_a) + addend_b
BopG (BopG EmptyG EmptyG) VarG

(24,4)-(25,71)
((carry + addend_a) + addend_b) mod 10
BopG (BopG EmptyG EmptyG) LitG

(24,4)-(25,71)
carry + addend_a
BopG VarG VarG

(24,4)-(25,71)
10
LitG

(24,4)-(25,71)
10
LitG

(24,4)-(25,71)
let new_carry =
  ((carry + addend_a) + addend_b) / 10 in
let digit =
  ((carry + addend_a) + addend_b) mod 10 in
match a with
| (x , y) -> (new_carry , digit :: y)
LetG NonRec [BopG EmptyG EmptyG] (LetG NonRec [EmptyG] EmptyG)

(24,4)-(25,71)
let digit =
  ((carry + addend_a) + addend_b) mod 10 in
match a with
| (x , y) -> (new_carry , digit :: y)
LetG NonRec [BopG EmptyG EmptyG] (CaseG EmptyG [(Nothing,EmptyG)])

(24,4)-(25,71)
match x with
| (addend_a , addend_b) -> (let new_carry =
                              ((carry + addend_a) + addend_b) / 10 in
                            let digit =
                              ((carry + addend_a) + addend_b) mod 10 in
                            match a with
                            | (x , y) -> (new_carry , digit :: y))
CaseG VarG [(Nothing,LetG NonRec [EmptyG] EmptyG)]

(24,4)-(25,71)
match a with
| (x , y) -> (new_carry , digit :: y)
CaseG VarG [(Nothing,TupleG [EmptyG,EmptyG])]

(24,4)-(25,71)
(new_carry , digit :: y)
TupleG [VarG,ConAppG (Just (TupleG [VarG,VarG])) Nothing]

(24,4)-(25,71)
digit :: y
ConAppG (Just (TupleG [VarG,VarG])) Nothing

(24,15)-(24,16)
(0 , [])
TupleG [LitG,ListG EmptyG Nothing]

(25,4)-(25,71)
0
LitG

(25,4)-(25,71)
[]
ListG EmptyG Nothing

(25,15)-(25,17)
List.rev
VarG

(25,15)-(25,17)
List.combine
VarG

(25,15)-(25,17)
List.combine l1 l2
AppG [VarG,VarG]

*)
