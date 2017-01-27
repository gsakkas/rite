
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
      | (carry,result) -> (match x with | (h1::t1,h2::t2) -> (0, [])) in
    let base = (0, []) in
    let args = (l1, l2) in let (_,res) = List.fold_left f base args in res in
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
(23,5)-(27,75)
(23,11)-(25,68)
(23,13)-(25,68)
(24,7)-(25,68)
(24,13)-(24,14)
(25,28)-(25,68)
(25,34)-(25,35)
(25,63)-(25,68)
(25,66)-(25,68)
(26,5)-(27,75)
(26,17)-(26,22)
(26,20)-(26,22)
(27,5)-(27,75)
(28,3)-(28,33)
*)

(* type error slice
(23,5)-(27,75)
(23,11)-(25,68)
(23,13)-(25,68)
(24,7)-(25,68)
(24,13)-(24,14)
(25,28)-(25,68)
(25,34)-(25,35)
(25,63)-(25,64)
(25,63)-(25,68)
(25,66)-(25,68)
(26,5)-(27,75)
(26,17)-(26,18)
(26,17)-(26,22)
(26,20)-(26,22)
(27,5)-(27,75)
(27,17)-(27,19)
(27,17)-(27,23)
(27,21)-(27,23)
(27,42)-(27,56)
(27,42)-(27,68)
(27,57)-(27,58)
(27,59)-(27,63)
(27,64)-(27,68)
*)
