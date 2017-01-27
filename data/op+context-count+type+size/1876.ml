
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
(20,7)-(22,67)
(21,33)-(21,35)
(21,33)-(21,48)
(21,33)-(21,55)
(21,39)-(21,41)
(21,39)-(21,48)
(21,46)-(21,48)
(22,25)-(22,27)
(22,25)-(22,38)
(22,25)-(22,67)
(22,31)-(22,38)
(22,36)-(22,38)
(22,45)-(22,47)
(22,45)-(22,67)
(22,51)-(22,60)
(22,58)-(22,60)
(22,66)-(22,67)
(23,5)-(25,52)
(23,16)-(23,18)
(24,5)-(25,52)
(24,16)-(24,34)
(26,3)-(26,13)
(26,15)-(26,18)
(26,15)-(26,33)
(26,20)-(26,27)
(26,20)-(26,33)
(26,28)-(26,30)
(26,31)-(26,33)
*)

(* type error slice
(19,5)-(25,52)
(19,11)-(22,67)
(19,13)-(22,67)
(20,7)-(22,67)
(20,13)-(20,14)
(21,33)-(21,48)
(21,33)-(21,55)
(21,54)-(21,55)
(23,5)-(25,52)
(23,16)-(23,18)
(24,5)-(25,52)
(24,16)-(24,28)
(24,16)-(24,34)
(24,29)-(24,31)
(24,32)-(24,34)
(25,19)-(25,33)
(25,19)-(25,45)
(25,34)-(25,35)
(25,36)-(25,40)
(25,41)-(25,45)
*)
