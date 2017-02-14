
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
    let f a x = match a with | ah::at -> (match x with | xh::xt -> ah + at) in
    let base = l1 in
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
(23,11)-(23,75)
(23,13)-(23,75)
(23,17)-(23,75)
(23,23)-(23,24)
(23,43)-(23,75)
(23,49)-(23,50)
(23,68)-(23,70)
(23,68)-(23,75)
(23,73)-(23,75)
(24,5)-(25,69)
(24,16)-(24,18)
(25,5)-(25,69)
(25,22)-(25,69)
(26,3)-(26,33)
*)

(* type error slice
(23,5)-(25,69)
(23,11)-(23,75)
(23,13)-(23,75)
(23,17)-(23,75)
(23,17)-(23,75)
(23,17)-(23,75)
(23,17)-(23,75)
(23,23)-(23,24)
(23,43)-(23,75)
(23,68)-(23,75)
(23,68)-(23,75)
(23,73)-(23,75)
(25,36)-(25,50)
(25,36)-(25,62)
(25,51)-(25,52)
*)
