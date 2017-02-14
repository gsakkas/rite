
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | [] -> x | h::t -> x in
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
(14,16)-(14,50)
(14,22)-(14,23)
(14,37)-(14,38)
(14,49)-(14,50)
(16,15)-(16,40)
(16,16)-(16,39)
(16,17)-(16,34)
*)

(* type error slice
(14,4)-(17,51)
(14,10)-(14,50)
(14,12)-(14,50)
(14,16)-(14,50)
(14,16)-(14,50)
(14,16)-(14,50)
(14,22)-(14,23)
(14,37)-(14,38)
(15,4)-(17,51)
(15,15)-(15,22)
(17,18)-(17,32)
(17,18)-(17,44)
(17,33)-(17,34)
(17,35)-(17,39)
*)
