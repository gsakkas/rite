
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
    let base = failwith "to be implemented" in
    let args = l1 l2 in let (_,res) = List.fold_left f base args in res in
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
(16,4)-(17,71)
(16,15)-(16,23)
(16,15)-(16,43)
(16,24)-(16,43)
(17,4)-(17,71)
(17,15)-(17,17)
(17,15)-(17,20)
(17,18)-(17,20)
(17,24)-(17,71)
(17,38)-(17,52)
(17,38)-(17,64)
(17,53)-(17,54)
(17,55)-(17,59)
(17,60)-(17,64)
(17,68)-(17,71)
(18,2)-(18,12)
(18,2)-(18,34)
(18,14)-(18,17)
(18,18)-(18,33)
(18,19)-(18,26)
(18,27)-(18,29)
(18,30)-(18,32)
*)

(* type error slice
(5,3)-(8,69)
(5,16)-(8,67)
(5,19)-(8,67)
(6,2)-(8,67)
(7,7)-(7,67)
(7,8)-(7,10)
(8,38)-(8,54)
(8,39)-(8,50)
(8,51)-(8,53)
(14,2)-(18,34)
(14,11)-(17,71)
(17,15)-(17,17)
(17,15)-(17,20)
(18,13)-(18,34)
(18,14)-(18,17)
(18,18)-(18,33)
(18,19)-(18,26)
*)
