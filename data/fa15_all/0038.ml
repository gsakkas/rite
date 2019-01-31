
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let ll1 = List.length l1
  and ll2 = List.length l2 in
  if ll1 > ll2
  then (l1, ((clone 0 (ll1 - ll2)) @ l2))
  else (((clone 0 (ll2 - ll1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = "" in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let ll1 = List.length l1
  and ll2 = List.length l2 in
  if ll1 > ll2
  then (l1, ((clone 0 (ll1 - ll2)) @ l2))
  else (((clone 0 (ll2 - ll1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (cin,res) = a
      and (d1,d2) = x in
      ((((cin + d1) + d2) mod 10), (((cin + d1) + d2) :: res)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,16)-(16,18)
let (cin , res) = a
and (d1 , d2) = x in
(((cin + d1) + d2) mod 10 , ((cin + d1) + d2) :: res)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(17,4)-(19,51)
a
VarG

(17,4)-(19,51)
x
VarG

(17,4)-(19,51)
cin
VarG

(17,4)-(19,51)
d1
VarG

(17,4)-(19,51)
d2
VarG

(17,4)-(19,51)
cin
VarG

(17,4)-(19,51)
d1
VarG

(17,4)-(19,51)
d2
VarG

(17,4)-(19,51)
res
VarG

(17,4)-(19,51)
((cin + d1) + d2) mod 10
BopG (BopG EmptyG EmptyG) LitG

(17,4)-(19,51)
(cin + d1) + d2
BopG (BopG EmptyG EmptyG) VarG

(17,4)-(19,51)
cin + d1
BopG VarG VarG

(17,4)-(19,51)
(cin + d1) + d2
BopG (BopG EmptyG EmptyG) VarG

(17,4)-(19,51)
cin + d1
BopG VarG VarG

(17,4)-(19,51)
10
LitG

(17,4)-(19,51)
(((cin + d1) + d2) mod 10 , ((cin + d1) + d2) :: res)
TupleG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

(17,4)-(19,51)
((cin + d1) + d2) :: res
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) VarG]))) Nothing

*)
