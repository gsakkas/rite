
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x = y
  then (l1, l2)
  else
    if x < y
    then (((clone 0 (y - x)) @ l1), l2)
    else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (l1x,l2x) = x in
      let (a1,a2) = a in
      let test = match a1 with | [] -> 0 | h::t -> h in
      let sum = (l1x + l2x) + test in
      let terms =
        match 2 with | [] -> (sum / 10) :: (sum mod 10) | _ -> sum mod 10 in
      (((sum / 10) :: a1), (terms :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x = y
  then (l1, l2)
  else
    if x < y
    then (((clone 0 (y - x)) @ l1), l2)
    else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (l1x,l2x) = x in
      let (a1,a2) = a in
      let test = match a1 with | [] -> 0 | h::t -> h in
      let sum = (l1x + l2x) + test in
      match a2 with
      | [] -> ((0 :: a1), ((sum / 10) :: (sum mod 10) :: a2))
      | h::t -> (((sum / 10) :: a1), ((sum mod 10) :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(24,7)-(26,42)
match a2 with
| [] -> (0 :: a1 , (sum / 10) :: ((sum mod 10) :: a2))
| h :: t -> ((sum / 10) :: a1 , (sum mod 10) :: a2)
CaseG (fromList [(ConsPatG VarPatG VarPatG,Nothing,TupleG (fromList [EmptyG])),(ConPatG Nothing,Nothing,TupleG (fromList [EmptyG]))])

*)

(* type error slice
(15,3)-(15,70)
(15,40)-(15,41)
(15,40)-(15,45)
(15,44)-(15,45)
(15,51)-(15,61)
(15,51)-(15,63)
(15,62)-(15,63)
(18,3)-(30,35)
(18,12)-(29,52)
(19,5)-(29,52)
(19,11)-(26,42)
(21,7)-(26,42)
(21,21)-(21,22)
(24,7)-(26,42)
(25,9)-(25,74)
(25,15)-(25,16)
(25,30)-(25,56)
(25,44)-(25,56)
(25,64)-(25,74)
(26,28)-(26,41)
(26,29)-(26,34)
(26,38)-(26,40)
(27,5)-(29,52)
(28,5)-(29,52)
(29,5)-(29,52)
(29,19)-(29,33)
(29,19)-(29,45)
(29,34)-(29,35)
(29,49)-(29,52)
(30,3)-(30,13)
(30,3)-(30,35)
(30,14)-(30,35)
(30,15)-(30,18)
*)
