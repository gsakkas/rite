
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
    let f a x = match x with | [] -> 0 | h::t -> if h > 9 then 8 in
    let base = [] in
    let args = l1 in let (_,res) = List.fold_left f base args in res in
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
(15,17)-(15,65)
(15,23)-(15,24)
(15,38)-(15,39)
(15,50)-(15,65)
(15,53)-(15,54)
(15,53)-(15,58)
(15,57)-(15,58)
(15,64)-(15,65)
(16,5)-(17,69)
(16,16)-(16,18)
(17,5)-(17,69)
(17,16)-(17,18)
(17,22)-(17,69)
(17,36)-(17,50)
(17,36)-(17,62)
(17,51)-(17,52)
(17,53)-(17,57)
(17,58)-(17,62)
(17,66)-(17,69)
(18,3)-(18,13)
(18,15)-(18,18)
(18,15)-(18,33)
(18,20)-(18,27)
(18,20)-(18,33)
(18,28)-(18,30)
(18,31)-(18,33)
*)

(* type error slice
(15,5)-(17,69)
(15,11)-(15,65)
(15,13)-(15,65)
(15,17)-(15,65)
(15,23)-(15,24)
(15,38)-(15,39)
(15,50)-(15,65)
(15,64)-(15,65)
(16,5)-(17,69)
(16,16)-(16,18)
(17,5)-(17,69)
(17,16)-(17,18)
(17,36)-(17,50)
(17,36)-(17,62)
(17,51)-(17,52)
(17,53)-(17,57)
(17,58)-(17,62)
*)
