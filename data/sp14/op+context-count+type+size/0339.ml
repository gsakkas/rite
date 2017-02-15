
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
(16,6)-(18,50)
(16,12)-(16,13)
(17,13)-(17,23)
(17,14)-(17,15)
(17,14)-(17,22)
(17,20)-(17,22)
(18,16)-(18,50)
(18,18)-(18,19)
(18,22)-(18,23)
(18,29)-(18,31)
(18,36)-(18,50)
(18,38)-(18,39)
(18,42)-(18,43)
(18,47)-(18,49)
(19,4)-(21,51)
(19,15)-(19,21)
(19,16)-(19,17)
(19,19)-(19,20)
(20,4)-(21,51)
(20,15)-(20,44)
(21,4)-(21,51)
(22,2)-(22,12)
(22,13)-(22,34)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
(22,27)-(22,29)
(22,30)-(22,32)
*)

(* type error slice
(15,4)-(21,51)
(15,10)-(18,50)
(15,12)-(18,50)
(16,6)-(18,50)
(17,13)-(17,23)
(17,14)-(17,15)
(17,14)-(17,22)
(18,16)-(18,50)
(18,36)-(18,50)
(21,18)-(21,32)
(21,18)-(21,44)
(21,33)-(21,34)
*)
