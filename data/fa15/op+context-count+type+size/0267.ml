
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
(16,6)-(22,43)
(16,12)-(16,13)
(17,14)-(17,16)
(19,10)-(22,43)
(20,10)-(22,43)
(20,14)-(20,15)
(20,18)-(20,19)
(20,23)-(20,25)
(21,16)-(21,23)
(21,17)-(21,18)
(21,25)-(21,45)
(21,26)-(21,27)
(21,32)-(21,33)
(21,36)-(21,37)
(21,41)-(21,43)
(22,15)-(22,26)
(22,15)-(22,43)
(22,16)-(22,17)
(22,20)-(22,25)
(22,21)-(22,22)
(22,23)-(22,24)
(22,29)-(22,43)
(22,31)-(22,32)
(22,35)-(22,36)
(22,40)-(22,42)
(23,4)-(25,51)
(23,19)-(23,20)
(24,4)-(25,51)
(24,15)-(24,27)
(24,15)-(24,54)
(24,28)-(24,54)
(24,29)-(24,40)
(24,38)-(24,40)
(24,42)-(24,50)
(24,42)-(24,53)
(25,4)-(25,51)
*)

(* type error slice
(15,4)-(25,51)
(15,10)-(22,43)
(16,6)-(22,43)
(16,6)-(22,43)
(16,6)-(22,43)
(16,6)-(22,43)
(16,12)-(16,13)
(17,14)-(17,16)
(19,10)-(22,43)
(20,10)-(22,43)
(20,10)-(22,43)
(21,15)-(21,46)
(22,15)-(22,26)
(22,15)-(22,43)
(22,15)-(22,43)
(22,15)-(22,43)
(22,20)-(22,25)
(22,21)-(22,22)
(22,29)-(22,43)
(23,4)-(25,51)
(23,15)-(23,21)
(24,28)-(24,54)
(24,29)-(24,37)
(24,29)-(24,40)
(25,18)-(25,32)
(25,18)-(25,44)
(25,33)-(25,34)
(25,35)-(25,39)
*)
