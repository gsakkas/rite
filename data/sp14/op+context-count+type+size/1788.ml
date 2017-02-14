
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + carry) / 10) :: ((h + carry) mod 10) :: t
      | _ -> [carry / 10; carry mod 10] in
    let base = 0 in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

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
(15,20)-(15,23)
(15,20)-(15,25)
(15,20)-(15,35)
(15,24)-(15,25)
(15,30)-(15,33)
(15,30)-(15,35)
(16,7)-(18,40)
(16,13)-(16,14)
(17,19)-(17,20)
(17,19)-(17,64)
(17,23)-(17,28)
(17,32)-(17,34)
(17,41)-(17,42)
(17,41)-(17,58)
(17,41)-(17,64)
(17,56)-(17,58)
(17,63)-(17,64)
(18,14)-(18,40)
(18,15)-(18,20)
(18,15)-(18,25)
(18,23)-(18,25)
(18,27)-(18,32)
(18,27)-(18,39)
(18,37)-(18,39)
(19,5)-(21,52)
(19,16)-(19,17)
(20,5)-(21,52)
(20,16)-(20,44)
(21,5)-(21,52)
*)

(* type error slice
(14,5)-(21,52)
(14,11)-(18,40)
(16,7)-(18,40)
(16,7)-(18,40)
(16,13)-(16,14)
(19,5)-(21,52)
(19,16)-(19,17)
(21,19)-(21,33)
(21,19)-(21,45)
(21,34)-(21,35)
(21,36)-(21,40)
*)
