
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
    let f a x = () in
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
(23,17)-(23,19)
(24,5)-(25,74)
(24,17)-(24,19)
(24,17)-(24,23)
(24,21)-(24,23)
(25,5)-(25,74)
(25,16)-(25,17)
(25,16)-(25,23)
(25,18)-(25,20)
(25,21)-(25,23)
(25,27)-(25,74)
(25,41)-(25,55)
(25,41)-(25,67)
(25,56)-(25,57)
(25,58)-(25,62)
(25,63)-(25,67)
(25,71)-(25,74)
(26,3)-(26,13)
(26,3)-(26,33)
(26,15)-(26,18)
(26,15)-(26,33)
(26,20)-(26,27)
(26,20)-(26,33)
(26,28)-(26,30)
(26,31)-(26,33)
*)

(* type error slice
(9,4)-(12,77)
(9,13)-(12,74)
(9,16)-(12,74)
(10,3)-(12,74)
(11,15)-(11,17)
(11,15)-(11,72)
(12,47)-(12,58)
(12,47)-(12,61)
(12,59)-(12,61)
(22,3)-(26,33)
(22,12)-(25,74)
(23,5)-(25,74)
(23,11)-(23,19)
(23,13)-(23,19)
(23,17)-(23,19)
(24,5)-(25,74)
(24,17)-(24,23)
(25,16)-(25,17)
(25,16)-(25,23)
(25,18)-(25,20)
(25,41)-(25,55)
(25,41)-(25,67)
(25,56)-(25,57)
(25,58)-(25,62)
(26,15)-(26,18)
(26,15)-(26,33)
(26,20)-(26,27)
(26,20)-(26,33)
*)
