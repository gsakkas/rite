
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
(14,16)-(14,24)
(14,16)-(14,44)
(14,25)-(14,44)
(15,16)-(15,18)
(16,15)-(16,35)
(16,28)-(16,35)
*)

(* type error slice
(4,3)-(7,72)
(4,12)-(7,70)
(4,15)-(7,70)
(5,2)-(7,70)
(6,2)-(7,70)
(7,2)-(7,70)
(7,3)-(7,35)
(7,30)-(7,31)
(13,2)-(18,34)
(13,11)-(17,51)
(16,4)-(17,51)
(16,15)-(16,27)
(16,15)-(16,35)
(16,28)-(16,35)
(16,29)-(16,31)
(17,18)-(17,32)
(17,18)-(17,44)
(17,40)-(17,44)
(18,13)-(18,34)
(18,14)-(18,17)
(18,18)-(18,33)
(18,19)-(18,26)
*)
