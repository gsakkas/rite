
let rec clone x n =
  match n > 0 with | true  -> x :: (clone x (n - 1)) | false  -> [];;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  match length1 >= length2 with
  | true  ->
      let n = length1 - length2 in
      let zeroes = clone 0 n in (l1, (List.append (zeroes l2)))
  | false  ->
      let n = length2 - length1 in
      let zeroes = clone 0 n in List.append ((zeroes l1), l2);;


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

*)

(* changed spans
(11,39)-(11,61)
(11,52)-(11,61)
(14,33)-(14,44)
(14,33)-(14,61)
(14,47)-(14,53)
(14,47)-(14,56)
*)

(* type error slice
(3,37)-(3,42)
(3,37)-(3,51)
(3,43)-(3,44)
(3,46)-(3,51)
(6,17)-(6,28)
(6,17)-(6,31)
(6,29)-(6,31)
(7,17)-(7,28)
(7,17)-(7,31)
(7,29)-(7,31)
(10,7)-(11,61)
(10,15)-(10,32)
(11,7)-(11,61)
(11,20)-(11,25)
(11,20)-(11,29)
(11,26)-(11,27)
(11,28)-(11,29)
(11,52)-(11,58)
(11,52)-(11,61)
(11,59)-(11,61)
(13,7)-(14,61)
(13,15)-(13,32)
(14,7)-(14,61)
(14,20)-(14,25)
(14,20)-(14,29)
(14,26)-(14,27)
(14,28)-(14,29)
(14,33)-(14,44)
(14,33)-(14,61)
(14,47)-(14,53)
(14,47)-(14,56)
(14,47)-(14,61)
(14,54)-(14,56)
(14,59)-(14,61)
*)
