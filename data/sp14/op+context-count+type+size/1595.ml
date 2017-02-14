
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
    let f a x = (0, []) in
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
(23,5)-(25,69)
(23,11)-(23,23)
(23,13)-(23,23)
(23,18)-(23,23)
(23,21)-(23,23)
(24,5)-(25,69)
(24,17)-(24,19)
(24,17)-(24,23)
(24,21)-(24,23)
(25,5)-(25,69)
(25,22)-(25,69)
(25,36)-(25,50)
(25,36)-(25,62)
(25,51)-(25,52)
(25,53)-(25,57)
(25,58)-(25,62)
(25,66)-(25,69)
(26,3)-(26,33)
*)

(* type error slice
(5,4)-(14,64)
(5,13)-(14,61)
(5,16)-(14,61)
(6,3)-(14,61)
(7,3)-(14,61)
(8,3)-(14,61)
(10,7)-(11,60)
(11,7)-(11,60)
(11,34)-(11,36)
(11,34)-(11,60)
(14,35)-(14,46)
(14,35)-(14,56)
(14,54)-(14,56)
(22,3)-(26,33)
(22,12)-(25,69)
(23,5)-(25,69)
(23,11)-(23,23)
(23,13)-(23,23)
(23,18)-(23,19)
(23,18)-(23,23)
(24,5)-(25,69)
(24,17)-(24,19)
(24,17)-(24,23)
(25,36)-(25,50)
(25,36)-(25,62)
(25,51)-(25,52)
(25,53)-(25,57)
(26,15)-(26,18)
(26,15)-(26,33)
(26,20)-(26,27)
(26,20)-(26,33)
*)
