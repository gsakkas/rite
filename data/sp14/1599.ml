
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
    let args = List.rev (List.hd l1) in
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
(16,16)-(16,19)
(16,21)-(16,24)
(16,22)-(16,23)
(17,24)-(17,36)
(17,25)-(17,32)
(17,33)-(17,35)
(18,4)-(18,51)
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
(7,8)-(7,10)
(7,13)-(7,60)
(7,14)-(7,19)
(7,20)-(7,21)
(8,8)-(8,62)
(8,9)-(8,56)
(8,10)-(8,15)
(8,57)-(8,58)
(8,59)-(8,61)
(14,2)-(19,34)
(14,11)-(18,51)
(17,15)-(17,23)
(17,15)-(17,36)
(17,24)-(17,36)
(17,25)-(17,32)
(17,33)-(17,35)
(19,13)-(19,34)
(19,14)-(19,17)
(19,18)-(19,33)
(19,19)-(19,26)
*)

(* all spans
(2,14)-(3,66)
(2,16)-(3,66)
(3,2)-(3,66)
(3,8)-(3,9)
(3,34)-(3,36)
(3,44)-(3,66)
(3,44)-(3,45)
(3,49)-(3,66)
(3,50)-(3,55)
(3,56)-(3,57)
(3,58)-(3,65)
(3,59)-(3,60)
(3,63)-(3,64)
(5,16)-(8,67)
(5,19)-(8,67)
(6,2)-(8,67)
(6,5)-(6,40)
(6,5)-(6,21)
(6,6)-(6,17)
(6,18)-(6,20)
(6,24)-(6,40)
(6,25)-(6,36)
(6,37)-(6,39)
(7,7)-(7,67)
(7,8)-(7,10)
(7,12)-(7,66)
(7,61)-(7,62)
(7,13)-(7,60)
(7,14)-(7,19)
(7,20)-(7,21)
(7,22)-(7,59)
(7,23)-(7,39)
(7,24)-(7,35)
(7,36)-(7,38)
(7,42)-(7,58)
(7,43)-(7,54)
(7,55)-(7,57)
(7,63)-(7,65)
(8,7)-(8,67)
(8,8)-(8,62)
(8,57)-(8,58)
(8,9)-(8,56)
(8,10)-(8,15)
(8,16)-(8,17)
(8,18)-(8,55)
(8,19)-(8,35)
(8,20)-(8,31)
(8,32)-(8,34)
(8,38)-(8,54)
(8,39)-(8,50)
(8,51)-(8,53)
(8,59)-(8,61)
(8,64)-(8,66)
(10,19)-(11,69)
(11,2)-(11,69)
(11,8)-(11,9)
(11,23)-(11,25)
(11,36)-(11,69)
(11,39)-(11,44)
(11,39)-(11,40)
(11,43)-(11,44)
(11,50)-(11,62)
(11,50)-(11,60)
(11,61)-(11,62)
(11,68)-(11,69)
(13,11)-(19,34)
(13,14)-(19,34)
(14,2)-(19,34)
(14,11)-(18,51)
(15,4)-(18,51)
(15,10)-(15,44)
(15,12)-(15,44)
(15,16)-(15,44)
(15,16)-(15,24)
(15,25)-(15,44)
(16,4)-(18,51)
(16,15)-(16,25)
(16,16)-(16,19)
(16,17)-(16,18)
(16,21)-(16,24)
(16,22)-(16,23)
(17,4)-(18,51)
(17,15)-(17,36)
(17,15)-(17,23)
(17,24)-(17,36)
(17,25)-(17,32)
(17,33)-(17,35)
(18,4)-(18,51)
(18,18)-(18,44)
(18,18)-(18,32)
(18,33)-(18,34)
(18,35)-(18,39)
(18,40)-(18,44)
(18,48)-(18,51)
(19,2)-(19,34)
(19,2)-(19,12)
(19,13)-(19,34)
(19,14)-(19,17)
(19,18)-(19,33)
(19,19)-(19,26)
(19,27)-(19,29)
(19,30)-(19,32)
*)
