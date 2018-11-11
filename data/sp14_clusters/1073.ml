
let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((List.append (clone 0 (abs diff)) l1), l2)
  else if diff > 0 then (l1, (List.append (clone 0 diff) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + (((fst x) + (snd x)) mod 10) in
    let base = 0 in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((List.append (clone 0 (abs diff)) l1), l2)
  else if diff > 0 then (l1, (List.append (clone 0 diff) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst a) + (((fst x) + (snd x)) mod 10) in
      ((sum / 10), (sum mod 10)) in
    let base = (0, 0) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in [res] in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,16)-(18,17)
fst
VarG

(18,16)-(18,17)
fst a
AppG [VarG]

(18,16)-(18,48)
let sum =
  fst a + ((fst x + snd x) mod 10) in
(sum / 10 , sum mod 10)
LetG NonRec [BopG EmptyG EmptyG] (TupleG [EmptyG,EmptyG])

(19,4)-(21,51)
sum
VarG

(19,4)-(21,51)
sum
VarG

(19,4)-(21,51)
sum / 10
BopG VarG LitG

(19,4)-(21,51)
sum mod 10
BopG VarG LitG

(19,4)-(21,51)
10
LitG

(19,4)-(21,51)
10
LitG

(19,4)-(21,51)
(sum / 10 , sum mod 10)
TupleG [BopG EmptyG EmptyG,BopG EmptyG EmptyG]

(19,15)-(19,16)
(0 , 0)
TupleG [LitG,LitG]

(20,4)-(21,51)
0
LitG

(21,48)-(21,51)
[res]
ListG VarG Nothing

*)
