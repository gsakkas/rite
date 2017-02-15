
let rec clone x n =
  match n with | 0 -> [] | a -> if a < 0 then [] else (clone x (n - 1)) @ [x];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | h -> [] in
    let base = [0] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | 0 -> [] | a -> if a < 0 then [] else (clone x (n - 1)) @ [x];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (x,y) -> x in
      match x with
      | (addend_a,addend_b) ->
          let new_carry = ((carry + addend_a) + addend_b) / 10 in
          let digit = ((carry + addend_a) + addend_b) mod 10 in
          (match a with | (x,y) -> (new_carry, (digit :: y))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,16)-(15,38)
(15,22)-(15,23)
(15,36)-(15,38)
(16,4)-(18,51)
(16,15)-(16,18)
(16,16)-(16,17)
(17,4)-(18,51)
(17,15)-(17,23)
(17,15)-(17,44)
(17,24)-(17,44)
(17,25)-(17,37)
(17,38)-(17,40)
(17,41)-(17,43)
(18,4)-(18,51)
(18,18)-(18,32)
(18,18)-(18,44)
(18,33)-(18,34)
(18,35)-(18,39)
(18,40)-(18,44)
(18,48)-(18,51)
(19,2)-(19,12)
(19,2)-(19,34)
(19,13)-(19,34)
(19,14)-(19,17)
(19,18)-(19,33)
(19,19)-(19,26)
(19,27)-(19,29)
(19,30)-(19,32)
*)

(* type error slice
(16,4)-(18,51)
(16,15)-(16,18)
(18,4)-(18,51)
(18,18)-(18,32)
(18,18)-(18,44)
(18,35)-(18,39)
*)
