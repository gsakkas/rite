
let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  match (List.length l1) > (List.length l2) with
  | true  -> (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  | false  -> (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  let rec removeZH templ =
    match templ with
    | [] -> []
    | hd::tl -> if hd = 0 then removeZH tl else hd :: tl in
  removeZH l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + x in
    let base = ([], []) in
    let args = f l1 l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  match (List.length l1) > (List.length l2) with
  | true  -> (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  | false  -> (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  let rec removeZH templ =
    match templ with
    | [] -> []
    | hd::tl -> if hd = 0 then removeZH tl else hd :: tl in
  removeZH l;;

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
(23,16)-(23,17)
(23,16)-(23,21)
(24,4)-(25,73)
(24,15)-(24,23)
(24,16)-(24,18)
(24,20)-(24,22)
(25,4)-(25,73)
(25,15)-(25,16)
(25,15)-(25,22)
(25,17)-(25,19)
(25,20)-(25,22)
(25,26)-(25,73)
(25,40)-(25,54)
(25,40)-(25,66)
(25,55)-(25,56)
(25,57)-(25,61)
(25,62)-(25,66)
(25,70)-(25,73)
(26,2)-(26,12)
(26,2)-(26,34)
(26,13)-(26,34)
(26,14)-(26,17)
(26,18)-(26,33)
(26,19)-(26,26)
(26,27)-(26,29)
(26,30)-(26,32)
*)

(* type error slice
(9,3)-(12,76)
(9,12)-(12,74)
(9,15)-(12,74)
(10,2)-(12,74)
(11,13)-(11,73)
(11,18)-(11,72)
(11,67)-(11,68)
(22,2)-(26,34)
(22,11)-(25,73)
(23,4)-(25,73)
(23,10)-(23,21)
(23,12)-(23,21)
(23,16)-(23,17)
(23,16)-(23,21)
(23,16)-(23,21)
(23,20)-(23,21)
(24,4)-(25,73)
(24,15)-(24,23)
(25,15)-(25,16)
(25,15)-(25,22)
(25,20)-(25,22)
(25,40)-(25,54)
(25,40)-(25,66)
(25,55)-(25,56)
(25,57)-(25,61)
(26,13)-(26,34)
(26,14)-(26,17)
(26,18)-(26,33)
(26,19)-(26,26)
*)
