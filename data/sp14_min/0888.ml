
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
    let base = l1 in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
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
(15,16)-(15,18)
([] , [])
TupleG [ListG [],ListG []]

(16,16)-(16,18)
[([] , [])]
ListG [TupleG [ListG [],ListG []]]

*)

(* type error slice
(4,4)-(7,73)
(4,13)-(7,71)
(4,16)-(7,71)
(5,3)-(7,71)
(6,3)-(7,71)
(7,3)-(7,71)
(7,4)-(7,36)
(7,31)-(7,32)
(13,3)-(17,35)
(13,12)-(16,69)
(15,5)-(16,69)
(15,16)-(15,18)
(16,22)-(16,69)
(16,36)-(16,50)
(16,36)-(16,62)
(16,53)-(16,57)
(17,14)-(17,35)
(17,15)-(17,18)
(17,19)-(17,34)
(17,20)-(17,27)
*)
