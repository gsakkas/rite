
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
(11,37)-(11,62)
(11,50)-(11,61)
(14,32)-(14,43)
(14,32)-(14,61)
(14,45)-(14,56)
(14,46)-(14,52)
*)

(* type error slice
(3,30)-(3,52)
(3,35)-(3,52)
(3,36)-(3,41)
(11,6)-(11,63)
(11,19)-(11,24)
(11,19)-(11,28)
(11,50)-(11,61)
(11,51)-(11,57)
(14,6)-(14,61)
(14,19)-(14,24)
(14,19)-(14,28)
(14,32)-(14,43)
(14,32)-(14,61)
(14,44)-(14,61)
(14,45)-(14,56)
(14,46)-(14,52)
*)
