
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + x in
    let base = 0 in
    let args = (l1, l2) in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (x,y) -> x in
      match x with
      | (add1,add2) ->
          let new_carry = ((carry + add1) + add2) / 10 in
          let digit = ((carry + add1) + add2) mod 10 in
          (match a with | (x,y) -> (new_carry, (digit :: y))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,17)-(15,18)
(15,17)-(15,22)
(16,5)-(17,75)
(16,16)-(16,17)
(17,5)-(17,75)
(17,17)-(17,19)
(17,17)-(17,23)
(17,21)-(17,23)
(17,42)-(17,56)
(17,42)-(17,68)
(17,57)-(17,58)
(17,59)-(17,63)
(17,64)-(17,68)
(17,72)-(17,75)
(18,3)-(18,13)
(18,15)-(18,18)
(18,15)-(18,33)
(18,20)-(18,27)
(18,20)-(18,33)
(18,28)-(18,30)
(18,31)-(18,33)
*)

(* type error slice
(15,5)-(17,75)
(15,11)-(15,22)
(15,13)-(15,22)
(15,17)-(15,18)
(15,17)-(15,22)
(15,21)-(15,22)
(16,5)-(17,75)
(16,16)-(16,17)
(17,5)-(17,75)
(17,17)-(17,19)
(17,17)-(17,23)
(17,21)-(17,23)
(17,42)-(17,56)
(17,42)-(17,68)
(17,57)-(17,58)
(17,59)-(17,63)
(17,64)-(17,68)
*)
