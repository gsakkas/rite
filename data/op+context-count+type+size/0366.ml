
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
    let f a x = match x with | _ -> a mod 10 | h::t -> (a + h) mod 10 in
    let base = [0] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
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
(15,17)-(15,70)
(15,23)-(15,24)
(15,37)-(15,38)
(15,37)-(15,45)
(15,43)-(15,45)
(15,57)-(15,58)
(15,57)-(15,70)
(15,61)-(15,62)
(15,68)-(15,70)
(16,5)-(18,52)
(16,16)-(16,19)
(16,17)-(16,18)
(17,5)-(18,52)
(17,16)-(17,44)
(17,26)-(17,38)
(17,39)-(17,41)
(17,42)-(17,44)
(18,5)-(18,52)
(18,19)-(18,33)
(18,19)-(18,45)
(18,34)-(18,35)
(18,36)-(18,40)
(18,41)-(18,45)
(18,49)-(18,52)
(19,3)-(19,13)
(19,3)-(19,33)
(19,15)-(19,18)
(19,20)-(19,27)
(19,20)-(19,33)
(19,28)-(19,30)
(19,31)-(19,33)
*)

(* type error slice
(15,5)-(18,52)
(15,11)-(15,70)
(15,37)-(15,38)
(15,37)-(15,45)
(16,5)-(18,52)
(16,16)-(16,19)
(18,19)-(18,33)
(18,19)-(18,45)
(18,34)-(18,35)
(18,36)-(18,40)
*)
