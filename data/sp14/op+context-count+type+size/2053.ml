
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
    let base = (0, 0) in
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
(14,16)-(14,24)
(14,16)-(14,44)
(14,25)-(14,44)
(15,19)-(15,20)
(16,15)-(16,40)
(16,16)-(16,39)
(16,17)-(16,34)
(18,19)-(18,26)
*)

(* type error slice
(10,2)-(10,69)
(10,2)-(10,69)
(10,50)-(10,60)
(10,50)-(10,62)
(10,61)-(10,62)
(13,2)-(18,34)
(13,11)-(17,51)
(14,4)-(17,51)
(15,4)-(17,51)
(15,4)-(17,51)
(15,15)-(15,21)
(15,19)-(15,20)
(16,4)-(17,51)
(17,4)-(17,51)
(17,4)-(17,51)
(17,18)-(17,32)
(17,18)-(17,44)
(17,35)-(17,39)
(17,48)-(17,51)
(18,2)-(18,12)
(18,2)-(18,34)
(18,13)-(18,34)
(18,14)-(18,17)
*)
