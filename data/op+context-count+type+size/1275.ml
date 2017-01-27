
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
(15,17)-(15,25)
(15,17)-(15,45)
(15,26)-(15,45)
(16,17)-(16,20)
(16,17)-(16,25)
(16,18)-(16,19)
(16,22)-(16,25)
(16,23)-(16,24)
(17,5)-(18,52)
(17,16)-(17,68)
(17,19)-(17,39)
(17,29)-(17,36)
(17,29)-(17,39)
(17,37)-(17,39)
(17,44)-(17,52)
(17,44)-(17,64)
(17,54)-(17,61)
(17,54)-(17,64)
(19,3)-(19,13)
(19,15)-(19,18)
(19,15)-(19,33)
(19,20)-(19,27)
(19,20)-(19,33)
(19,28)-(19,30)
(19,31)-(19,33)
*)

(* type error slice
(3,51)-(3,56)
(3,51)-(3,65)
(3,57)-(3,58)
(3,60)-(3,65)
(5,4)-(8,70)
(5,17)-(8,67)
(5,20)-(8,67)
(6,3)-(8,67)
(6,7)-(6,18)
(6,7)-(6,21)
(6,19)-(6,21)
(6,26)-(6,37)
(6,26)-(6,40)
(6,38)-(6,40)
(7,9)-(7,11)
(7,9)-(7,66)
(7,15)-(7,20)
(7,15)-(7,58)
(7,15)-(7,66)
(7,21)-(7,22)
(7,25)-(7,58)
(7,62)-(7,63)
(7,64)-(7,66)
(14,3)-(19,33)
(14,12)-(18,52)
(15,5)-(18,52)
(15,11)-(15,45)
(15,13)-(15,45)
(16,5)-(18,52)
(16,17)-(16,20)
(16,17)-(16,25)
(16,18)-(16,19)
(16,22)-(16,25)
(16,23)-(16,24)
(17,5)-(18,52)
(17,16)-(17,68)
(17,19)-(17,27)
(17,19)-(17,39)
(17,19)-(17,64)
(17,29)-(17,36)
(17,29)-(17,39)
(17,37)-(17,39)
(17,44)-(17,52)
(17,44)-(17,64)
(17,54)-(17,61)
(17,54)-(17,64)
(17,62)-(17,64)
(18,5)-(18,52)
(18,19)-(18,33)
(18,19)-(18,45)
(18,34)-(18,35)
(18,36)-(18,40)
(18,41)-(18,45)
(18,49)-(18,52)
(19,15)-(19,18)
(19,15)-(19,33)
(19,20)-(19,27)
(19,20)-(19,33)
(19,28)-(19,30)
(19,31)-(19,33)
*)
