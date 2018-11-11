
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
      | (add1,add2) ->
          ((((add1 + add2) + a) mod 10), (((add1 + add2) + a) / 10)) in
    let base = (0, 0) in
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
(16,6)-(18,68)
a
VarG

(16,6)-(18,68)
match a with
| (carry , rest) -> match x with
                    | (add1 , add2) -> (((add1 + add2) + carry) / 10 , (((add1 + add2) + carry) mod 10) :: rest)
CaseG VarG [(Nothing,CaseG EmptyG [(Nothing,EmptyG)])]

(18,11)-(18,39)
((add1 + add2) + carry) / 10
BopG (BopG EmptyG EmptyG) LitG

(18,29)-(18,30)
carry
VarG

(18,41)-(18,67)
(((add1 + add2) + carry) mod 10) :: rest
ConAppG (Just (TupleG [BopG (BopG (BopG VarG VarG) VarG) LitG,VarG])) Nothing

(18,42)-(18,61)
((add1 + add2) + carry) mod 10
BopG (BopG EmptyG EmptyG) LitG

(18,59)-(18,60)
carry
VarG

(19,4)-(21,51)
rest
VarG

(19,19)-(19,20)
[]
ListG EmptyG Nothing

*)
