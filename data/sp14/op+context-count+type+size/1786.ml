
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
    let base = [] in
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
(15,18)-(15,25)
(15,18)-(15,35)
(15,19)-(15,22)
(15,23)-(15,24)
(15,28)-(15,35)
(15,29)-(15,32)
(16,6)-(18,39)
(16,12)-(16,13)
(17,16)-(17,63)
(17,18)-(17,19)
(17,22)-(17,27)
(17,31)-(17,33)
(17,38)-(17,58)
(17,38)-(17,63)
(17,40)-(17,41)
(17,55)-(17,57)
(17,62)-(17,63)
(18,13)-(18,39)
(18,14)-(18,19)
(18,14)-(18,24)
(18,22)-(18,24)
(18,26)-(18,31)
(18,26)-(18,38)
(18,36)-(18,38)
(19,4)-(21,51)
(19,15)-(19,17)
(20,4)-(21,51)
(21,4)-(21,51)
*)

(* type error slice
(14,4)-(21,51)
(14,10)-(18,39)
(16,6)-(18,39)
(16,6)-(18,39)
(16,12)-(16,13)
(21,4)-(21,51)
(21,18)-(21,32)
(21,18)-(21,44)
(21,33)-(21,34)
*)
