
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
      match a with | [] -> (l1, [0; 0; 0; 0]) | h1::t1 -> (l1, [0; 0; 0; 0]) in
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
  let add (l1,l2) =
    let f a x = match a with | (h1::t1,_) -> (l1, [0; 0; 0; 0]) in
    let base = (l1, []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(24,6)-(24,76)
(24,58)-(24,76)
(24,59)-(24,61)
(24,63)-(24,75)
(24,64)-(24,65)
(24,67)-(24,68)
(24,70)-(24,71)
(24,73)-(24,74)
(25,4)-(26,68)
(26,4)-(26,68)
(26,21)-(26,68)
*)

(* type error slice
(23,4)-(26,68)
(23,10)-(24,76)
(23,12)-(24,76)
(24,6)-(24,76)
(24,6)-(24,76)
(24,6)-(24,76)
(24,12)-(24,13)
(24,27)-(24,45)
(26,35)-(26,49)
(26,35)-(26,61)
(26,50)-(26,51)
*)
