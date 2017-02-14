
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
    let base = ([0], [0]) in
    let args = [((List.rev (List.hd l1)), (List.rev (List.hd l2)))] in
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
(16,15)-(16,25)
(16,16)-(16,19)
(16,17)-(16,18)
(16,21)-(16,24)
(16,22)-(16,23)
(17,4)-(18,51)
(17,15)-(17,67)
(17,16)-(17,66)
(17,17)-(17,40)
(17,27)-(17,39)
(17,28)-(17,35)
(17,36)-(17,38)
(17,42)-(17,65)
(17,43)-(17,51)
(17,52)-(17,64)
(17,53)-(17,60)
(18,4)-(18,51)
(19,2)-(19,12)
(19,13)-(19,34)
(19,14)-(19,17)
(19,18)-(19,33)
(19,19)-(19,26)
(19,27)-(19,29)
(19,30)-(19,32)
*)

(* type error slice
(3,44)-(3,45)
(3,44)-(3,66)
(3,44)-(3,66)
(3,49)-(3,66)
(3,50)-(3,55)
(3,56)-(3,57)
(5,3)-(8,69)
(5,16)-(8,67)
(5,19)-(8,67)
(6,2)-(8,67)
(7,7)-(7,67)
(7,12)-(7,66)
(7,13)-(7,60)
(7,14)-(7,19)
(7,20)-(7,21)
(7,61)-(7,62)
(14,2)-(19,34)
(14,11)-(18,51)
(17,42)-(17,65)
(17,43)-(17,51)
(17,52)-(17,64)
(17,53)-(17,60)
(17,61)-(17,63)
(19,13)-(19,34)
(19,14)-(19,17)
(19,18)-(19,33)
(19,19)-(19,26)
*)
