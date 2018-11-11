
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
    let f a x = ([], []) in
    let base = ([], []) in
    let args = f l1 l2 in let (_,res) = List.fold_left f base args in res in
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
(23,16)-(23,24)
a
VarG

(23,16)-(23,24)
x
VarG

(23,16)-(23,24)
x
VarG

(23,16)-(23,24)
carry
VarG

(23,16)-(23,24)
addend_a
VarG

(23,16)-(23,24)
addend_b
VarG

(23,16)-(23,24)
carry
VarG

(23,16)-(23,24)
addend_a
VarG

(23,16)-(23,24)
addend_b
VarG

(23,16)-(23,24)
a
VarG

(23,16)-(23,24)
(carry + addend_a) + addend_b
BopG (BopG EmptyG EmptyG) VarG

(23,16)-(23,24)
((carry + addend_a) + addend_b) / 10
BopG (BopG EmptyG EmptyG) LitG

(23,16)-(23,24)
carry + addend_a
BopG VarG VarG

(23,16)-(23,24)
(carry + addend_a) + addend_b
BopG (BopG EmptyG EmptyG) VarG

(23,16)-(23,24)
((carry + addend_a) + addend_b) mod 10
BopG (BopG EmptyG EmptyG) LitG

(23,16)-(23,24)
carry + addend_a
BopG VarG VarG

(23,16)-(23,24)
10
LitG

(23,16)-(23,24)
10
LitG

(23,16)-(23,24)
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

(23,16)-(23,24)
let new_carry =
  ((carry + addend_a) + addend_b) / 10 in
let digit =
  ((carry + addend_a) + addend_b) mod 10 in
match a with
| (x , y) -> (new_carry , digit :: y)
LetG NonRec [BopG EmptyG EmptyG] (LetG NonRec [EmptyG] EmptyG)

(23,16)-(23,24)
let digit =
  ((carry + addend_a) + addend_b) mod 10 in
match a with
| (x , y) -> (new_carry , digit :: y)
LetG NonRec [BopG EmptyG EmptyG] (CaseG EmptyG [(Nothing,EmptyG)])

(23,16)-(23,24)
match a with
| (x , y) -> x
CaseG VarG [(Nothing,VarG)]

(23,16)-(23,24)
match x with
| (addend_a , addend_b) -> (let new_carry =
                              ((carry + addend_a) + addend_b) / 10 in
                            let digit =
                              ((carry + addend_a) + addend_b) mod 10 in
                            match a with
                            | (x , y) -> (new_carry , digit :: y))
CaseG VarG [(Nothing,LetG NonRec [EmptyG] EmptyG)]

(23,16)-(23,24)
match a with
| (x , y) -> (new_carry , digit :: y)
CaseG VarG [(Nothing,TupleG [EmptyG,EmptyG])]

(23,21)-(23,23)
new_carry
VarG

(24,4)-(25,73)
digit
VarG

(24,4)-(25,73)
y
VarG

(24,4)-(25,73)
digit :: y
ConAppG (Just (TupleG [VarG,VarG])) Nothing

(24,16)-(24,18)
0
LitG

(25,15)-(25,16)
List.combine
VarG

(25,15)-(25,22)
List.rev
VarG

(25,15)-(25,22)
List.rev (List.combine l1 l2)
AppG [AppG [EmptyG,EmptyG]]

*)
