
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
      | (h1::t1,rh::rt) ->
          (match x with | h2::t2 -> (t1, (((h1 + rh) mod 10) :: rt))) in
    let base = (l1, [0]) in
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
    let f a x =
      match a with
      | (h1::t1,rh::rt) -> (t1, ((((h1 + x) + rh) mod 10) :: rt)) in
    let base = (l1, [0]) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(26,12)-(26,67)
(26,18)-(26,19)
(26,45)-(26,47)
(26,50)-(26,52)
(27,5)-(28,69)
(28,5)-(28,69)
(28,22)-(28,69)
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
(11,7)-(11,60)
(11,20)-(11,25)
(11,20)-(11,29)
(11,34)-(11,36)
(11,34)-(11,60)
(11,39)-(11,50)
(11,39)-(11,60)
(11,51)-(11,57)
(14,7)-(14,61)
(14,20)-(14,25)
(14,20)-(14,29)
(14,35)-(14,46)
(14,35)-(14,56)
(14,47)-(14,53)
(14,54)-(14,56)
(22,3)-(29,33)
(22,12)-(28,69)
(23,5)-(28,69)
(23,11)-(26,67)
(23,13)-(26,67)
(24,7)-(26,67)
(24,7)-(26,67)
(24,13)-(24,14)
(26,12)-(26,67)
(26,12)-(26,67)
(26,18)-(26,19)
(26,45)-(26,47)
(26,45)-(26,52)
(27,5)-(28,69)
(27,17)-(27,19)
(27,17)-(27,24)
(28,5)-(28,69)
(28,16)-(28,18)
(28,36)-(28,50)
(28,36)-(28,62)
(28,51)-(28,52)
(28,53)-(28,57)
(28,58)-(28,62)
(29,15)-(29,18)
(29,15)-(29,33)
(29,20)-(29,27)
(29,20)-(29,33)
*)
