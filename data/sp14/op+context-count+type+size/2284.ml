
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
(14,17)-(14,25)
(14,17)-(14,45)
(14,26)-(14,45)
(15,20)-(15,21)
(16,16)-(16,41)
(16,19)-(16,34)
(16,19)-(16,39)
*)

(* type error slice
(10,3)-(10,70)
(10,3)-(10,70)
(10,51)-(10,61)
(10,51)-(10,63)
(10,62)-(10,63)
(13,3)-(18,33)
(13,12)-(17,52)
(14,5)-(17,52)
(15,5)-(17,52)
(15,5)-(17,52)
(15,17)-(15,21)
(15,20)-(15,21)
(16,5)-(17,52)
(17,5)-(17,52)
(17,5)-(17,52)
(17,19)-(17,33)
(17,19)-(17,45)
(17,36)-(17,40)
(17,49)-(17,52)
(18,3)-(18,13)
(18,3)-(18,33)
(18,15)-(18,18)
(18,15)-(18,33)
*)
