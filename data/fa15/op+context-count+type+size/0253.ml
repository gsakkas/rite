
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
          then (1, (a :: ((j + k) - 10)))
          else (0, (a :: (j + k))) in
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
(16,7)-(20,32)
(18,11)-(20,32)
(18,15)-(18,16)
(18,19)-(18,20)
(18,24)-(18,26)
(19,21)-(19,22)
(19,28)-(19,29)
(19,32)-(19,33)
(19,37)-(19,39)
(20,17)-(20,32)
(20,21)-(20,22)
(20,27)-(20,28)
(20,31)-(20,32)
(21,5)-(23,52)
(24,15)-(24,18)
(24,20)-(24,27)
(24,20)-(24,33)
(24,28)-(24,30)
(24,31)-(24,33)
*)

(* type error slice
(15,5)-(23,52)
(15,11)-(20,32)
(15,13)-(20,32)
(16,7)-(20,32)
(18,11)-(20,32)
(19,17)-(19,39)
(19,21)-(19,22)
(19,21)-(19,39)
(19,21)-(19,39)
(19,21)-(19,39)
(19,28)-(19,39)
(20,21)-(20,32)
(20,27)-(20,32)
(23,19)-(23,33)
(23,19)-(23,45)
(23,34)-(23,35)
*)
