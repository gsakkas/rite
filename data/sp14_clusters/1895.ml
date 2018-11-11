
let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  List.append
    ((clone 0 (lenl1 - lenl2) l1),
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
(8,5)-(8,33)
List.append (clone 0
                   (lenl1 - lenl2)) l1
AppG [AppG [EmptyG,EmptyG],VarG]

(8,6)-(8,11)
List.append
VarG

(8,6)-(8,11)
clone 0 (lenl1 - lenl2)
AppG [LitG,BopG EmptyG EmptyG]

*)
