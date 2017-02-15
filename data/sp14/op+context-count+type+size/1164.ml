
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
    let f a x = failwith "to be implemented" in
    let base = 0 in
    let args = failwith "to be implemented" in
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
(15,16)-(15,24)
(15,16)-(15,44)
(15,25)-(15,44)
(16,4)-(18,51)
(16,15)-(16,16)
(17,4)-(18,51)
(17,15)-(17,23)
(17,15)-(17,43)
(17,24)-(17,43)
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
(16,4)-(18,51)
(16,15)-(16,16)
(18,4)-(18,51)
(18,18)-(18,32)
(18,18)-(18,44)
(18,35)-(18,39)
*)
