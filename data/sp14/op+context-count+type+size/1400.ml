
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
      let zeroes = clone 0 n in ((List.append zeroes), l2);;


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
(14,33)-(14,53)
(14,55)-(14,57)
*)

(* type error slice
(6,16)-(6,27)
(6,16)-(6,30)
(6,28)-(6,30)
(8,2)-(14,58)
(8,2)-(14,58)
(10,6)-(11,61)
(11,6)-(11,61)
(11,32)-(11,61)
(11,33)-(11,35)
(13,6)-(14,58)
(14,6)-(14,58)
(14,32)-(14,58)
(14,33)-(14,53)
(14,34)-(14,45)
*)
