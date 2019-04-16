
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
    let base = (0, 0) in
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
(14,7)-(15,72)
match (a , x) with
| ((b , c) , (d , e)) -> (b , (d + e) :: c)
CaseG (TupleG (fromList [EmptyG])) (fromList [(TuplePatG (fromList [TuplePatG (fromList [EmptyPatG])]),Nothing,TupleG (fromList [EmptyG]))])

(16,17)-(16,18)
[]
ListG (fromList [])

(16,20)-(16,21)
[]
ListG (fromList [])

(19,23)-(19,52)
[0 ; 0 ; 9 ; 9]
ListG (fromList [LitG])

(20,12)-(20,41)
[1 ; 0 ; 0 ; 2]
ListG (fromList [LitG])

*)

(* type error slice
(13,5)-(21,52)
(13,11)-(15,72)
(13,13)-(15,72)
(14,7)-(15,72)
(14,13)-(14,19)
(14,14)-(14,15)
(15,38)-(15,72)
(15,56)-(15,72)
(21,19)-(21,33)
(21,19)-(21,45)
(21,34)-(21,35)
*)
