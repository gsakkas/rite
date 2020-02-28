
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let ha::_ = a in
      let (a1,a2) = ha in
      let tens = (x1 + x2) + (a1 / 10) in
      let ones = (x1 + x2) + (a1 mod 10) in (tens, ones) in
    let base = (0, 0) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let h::_ = a1 in
      let tens = (x1 + x2) + (h / 10) in
      let ones = (x1 + x2) + (h mod 10) in ((tens :: a1), (ones :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(21,7)-(24,57)
let (a1 , a2) = a in
let h :: _ = a1 in
let tens =
  (x1 + x2) + (h / 10) in
let ones =
  (x1 + x2) + (h mod 10) in
(tens :: a1 , ones :: a2)
LetG NonRec [(TuplePatG (fromList [EmptyPatG]),VarG)] (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

(25,17)-(25,18)
[]
ListG []

(25,20)-(25,21)
[]
ListG []

*)

(* type error slice
(19,5)-(27,52)
(19,11)-(24,57)
(19,13)-(24,57)
(20,7)-(24,57)
(21,7)-(24,57)
(21,19)-(21,20)
(22,7)-(24,57)
(23,7)-(24,57)
(24,7)-(24,57)
(24,45)-(24,57)
(27,19)-(27,33)
(27,19)-(27,45)
(27,34)-(27,35)
*)
