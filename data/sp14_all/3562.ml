
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l = match l with | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((h::i,j::k),(d::e,f::g)) -> ((f + d) / 10) :: ((h + j) mod 10) in
    let base = ([], []) in
    let args =
      List.rev
        (List.combine (List.map (fun x  -> [x]) l1)
           (List.map (fun x  -> [x]) l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l = match l with | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match (a, x) with | ((b,c),(d,e)) -> (b, ((d + e) :: c)) in
    let base = ([], []) in
    let args = List.rev (List.combine [0; 0; 9; 9] [1; 0; 0; 2]) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,6)-(15,71)
match (a , x) with
| ((b , c) , (d , e)) -> (b , (d + e) :: c)
CaseG (TupleG (fromList [EmptyG])) (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(15,37)-(15,71)
b
VarG

(15,37)-(15,71)
(b , (d + e) :: c)
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG,BopG VarG VarG]))) Nothing])

(15,68)-(15,70)
e
VarG

(16,4)-(21,51)
c
VarG

(20,37)-(20,39)
[0 ; 0 ; 9 ; 9]
ListG LitG Nothing

(21,4)-(21,51)
0
LitG

(21,4)-(21,51)
0
LitG

(21,4)-(21,51)
9
LitG

(21,4)-(21,51)
9
LitG

(21,4)-(21,51)
1
LitG

(21,4)-(21,51)
0
LitG

(21,4)-(21,51)
0
LitG

(21,4)-(21,51)
2
LitG

(21,4)-(21,51)
[1 ; 0 ; 0 ; 2]
ListG LitG Nothing

*)
