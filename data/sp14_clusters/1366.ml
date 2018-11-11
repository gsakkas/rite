
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
    let f a x = match x with | (add1,add2) -> ((add1 + add2) + a) mod 10 in
    let base = 0 in
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
      match a with
      | (carry,rest) ->
          (match x with
           | (add1,add2) ->
               ((((add1 + add2) + carry) / 10),
                 ((((add1 + add2) + carry) mod 10) :: rest))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,16)-(15,72)
a
VarG

(15,16)-(15,72)
match a with
| (carry , rest) -> match x with
                    | (add1 , add2) -> (((add1 + add2) + carry) / 10 , (((add1 + add2) + carry) mod 10) :: rest)
CaseG VarG [(Nothing,CaseG EmptyG [(Nothing,EmptyG)])]

(15,46)-(15,72)
add1
VarG

(15,46)-(15,72)
add2
VarG

(15,46)-(15,72)
carry
VarG

(15,46)-(15,72)
((add1 + add2) + carry) / 10
BopG (BopG EmptyG EmptyG) LitG

(15,46)-(15,72)
(add1 + add2) + carry
BopG (BopG EmptyG EmptyG) VarG

(15,46)-(15,72)
add1 + add2
BopG VarG VarG

(15,46)-(15,72)
10
LitG

(15,46)-(15,72)
(((add1 + add2) + carry) / 10 , (((add1 + add2) + carry) mod 10) :: rest)
TupleG [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing]

(15,46)-(15,72)
(((add1 + add2) + carry) mod 10) :: rest
ConAppG (Just (TupleG [BopG (BopG (BopG VarG VarG) VarG) LitG,VarG])) Nothing

(15,63)-(15,64)
carry
VarG

(16,4)-(18,51)
rest
VarG

(16,15)-(16,16)
(0 , [])
TupleG [LitG,ListG EmptyG Nothing]

(17,4)-(18,51)
[]
ListG EmptyG Nothing

*)
