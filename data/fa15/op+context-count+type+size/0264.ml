
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (j,k) -> if (j + k) > 10 then (1, ((j + k) - 10)) else (0, (j + k)) in
    let base = (0, 0) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if (x1 + x2) > 10
      then (1, ((((x1 + x2) + a1) - 10) :: a2))
      else (0, (((x1 + x2) + a1) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,7)-(17,74)
(17,18)-(17,74)
(17,22)-(17,23)
(17,26)-(17,27)
(17,31)-(17,33)
(17,45)-(17,46)
(17,45)-(17,56)
(17,49)-(17,50)
(17,54)-(17,56)
(17,65)-(17,74)
(17,69)-(17,70)
(17,69)-(17,74)
(17,73)-(17,74)
(18,5)-(20,52)
(18,17)-(18,21)
(18,20)-(18,21)
(19,5)-(20,52)
(19,16)-(19,44)
(20,5)-(20,52)
(21,3)-(21,13)
(21,15)-(21,18)
(21,15)-(21,33)
(21,20)-(21,27)
(21,20)-(21,33)
(21,28)-(21,30)
(21,31)-(21,33)
*)

(* type error slice
(11,3)-(11,76)
(11,3)-(11,76)
(11,52)-(11,62)
(11,52)-(11,64)
(11,63)-(11,64)
(14,3)-(21,33)
(14,12)-(20,52)
(15,5)-(20,52)
(15,5)-(20,52)
(15,11)-(17,74)
(15,13)-(17,74)
(16,7)-(17,74)
(17,18)-(17,74)
(17,40)-(17,56)
(17,45)-(17,56)
(18,5)-(20,52)
(19,5)-(20,52)
(20,5)-(20,52)
(20,5)-(20,52)
(20,19)-(20,33)
(20,19)-(20,45)
(20,34)-(20,35)
(20,49)-(20,52)
(21,3)-(21,13)
(21,3)-(21,33)
(21,15)-(21,18)
(21,15)-(21,33)
*)
