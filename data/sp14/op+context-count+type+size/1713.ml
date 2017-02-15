
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
      match x with
      | (x1,x2)::(x3,x4)::t -> (x1 + (x2 mod 10)) :: a
      | (x1,x2)::[] -> (x1 + (x2 / 10)) :: (x1 + (x2 mod 10)) :: a in
    let base = [] in
    let args = List.combine l1 l2 in
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
(20,6)-(22,66)
(21,31)-(21,49)
(21,31)-(21,54)
(21,32)-(21,34)
(21,37)-(21,48)
(21,38)-(21,40)
(21,45)-(21,47)
(22,23)-(22,39)
(22,23)-(22,66)
(22,24)-(22,26)
(22,29)-(22,38)
(22,35)-(22,37)
(22,43)-(22,66)
(22,44)-(22,46)
(22,49)-(22,60)
(22,57)-(22,59)
(22,65)-(22,66)
(23,4)-(25,51)
(23,15)-(23,17)
(24,4)-(25,51)
(24,15)-(24,33)
(25,4)-(25,51)
(26,2)-(26,12)
(26,13)-(26,34)
(26,14)-(26,17)
(26,18)-(26,33)
(26,19)-(26,26)
(26,27)-(26,29)
(26,30)-(26,32)
*)

(* type error slice
(19,4)-(25,51)
(19,10)-(22,66)
(19,12)-(22,66)
(20,6)-(22,66)
(20,6)-(22,66)
(20,12)-(20,13)
(24,4)-(25,51)
(24,15)-(24,27)
(24,15)-(24,33)
(25,18)-(25,32)
(25,18)-(25,44)
(25,33)-(25,34)
(25,40)-(25,44)
*)
