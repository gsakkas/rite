
let rec clone x n =
  if n < 1
  then []
  else
    (let rec helper acc f x =
       match x with | 0 -> acc | _ -> helper (f :: acc) f (x - 1) in
     helper [] x n);;

let args =
  List.combine (clone List.length l1 List.length l1)
    (List.combine (List.rev l1) (List.rev l2));;
