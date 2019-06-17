
let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 < lenl2
  then
    ((List.append (clone 0 (lenl1 - lenl2)) l1),
      (List.append (clone 0 (lenl1 - lenl2)) l2));;


(* fix

let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  ((List.append (clone 0 (lenl1 - lenl2)) l1),
    (List.append (clone 0 (lenl1 - lenl2)) l2));;

*)

(* changed spans
(7,3)-(10,50)
(List.append (clone 0
                    (lenl1 - lenl2))
             l1 , List.append (clone 0
                                     (lenl1 - lenl2)) l2)
TupleG [AppG [EmptyG,EmptyG],AppG [EmptyG,EmptyG]]

*)

(* type error slice
(7,3)-(10,50)
(9,5)-(10,50)
(10,50)-(10,50)
*)
