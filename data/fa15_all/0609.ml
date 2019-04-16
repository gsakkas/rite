
let rec clone x n = if n > 0 then List.append [x] (clone x (n - 1)) else [];;

let padZero l1 l2 =
  ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1),
    (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | _ -> let h::t = l in (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (a1,a2) = a in
      match x with
      | [] -> if a1 = 0 then [] else [a1]
      | (x1,x2)::t ->
          let value = (a1 + x1) + x2 in
          if value > 9 then (1, (value - 10)) :: a else (0, value) :: a in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then List.append [x] (clone x (n - 1)) else [];;

let padZero l1 l2 =
  ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1),
    (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | _ -> let h::t = l in (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (a1,a2) = a in
      let (x1,x2) = x in
      let val1 = (a1 + x1) + x2 in
      let val2 = (x1 + x2) / 10 in (val2, (val1 :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,7)-(21,72)
let (x1 , x2) = x in
let val1 = (a1 + x1) + x2 in
let val2 = (x1 + x2) / 10 in
(val2 , val1 :: a2)
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),VarG)]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

(22,16)-(22,18)
(0 , [])
TupleG (fromList [LitG,ListG (fromList [])])

*)

(* type error slice
(15,5)-(24,52)
(15,11)-(21,72)
(15,13)-(21,72)
(16,7)-(21,72)
(16,21)-(16,22)
(17,7)-(21,72)
(18,15)-(18,42)
(18,18)-(18,20)
(18,18)-(18,24)
(18,23)-(18,24)
(18,38)-(18,42)
(18,39)-(18,41)
(20,11)-(21,72)
(21,11)-(21,72)
(21,29)-(21,51)
(21,50)-(21,51)
(21,57)-(21,67)
(21,57)-(21,72)
(21,71)-(21,72)
(24,19)-(24,33)
(24,19)-(24,45)
(24,34)-(24,35)
*)
