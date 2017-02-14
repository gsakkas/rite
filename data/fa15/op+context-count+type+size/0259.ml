
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
    let f a x = a + x in
    let base = 0 in
    let args = List.combine (l1 l2) in
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
(15,16)-(15,17)
(15,16)-(15,21)
(16,4)-(18,51)
(16,15)-(16,16)
(17,4)-(18,51)
(17,15)-(17,27)
(17,15)-(17,35)
(17,28)-(17,35)
(17,29)-(17,31)
(17,32)-(17,34)
(18,4)-(18,51)
(18,18)-(18,32)
(18,18)-(18,44)
(18,33)-(18,34)
(18,35)-(18,39)
(18,40)-(18,44)
(18,48)-(18,51)
(19,2)-(19,12)
(19,2)-(19,34)
(19,13)-(19,34)
(19,14)-(19,17)
(19,18)-(19,33)
(19,19)-(19,26)
(19,27)-(19,29)
(19,30)-(19,32)
*)

(* type error slice
(4,3)-(8,59)
(4,12)-(8,57)
(4,15)-(8,57)
(5,2)-(8,57)
(6,2)-(8,57)
(7,7)-(7,51)
(7,35)-(7,51)
(7,36)-(7,38)
(8,41)-(8,51)
(8,46)-(8,47)
(8,48)-(8,50)
(14,2)-(19,34)
(14,11)-(18,51)
(17,4)-(18,51)
(17,15)-(17,27)
(17,15)-(17,35)
(17,28)-(17,35)
(17,29)-(17,31)
(18,18)-(18,32)
(18,18)-(18,44)
(18,40)-(18,44)
(19,13)-(19,34)
(19,14)-(19,17)
(19,18)-(19,33)
(19,19)-(19,26)
*)
