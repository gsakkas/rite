
let stringOfList f l =
  "[" ^
    ((List.fold_right (fun x  -> fun acc  -> x ^ ("; " ^ acc)) ""
        (List.map f l))
       ^ "]");;


(* fix

let stringOfList f l =
  "[" ^
    ((List.fold_right (fun x  -> fun acc  -> x ^ ("; " ^ acc)) (List.map f l)
        "")
       ^ "]");;

*)

(* changed spans
(4,64)-(4,66)
(6,10)-(6,13)
*)

(* type error slice
(4,7)-(4,22)
(4,7)-(5,22)
(4,64)-(4,66)
*)
