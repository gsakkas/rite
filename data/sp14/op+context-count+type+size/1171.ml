
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
      if (List.length a) = 5
      then c :: s
      else ((((c + x') + x'') / 10), ((((c + x') + x'') mod 10) :: s)) in
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
      match (c, s) with
      | (c,[]) -> (c, (c :: s))
      | _ -> ((((c + x') + x'') / 10), ((((c + x') + x'') mod 10) :: s)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,6)-(20,70)
(18,9)-(18,24)
(18,9)-(18,28)
(18,10)-(18,21)
(18,22)-(18,23)
(18,27)-(18,28)
(19,11)-(19,17)
*)

(* type error slice
(15,4)-(23,51)
(15,10)-(20,70)
(15,12)-(20,70)
(16,6)-(20,70)
(17,6)-(20,70)
(17,6)-(20,70)
(17,18)-(17,19)
(18,6)-(20,70)
(18,6)-(20,70)
(18,9)-(18,24)
(18,10)-(18,21)
(18,22)-(18,23)
(19,11)-(19,17)
(20,11)-(20,70)
(23,18)-(23,32)
(23,18)-(23,44)
(23,33)-(23,34)
*)
