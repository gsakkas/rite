
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
          if (j + k) > 10
          then (j = (1 k)) = ((j + k) - 10)
          else (j = (0 k)) = ((j + k) - 10) in
    let base = (0, 0) in
    let args = List.combine (clone l1 (List.length l2)) in
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
(19,22)-(19,23)
(20,14)-(20,15)
(20,18)-(20,19)
(20,23)-(20,25)
(21,15)-(21,26)
(21,15)-(21,43)
(21,16)-(21,17)
(21,20)-(21,25)
(21,23)-(21,24)
(21,31)-(21,32)
(21,35)-(21,36)
(21,40)-(21,42)
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
(24,15)-(24,55)
(24,29)-(24,34)
(24,38)-(24,54)
(24,39)-(24,50)
(25,4)-(25,51)
*)

(* type error slice
(4,3)-(8,59)
(4,12)-(8,57)
(4,15)-(8,57)
(5,2)-(8,57)
(6,2)-(8,57)
(7,7)-(7,51)
(7,17)-(7,22)
(7,17)-(7,31)
(7,23)-(7,24)
(7,35)-(7,51)
(7,36)-(7,38)
(8,41)-(8,51)
(8,46)-(8,47)
(8,48)-(8,50)
(14,2)-(26,34)
(14,11)-(25,51)
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
(21,15)-(21,26)
(21,15)-(21,43)
(21,15)-(21,43)
(21,15)-(21,43)
(21,20)-(21,25)
(21,21)-(21,22)
(21,29)-(21,43)
(22,15)-(22,26)
(22,15)-(22,43)
(22,15)-(22,43)
(22,20)-(22,25)
(22,21)-(22,22)
(22,29)-(22,43)
(23,4)-(25,51)
(23,15)-(23,21)
(24,28)-(24,55)
(24,29)-(24,34)
(24,35)-(24,37)
(25,18)-(25,32)
(25,18)-(25,44)
(25,33)-(25,34)
(25,35)-(25,39)
(26,13)-(26,34)
(26,14)-(26,17)
(26,18)-(26,33)
(26,19)-(26,26)
*)
