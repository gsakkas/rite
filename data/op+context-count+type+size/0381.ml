
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
      match x with
      | _ -> [a mod 10]
      | h::t -> ((a + h) mod 10) :: ((a + h) / 10) in
    let base = (0, 0) in
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
(16,7)-(18,50)
(16,13)-(16,14)
(17,14)-(17,24)
(17,15)-(17,16)
(17,15)-(17,23)
(17,21)-(17,23)
(18,19)-(18,20)
(18,19)-(18,50)
(18,23)-(18,24)
(18,30)-(18,32)
(18,39)-(18,40)
(18,39)-(18,50)
(18,43)-(18,44)
(18,48)-(18,50)
(19,5)-(21,52)
(19,17)-(19,18)
(19,17)-(19,21)
(19,20)-(19,21)
(20,5)-(21,52)
(20,16)-(20,44)
(21,5)-(21,52)
(22,3)-(22,13)
(22,15)-(22,18)
(22,15)-(22,33)
(22,20)-(22,27)
(22,20)-(22,33)
(22,28)-(22,30)
(22,31)-(22,33)
*)

(* type error slice
(15,5)-(21,52)
(15,11)-(18,50)
(15,13)-(18,50)
(16,7)-(18,50)
(17,14)-(17,24)
(17,15)-(17,16)
(17,15)-(17,23)
(18,19)-(18,50)
(18,39)-(18,50)
(21,19)-(21,33)
(21,19)-(21,45)
(21,34)-(21,35)
*)
