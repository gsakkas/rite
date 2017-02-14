
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
      match x with | _ -> [a mod 10] | h::t -> ((a + h) mod 10) :: t in
    let base = [] in
    let args = List.combine l1 l2 in
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
(16,6)-(16,68)
(16,12)-(16,13)
(16,26)-(16,36)
(16,27)-(16,28)
(16,27)-(16,35)
(16,33)-(16,35)
(16,47)-(16,68)
(16,49)-(16,50)
(16,53)-(16,54)
(16,60)-(16,62)
(16,67)-(16,68)
(17,4)-(19,51)
(17,15)-(17,17)
(18,4)-(19,51)
(18,15)-(18,27)
(18,15)-(18,33)
(18,28)-(18,30)
(18,31)-(18,33)
(19,4)-(19,51)
(19,18)-(19,32)
(19,18)-(19,44)
(19,33)-(19,34)
(19,35)-(19,39)
(19,40)-(19,44)
(19,48)-(19,51)
(20,2)-(20,12)
(20,2)-(20,34)
(20,14)-(20,17)
(20,19)-(20,26)
(20,27)-(20,29)
(20,30)-(20,32)
*)

(* type error slice
(15,4)-(19,51)
(15,10)-(16,68)
(15,12)-(16,68)
(16,6)-(16,68)
(16,26)-(16,36)
(16,27)-(16,28)
(16,27)-(16,35)
(19,18)-(19,32)
(19,18)-(19,44)
(19,33)-(19,34)
*)
