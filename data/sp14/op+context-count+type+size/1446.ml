
let rec clone x n =
  match n > 0 with | true  -> x :: (clone x (n - 1)) | false  -> [];;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  match length1 >= length2 with
  | true  ->
      let n = length1 - length2 in
      let zeroes = clone 0 n in (l1, (List.append zeroes l2))
  | false  ->
      let n = length2 - length1 in
      let zeroes = clone 0 n in ((List.append zeroes l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (h1::t1,h2::t2) -> (match x with | h3::t3 -> (t1, (h1 :: h3 :: t3))) in
    let base = (l1, []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n > 0 with | true  -> x :: (clone x (n - 1)) | false  -> [];;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  match length1 >= length2 with
  | true  ->
      let n = length1 - length2 in
      let zeroes = clone 0 n in (l1, (List.append zeroes l2))
  | false  ->
      let n = length2 - length1 in
      let zeroes = clone 0 n in ((List.append zeroes l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> t);;

let bigAdd l1 l2 =
  let add (l1,l2) = [0; 0; 0; 0; 0] in removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,4)-(27,68)
(23,10)-(25,76)
(23,12)-(25,76)
(24,6)-(25,76)
(24,12)-(24,13)
(25,27)-(25,76)
(25,34)-(25,35)
(25,53)-(25,75)
(25,54)-(25,56)
(25,58)-(25,74)
(25,59)-(25,61)
(25,65)-(25,67)
(25,65)-(25,73)
(25,71)-(25,73)
(26,4)-(27,68)
(26,15)-(26,23)
(26,16)-(26,18)
*)

(* type error slice
(5,3)-(14,63)
(5,12)-(14,61)
(5,15)-(14,61)
(6,2)-(14,61)
(7,2)-(14,61)
(8,2)-(14,61)
(10,6)-(11,61)
(11,6)-(11,61)
(11,6)-(11,61)
(11,19)-(11,24)
(11,19)-(11,28)
(11,32)-(11,61)
(11,33)-(11,35)
(11,37)-(11,60)
(11,38)-(11,49)
(11,50)-(11,56)
(14,6)-(14,61)
(14,19)-(14,24)
(14,19)-(14,28)
(14,33)-(14,56)
(14,34)-(14,45)
(14,46)-(14,52)
(14,53)-(14,55)
(22,2)-(28,34)
(22,11)-(27,68)
(23,4)-(27,68)
(23,10)-(25,76)
(23,12)-(25,76)
(24,6)-(25,76)
(24,6)-(25,76)
(24,12)-(24,13)
(25,27)-(25,76)
(25,27)-(25,76)
(25,34)-(25,35)
(25,58)-(25,74)
(25,58)-(25,74)
(25,59)-(25,61)
(25,65)-(25,67)
(25,65)-(25,73)
(25,65)-(25,73)
(26,4)-(27,68)
(26,15)-(26,23)
(26,16)-(26,18)
(27,4)-(27,68)
(27,15)-(27,17)
(27,35)-(27,49)
(27,35)-(27,61)
(27,50)-(27,51)
(27,52)-(27,56)
(27,57)-(27,61)
(28,13)-(28,34)
(28,14)-(28,17)
(28,18)-(28,33)
(28,19)-(28,26)
*)
