
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = ([], []) in
    let args = List.combine (l1 l2) in
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
(14,17)-(14,25)
(14,17)-(14,45)
(14,26)-(14,45)
(15,17)-(15,19)
(16,16)-(16,35)
(16,30)-(16,35)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(2,59)-(2,64)
(4,4)-(7,73)
(4,13)-(7,69)
(4,16)-(7,69)
(5,3)-(7,69)
(5,15)-(5,26)
(5,15)-(5,29)
(5,27)-(5,29)
(6,3)-(7,69)
(6,15)-(6,26)
(6,15)-(6,29)
(6,27)-(6,29)
(7,6)-(7,11)
(7,6)-(7,28)
(7,6)-(7,35)
(7,6)-(7,69)
(7,12)-(7,13)
(7,15)-(7,28)
(7,31)-(7,32)
(7,33)-(7,35)
(7,40)-(7,45)
(7,40)-(7,62)
(7,40)-(7,69)
(7,46)-(7,47)
(7,49)-(7,62)
(7,65)-(7,66)
(7,67)-(7,69)
(13,3)-(18,33)
(13,12)-(17,52)
(14,5)-(17,52)
(14,11)-(14,45)
(14,13)-(14,45)
(15,5)-(17,52)
(15,17)-(15,19)
(15,17)-(15,23)
(15,21)-(15,23)
(16,5)-(17,52)
(16,16)-(16,28)
(16,16)-(16,35)
(16,30)-(16,32)
(16,30)-(16,35)
(16,33)-(16,35)
(17,5)-(17,52)
(17,19)-(17,33)
(17,19)-(17,45)
(17,34)-(17,35)
(17,36)-(17,40)
(17,41)-(17,45)
(17,49)-(17,52)
(18,15)-(18,18)
(18,15)-(18,33)
(18,20)-(18,27)
(18,20)-(18,33)
(18,28)-(18,30)
(18,31)-(18,33)
*)
