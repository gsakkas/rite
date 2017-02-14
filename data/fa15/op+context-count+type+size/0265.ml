
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
    let base = (0, []) in
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
(16,6)-(17,75)
(17,17)-(17,75)
(17,21)-(17,22)
(17,25)-(17,26)
(17,30)-(17,32)
(17,42)-(17,56)
(17,44)-(17,45)
(17,48)-(17,49)
(17,53)-(17,55)
(17,63)-(17,75)
(17,67)-(17,74)
(17,68)-(17,69)
(17,72)-(17,73)
(18,4)-(20,51)
(18,15)-(18,22)
(19,4)-(20,51)
(20,4)-(20,51)
(21,2)-(21,12)
(21,13)-(21,34)
(21,14)-(21,17)
(21,18)-(21,33)
(21,19)-(21,26)
(21,27)-(21,29)
(21,30)-(21,32)
*)

(* type error slice
(15,4)-(20,51)
(15,10)-(17,75)
(15,12)-(17,75)
(16,6)-(17,75)
(17,17)-(17,75)
(17,38)-(17,57)
(17,42)-(17,56)
(18,4)-(20,51)
(18,15)-(18,22)
(18,19)-(18,21)
(20,18)-(20,32)
(20,18)-(20,44)
(20,33)-(20,34)
(20,35)-(20,39)
*)
