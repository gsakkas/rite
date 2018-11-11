
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
      match x with
      | _ -> [a mod 10]
      | h::t -> ((a + h) mod 10) :: ((a + h) / 10) in
    let base = [] in
    let args = List.combine l1 l2 in
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
(17,14)-(17,15)
match a with
| (x , y) -> x
CaseG VarG [(Nothing,VarG)]

(17,14)-(17,22)
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

(17,20)-(17,22)
x
VarG

(17,20)-(17,22)
x
VarG

(17,20)-(17,22)
carry
VarG

(17,20)-(17,22)
add1
VarG

(17,20)-(17,22)
add2
VarG

(17,20)-(17,22)
(carry + add1) + add2
BopG (BopG EmptyG EmptyG) VarG

(17,20)-(17,22)
((carry + add1) + add2) / 10
BopG (BopG EmptyG EmptyG) LitG

(17,20)-(17,22)
carry + add1
BopG VarG VarG

(17,20)-(17,22)
let new_carry =
  ((carry + add1) + add2) / 10 in
let digit =
  ((carry + add1) + add2) mod 10 in
match a with
| (x , y) -> (new_carry , digit :: y)
LetG NonRec [BopG EmptyG EmptyG] (LetG NonRec [EmptyG] EmptyG)

(17,20)-(17,22)
match x with
| (add1 , add2) -> (let new_carry =
                      ((carry + add1) + add2) / 10 in
                    let digit =
                      ((carry + add1) + add2) mod 10 in
                    match a with
                    | (x , y) -> (new_carry , digit :: y))
CaseG VarG [(Nothing,LetG NonRec [EmptyG] EmptyG)]

(18,16)-(18,50)
let digit =
  ((carry + add1) + add2) mod 10 in
match a with
| (x , y) -> (new_carry , digit :: y)
LetG NonRec [BopG EmptyG EmptyG] (CaseG EmptyG [(Nothing,EmptyG)])

(18,42)-(18,43)
carry
VarG

(18,47)-(18,49)
add1
VarG

(18,47)-(18,49)
add2
VarG

(19,4)-(21,51)
a
VarG

(19,4)-(21,51)
new_carry
VarG

(19,4)-(21,51)
digit
VarG

(19,4)-(21,51)
y
VarG

(19,4)-(21,51)
match a with
| (x , y) -> (new_carry , digit :: y)
CaseG VarG [(Nothing,TupleG [EmptyG,EmptyG])]

(19,4)-(21,51)
(new_carry , digit :: y)
TupleG [VarG,ConAppG (Just (TupleG [VarG,VarG])) Nothing]

(19,4)-(21,51)
digit :: y
ConAppG (Just (TupleG [VarG,VarG])) Nothing

(19,15)-(19,17)
0
LitG

(19,15)-(19,17)
(0 , [])
TupleG [LitG,ListG EmptyG Nothing]

(20,15)-(20,33)
List.rev
VarG

(20,15)-(20,33)
List.rev (List.combine l1 l2)
AppG [AppG [EmptyG,EmptyG]]

*)
