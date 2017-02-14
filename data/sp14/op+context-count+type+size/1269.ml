
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
      let (s,t) = x in ((((c + s) + t) / 10), (((c + s) + t) mod 10)) :: a in
    let base = (0, []) in
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
(15,14)-(16,74)
(16,6)-(16,74)
(16,23)-(16,69)
(16,23)-(16,74)
(16,31)-(16,32)
(16,36)-(16,37)
(16,41)-(16,43)
(16,46)-(16,68)
(16,53)-(16,54)
(16,58)-(16,59)
(16,65)-(16,67)
(16,73)-(16,74)
(17,4)-(19,51)
(17,15)-(17,22)
(18,4)-(19,51)
(19,4)-(19,51)
*)

(* type error slice
(15,4)-(19,51)
(15,10)-(16,74)
(15,12)-(16,74)
(15,14)-(16,74)
(16,23)-(16,74)
(16,73)-(16,74)
(19,18)-(19,32)
(19,18)-(19,44)
(19,33)-(19,34)
*)
