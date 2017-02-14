
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
        match a2 with | [] -> (sum / 10) :: (sum mod 10) | h::t -> sum mod 10 in
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
(24,6)-(26,41)
(25,30)-(25,40)
(25,30)-(25,56)
(25,44)-(25,56)
(25,45)-(25,48)
(25,53)-(25,55)
(26,6)-(26,41)
(26,28)-(26,33)
(26,37)-(26,39)
(30,19)-(30,26)
(30,27)-(30,29)
(30,30)-(30,32)
*)

(* type error slice
(15,2)-(15,69)
(15,2)-(15,69)
(15,39)-(15,40)
(15,39)-(15,44)
(15,39)-(15,44)
(15,43)-(15,44)
(15,50)-(15,60)
(15,50)-(15,62)
(15,61)-(15,62)
(18,2)-(30,34)
(18,11)-(29,51)
(19,4)-(29,51)
(19,4)-(29,51)
(19,10)-(26,41)
(21,6)-(26,41)
(21,20)-(21,21)
(24,6)-(26,41)
(25,8)-(25,77)
(25,8)-(25,77)
(25,30)-(25,56)
(25,30)-(25,56)
(25,44)-(25,56)
(25,67)-(25,77)
(26,27)-(26,40)
(26,27)-(26,40)
(26,28)-(26,33)
(26,37)-(26,39)
(27,4)-(29,51)
(28,4)-(29,51)
(29,4)-(29,51)
(29,4)-(29,51)
(29,18)-(29,32)
(29,18)-(29,44)
(29,33)-(29,34)
(29,48)-(29,51)
(30,2)-(30,12)
(30,2)-(30,34)
(30,13)-(30,34)
(30,14)-(30,17)
*)
