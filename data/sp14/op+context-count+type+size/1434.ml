
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
(23,4)-(25,68)
(23,10)-(23,23)
(23,12)-(23,23)
(23,16)-(23,23)
(23,20)-(23,22)
(24,4)-(25,68)
(24,15)-(24,23)
(24,16)-(24,18)
(24,20)-(24,22)
(25,4)-(25,68)
(25,21)-(25,68)
(25,35)-(25,49)
(25,35)-(25,61)
(25,50)-(25,51)
(25,52)-(25,56)
(25,57)-(25,61)
(25,65)-(25,68)
(26,2)-(26,34)
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
(11,32)-(11,61)
(11,33)-(11,35)
(14,33)-(14,56)
(14,34)-(14,45)
(14,53)-(14,55)
(22,2)-(26,34)
(22,11)-(25,68)
(23,4)-(25,68)
(23,10)-(23,23)
(23,12)-(23,23)
(23,16)-(23,23)
(23,17)-(23,18)
(24,4)-(25,68)
(24,15)-(24,23)
(24,16)-(24,18)
(25,35)-(25,49)
(25,35)-(25,61)
(25,50)-(25,51)
(25,52)-(25,56)
(26,13)-(26,34)
(26,14)-(26,17)
(26,18)-(26,33)
(26,19)-(26,26)
*)
