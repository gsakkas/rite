
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x c =
      let (s,t) = x in
      let sum = (c + s) + t in (x (sum / 10)) :: (sum mod 10) :: a in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x',x'') = x in
      let (c,s) = a in
      ((((c + x') + x'') / 10), ((((c + x') + x'') mod 10) :: s)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,14)-(17,66)
(16,6)-(17,66)
(17,6)-(17,66)
(17,16)-(17,27)
(17,21)-(17,22)
(17,26)-(17,27)
(17,31)-(17,45)
(17,31)-(17,66)
(17,32)-(17,33)
(17,34)-(17,44)
(17,35)-(17,38)
(17,41)-(17,43)
(17,50)-(17,53)
(17,58)-(17,60)
(17,65)-(17,66)
(18,4)-(20,51)
(18,15)-(18,23)
(18,19)-(18,22)
(18,20)-(18,21)
(19,4)-(20,51)
(19,15)-(19,44)
(20,4)-(20,51)
*)

(* type error slice
(15,4)-(20,51)
(15,10)-(17,66)
(15,12)-(17,66)
(15,14)-(17,66)
(16,6)-(17,66)
(16,18)-(16,19)
(17,31)-(17,45)
(17,32)-(17,33)
(17,49)-(17,66)
(17,65)-(17,66)
(20,18)-(20,32)
(20,18)-(20,44)
(20,33)-(20,34)
*)
