
let rec clone x n =
  if n < 1
  then []
  else
    (let rec helper acc f x =
       match x with | 0 -> acc | _ -> helper (f :: acc) f (x - 1) in
     helper [] x n);;

let _ =
  List.combine
    ((clone 7 7),
      (List.combine ([0; 0; 0; 1; 0; 0; 2], [0; 0; 0; 1; 0; 0; 2])));;
