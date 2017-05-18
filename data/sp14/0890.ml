
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = x in
    let base = [] in
    let args = [] in let (_,res) = List.fold_left f base args in res in
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
    let f a x = x in
    let base = ([], []) in
    let args = [([], [])] in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,15)-(15,17)
(16,4)-(16,68)
(16,15)-(16,17)
(16,21)-(16,68)
*)

(* type error slice
(15,4)-(16,68)
(15,15)-(15,17)
(16,21)-(16,68)
(16,35)-(16,49)
(16,35)-(16,61)
(16,52)-(16,56)
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
(12,11)-(17,34)
(12,14)-(17,34)
(13,2)-(17,34)
(13,11)-(16,68)
(14,4)-(16,68)
(14,10)-(14,17)
(14,12)-(14,17)
(14,16)-(14,17)
(15,4)-(16,68)
(15,15)-(15,17)
(16,4)-(16,68)
(16,15)-(16,17)
(16,21)-(16,68)
(16,35)-(16,61)
(16,35)-(16,49)
(16,50)-(16,51)
(16,52)-(16,56)
(16,57)-(16,61)
(16,65)-(16,68)
(17,2)-(17,34)
(17,2)-(17,12)
(17,13)-(17,34)
(17,14)-(17,17)
(17,18)-(17,33)
(17,19)-(17,26)
(17,27)-(17,29)
(17,30)-(17,32)
*)
