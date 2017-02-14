
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
      if (List.length x) = (List.length s)
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
(18,7)-(20,69)
(18,11)-(18,22)
(18,11)-(18,24)
(18,11)-(18,42)
(18,23)-(18,24)
(18,29)-(18,40)
(18,29)-(18,42)
(18,41)-(18,42)
(19,12)-(19,18)
*)

(* type error slice
(15,5)-(23,52)
(15,11)-(20,69)
(15,13)-(20,69)
(16,7)-(20,69)
(16,7)-(20,69)
(16,22)-(16,23)
(17,7)-(20,69)
(17,7)-(20,69)
(17,19)-(17,20)
(18,7)-(20,69)
(18,7)-(20,69)
(18,11)-(18,22)
(18,11)-(18,24)
(18,23)-(18,24)
(19,12)-(19,18)
(20,16)-(20,69)
(23,19)-(23,33)
(23,19)-(23,45)
(23,34)-(23,35)
*)
