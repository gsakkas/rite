
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
      match a with
      | [] -> []
      | h::t ->
          let (j,k) = h in
          if (j + k) > 10 then (1, ((j + k) - 10)) else (0, ((j + k) - 10)) in
    let base = (0, 0) in
    let args = List.combine (List.rev l1) (List.rev l2) in
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
(16,6)-(20,75)
(16,12)-(16,13)
(17,14)-(17,16)
(19,10)-(20,75)
(19,22)-(19,23)
(20,14)-(20,15)
(20,18)-(20,19)
(20,23)-(20,25)
(20,35)-(20,49)
(20,37)-(20,38)
(20,41)-(20,42)
(20,46)-(20,48)
(20,56)-(20,75)
(20,60)-(20,74)
(20,62)-(20,63)
(20,66)-(20,67)
(20,71)-(20,73)
(21,4)-(23,51)
(21,19)-(21,20)
(22,15)-(22,27)
(22,15)-(22,55)
(22,38)-(22,40)
(22,42)-(22,55)
(22,43)-(22,51)
*)

(* type error slice
(15,4)-(23,51)
(15,10)-(20,75)
(16,6)-(20,75)
(16,6)-(20,75)
(16,6)-(20,75)
(16,6)-(20,75)
(16,12)-(16,13)
(17,14)-(17,16)
(19,10)-(20,75)
(20,10)-(20,75)
(20,31)-(20,50)
(21,4)-(23,51)
(21,15)-(21,21)
(23,18)-(23,32)
(23,18)-(23,44)
(23,33)-(23,34)
(23,35)-(23,39)
*)
