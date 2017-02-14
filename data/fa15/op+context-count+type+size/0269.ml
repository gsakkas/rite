
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
(16,7)-(20,74)
(16,13)-(16,14)
(17,15)-(17,17)
(19,11)-(20,74)
(19,23)-(19,24)
(20,15)-(20,16)
(20,19)-(20,20)
(20,24)-(20,26)
(20,38)-(20,39)
(20,38)-(20,49)
(20,42)-(20,43)
(20,47)-(20,49)
(20,58)-(20,74)
(20,63)-(20,64)
(20,63)-(20,74)
(20,67)-(20,68)
(20,72)-(20,74)
(21,5)-(23,52)
(21,20)-(21,21)
(22,16)-(22,28)
(22,16)-(22,55)
(22,39)-(22,41)
(22,44)-(22,52)
(22,44)-(22,55)
*)

(* type error slice
(15,5)-(23,52)
(15,11)-(20,74)
(16,7)-(20,74)
(16,7)-(20,74)
(16,7)-(20,74)
(16,7)-(20,74)
(16,13)-(16,14)
(17,15)-(17,17)
(19,11)-(20,74)
(20,11)-(20,74)
(20,33)-(20,49)
(21,5)-(23,52)
(21,17)-(21,21)
(23,19)-(23,33)
(23,19)-(23,45)
(23,34)-(23,35)
(23,36)-(23,40)
*)
