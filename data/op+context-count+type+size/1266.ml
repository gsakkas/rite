
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
(15,15)-(16,75)
(16,28)-(16,68)
(16,28)-(16,75)
(16,32)-(16,33)
(16,37)-(16,38)
(16,42)-(16,44)
(16,50)-(16,68)
(16,54)-(16,55)
(16,59)-(16,60)
(16,66)-(16,68)
(16,74)-(16,75)
*)

(* type error slice
(15,5)-(19,52)
(15,11)-(16,75)
(15,13)-(16,75)
(15,15)-(16,75)
(16,7)-(16,75)
(16,19)-(16,20)
(16,28)-(16,29)
(16,28)-(16,33)
(16,28)-(16,44)
(16,28)-(16,68)
(16,28)-(16,75)
(16,50)-(16,68)
(16,74)-(16,75)
(17,5)-(19,52)
(17,17)-(17,18)
(17,17)-(17,22)
(17,20)-(17,22)
(18,5)-(19,52)
(18,16)-(18,24)
(18,16)-(18,44)
(18,26)-(18,38)
(18,26)-(18,44)
(18,39)-(18,41)
(18,42)-(18,44)
(19,19)-(19,33)
(19,19)-(19,45)
(19,34)-(19,35)
(19,36)-(19,40)
(19,41)-(19,45)
*)
