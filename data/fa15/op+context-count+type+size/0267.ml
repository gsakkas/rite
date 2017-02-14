
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
          let (j,k) = x in
          if (j + k) > 10
          then ((j = 1), (k = ((j + k) - 10)))
          else (j = (0 k)) = ((j + k) - 10) in
    let base = (0, 0) in
    let args = List.combine (List.rev l1; List.rev l2) in
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
(16,7)-(22,43)
(16,13)-(16,14)
(17,15)-(17,17)
(19,11)-(22,43)
(20,11)-(22,43)
(20,15)-(20,16)
(20,19)-(20,20)
(20,24)-(20,26)
(21,18)-(21,19)
(21,18)-(21,23)
(21,27)-(21,28)
(21,27)-(21,44)
(21,33)-(21,34)
(21,37)-(21,38)
(21,42)-(21,44)
(22,17)-(22,18)
(22,17)-(22,25)
(22,17)-(22,43)
(22,22)-(22,23)
(22,22)-(22,25)
(22,24)-(22,25)
(22,32)-(22,33)
(22,32)-(22,43)
(22,36)-(22,37)
(22,41)-(22,43)
(23,5)-(25,52)
(23,20)-(23,21)
(24,5)-(25,52)
(24,16)-(24,28)
(24,16)-(24,54)
(24,30)-(24,41)
(24,30)-(24,54)
(24,39)-(24,41)
(24,43)-(24,51)
(24,43)-(24,54)
(25,5)-(25,52)
*)

(* type error slice
(15,5)-(25,52)
(15,11)-(22,43)
(16,7)-(22,43)
(16,7)-(22,43)
(16,7)-(22,43)
(16,7)-(22,43)
(16,13)-(16,14)
(17,15)-(17,17)
(19,11)-(22,43)
(20,11)-(22,43)
(20,11)-(22,43)
(21,18)-(21,44)
(22,17)-(22,25)
(22,17)-(22,43)
(22,17)-(22,43)
(22,17)-(22,43)
(22,22)-(22,23)
(22,22)-(22,25)
(22,32)-(22,43)
(23,5)-(25,52)
(23,17)-(23,21)
(24,30)-(24,38)
(24,30)-(24,41)
(24,30)-(24,54)
(25,19)-(25,33)
(25,19)-(25,45)
(25,34)-(25,35)
(25,36)-(25,40)
*)
