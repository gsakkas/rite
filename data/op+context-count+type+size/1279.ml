
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
      let sum = (c + s) + t in ((sum / 10), (x :: (sum mod 10) :: a)) in
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
(15,15)-(17,68)
(16,7)-(17,68)
(17,7)-(17,68)
(17,18)-(17,28)
(17,22)-(17,23)
(17,27)-(17,28)
(17,34)-(17,37)
(17,34)-(17,42)
(17,34)-(17,68)
(17,40)-(17,42)
(17,46)-(17,47)
(17,52)-(17,55)
(17,52)-(17,68)
(17,60)-(17,62)
(17,67)-(17,68)
(18,5)-(20,52)
(18,17)-(18,23)
(18,20)-(18,23)
(18,21)-(18,22)
(19,5)-(20,52)
(19,16)-(19,44)
(20,5)-(20,52)
*)

(* type error slice
(16,7)-(17,68)
(16,19)-(16,20)
(17,46)-(17,47)
(17,46)-(17,68)
(17,46)-(17,68)
(17,52)-(17,62)
(17,52)-(17,68)
(17,52)-(17,68)
*)
