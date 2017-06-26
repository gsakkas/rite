
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | [] -> a in
    let base = (0, []) in
    let args = [((List.combine l1), l2)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,16)-(14,38)
(14,22)-(14,23)
(16,15)-(16,40)
(16,16)-(16,39)
(16,17)-(16,34)
*)

(* type error slice
(14,4)-(17,51)
(14,10)-(14,38)
(14,12)-(14,38)
(14,16)-(14,38)
(14,22)-(14,23)
(16,4)-(17,51)
(16,15)-(16,40)
(16,16)-(16,39)
(17,18)-(17,32)
(17,18)-(17,44)
(17,33)-(17,34)
(17,40)-(17,44)
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
(4,12)-(7,70)
(4,15)-(7,70)
(5,2)-(7,70)
(5,14)-(5,28)
(5,14)-(5,25)
(5,26)-(5,28)
(6,2)-(7,70)
(6,14)-(6,28)
(6,14)-(6,25)
(6,26)-(6,28)
(7,2)-(7,70)
(7,3)-(7,35)
(7,30)-(7,31)
(7,4)-(7,29)
(7,5)-(7,10)
(7,11)-(7,12)
(7,13)-(7,28)
(7,14)-(7,19)
(7,22)-(7,27)
(7,32)-(7,34)
(7,37)-(7,69)
(7,64)-(7,65)
(7,38)-(7,63)
(7,39)-(7,44)
(7,45)-(7,46)
(7,47)-(7,62)
(7,48)-(7,53)
(7,56)-(7,61)
(7,66)-(7,68)
(9,19)-(10,69)
(10,2)-(10,69)
(10,8)-(10,9)
(10,23)-(10,25)
(10,36)-(10,69)
(10,39)-(10,44)
(10,39)-(10,40)
(10,43)-(10,44)
(10,50)-(10,62)
(10,50)-(10,60)
(10,61)-(10,62)
(10,68)-(10,69)
(12,11)-(18,34)
(12,14)-(18,34)
(13,2)-(18,34)
(13,11)-(17,51)
(14,4)-(17,51)
(14,10)-(14,38)
(14,12)-(14,38)
(14,16)-(14,38)
(14,22)-(14,23)
(14,37)-(14,38)
(15,4)-(17,51)
(15,15)-(15,22)
(15,16)-(15,17)
(15,19)-(15,21)
(16,4)-(17,51)
(16,15)-(16,40)
(16,16)-(16,39)
(16,17)-(16,34)
(16,18)-(16,30)
(16,31)-(16,33)
(16,36)-(16,38)
(17,4)-(17,51)
(17,18)-(17,44)
(17,18)-(17,32)
(17,33)-(17,34)
(17,35)-(17,39)
(17,40)-(17,44)
(17,48)-(17,51)
(18,2)-(18,34)
(18,2)-(18,12)
(18,13)-(18,34)
(18,14)-(18,17)
(18,18)-(18,33)
(18,19)-(18,26)
(18,27)-(18,29)
(18,30)-(18,32)
*)
