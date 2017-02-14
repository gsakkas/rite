
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
      | (j,k) ->
          if (j + k) > 10
          then (1, (x :: ((j + k) - 10)))
          else (0, (x :: (j + k))) in
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
(16,6)-(20,34)
(18,10)-(20,34)
(18,14)-(18,15)
(18,18)-(18,19)
(18,23)-(18,25)
(19,20)-(19,21)
(19,27)-(19,28)
(19,31)-(19,32)
(19,36)-(19,38)
(20,15)-(20,34)
(20,20)-(20,21)
(20,26)-(20,27)
(20,30)-(20,31)
(21,4)-(23,51)
(24,14)-(24,17)
(24,18)-(24,33)
(24,19)-(24,26)
(24,27)-(24,29)
(24,30)-(24,32)
*)

(* type error slice
(11,2)-(11,75)
(11,2)-(11,75)
(11,39)-(11,40)
(11,39)-(11,45)
(11,39)-(11,45)
(11,44)-(11,45)
(11,51)-(11,61)
(11,51)-(11,63)
(11,62)-(11,63)
(14,2)-(24,34)
(14,11)-(23,51)
(15,4)-(23,51)
(15,4)-(23,51)
(15,10)-(20,34)
(15,12)-(20,34)
(16,6)-(20,34)
(18,10)-(20,34)
(19,15)-(19,41)
(19,19)-(19,40)
(19,19)-(19,40)
(19,19)-(19,40)
(19,20)-(19,21)
(19,25)-(19,39)
(20,19)-(20,33)
(20,25)-(20,32)
(21,4)-(23,51)
(22,4)-(23,51)
(22,4)-(23,51)
(22,15)-(22,23)
(22,15)-(22,44)
(22,24)-(22,44)
(22,25)-(22,37)
(23,4)-(23,51)
(23,4)-(23,51)
(23,18)-(23,32)
(23,18)-(23,44)
(23,33)-(23,34)
(23,40)-(23,44)
(23,48)-(23,51)
(24,2)-(24,12)
(24,2)-(24,34)
(24,13)-(24,34)
(24,14)-(24,17)
*)
