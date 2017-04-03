
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (add1,add2) -> ((add1 + add2) + a) mod 10 in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (carry,rest) ->
          (match x with
           | (add1,add2) ->
               ((((add1 + add2) + carry) / 10),
                 ((((add1 + add2) + carry) mod 10) :: rest))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,16)-(15,72)
(15,46)-(15,72)
(15,63)-(15,64)
(16,4)-(18,51)
(16,15)-(16,17)
*)

(* type error slice
(15,4)-(18,51)
(15,10)-(15,72)
(15,46)-(15,65)
(15,63)-(15,64)
(16,4)-(18,51)
(16,15)-(16,17)
(18,18)-(18,32)
(18,18)-(18,44)
(18,33)-(18,34)
(18,35)-(18,39)
*)

(* all spans
(2,14)-(2,65)
(2,16)-(2,65)
(2,20)-(2,65)
(2,23)-(2,29)
(2,23)-(2,24)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,65)
(2,43)-(2,44)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(2,57)-(2,64)
(2,58)-(2,59)
(2,62)-(2,63)
(4,12)-(8,31)
(4,15)-(8,31)
(5,2)-(8,31)
(5,10)-(5,45)
(5,10)-(5,26)
(5,11)-(5,22)
(5,23)-(5,25)
(5,29)-(5,45)
(5,30)-(5,41)
(5,42)-(5,44)
(6,2)-(8,31)
(6,5)-(6,10)
(6,5)-(6,6)
(6,9)-(6,10)
(7,7)-(7,40)
(7,8)-(7,35)
(7,30)-(7,31)
(7,9)-(7,29)
(7,10)-(7,15)
(7,16)-(7,17)
(7,18)-(7,28)
(7,19)-(7,23)
(7,26)-(7,27)
(7,32)-(7,34)
(7,37)-(7,39)
(8,7)-(8,31)
(8,8)-(8,10)
(8,12)-(8,30)
(8,25)-(8,26)
(8,13)-(8,24)
(8,14)-(8,19)
(8,20)-(8,21)
(8,22)-(8,23)
(8,27)-(8,29)
(10,19)-(11,74)
(11,2)-(11,74)
(11,8)-(11,9)
(11,23)-(11,25)
(11,36)-(11,74)
(11,39)-(11,44)
(11,39)-(11,40)
(11,43)-(11,44)
(11,50)-(11,62)
(11,50)-(11,60)
(11,61)-(11,62)
(11,68)-(11,74)
(11,68)-(11,69)
(11,73)-(11,74)
(13,11)-(19,34)
(13,14)-(19,34)
(14,2)-(19,34)
(14,11)-(18,51)
(15,4)-(18,51)
(15,10)-(15,72)
(15,12)-(15,72)
(15,16)-(15,72)
(15,22)-(15,23)
(15,46)-(15,72)
(15,46)-(15,65)
(15,47)-(15,60)
(15,48)-(15,52)
(15,55)-(15,59)
(15,63)-(15,64)
(15,70)-(15,72)
(16,4)-(18,51)
(16,15)-(16,17)
(17,4)-(18,51)
(17,15)-(17,44)
(17,15)-(17,23)
(17,24)-(17,44)
(17,25)-(17,37)
(17,38)-(17,40)
(17,41)-(17,43)
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
