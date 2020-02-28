
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
List.map f l
AppG [VarG,VarG]

(5,9)-(5,23)
""
LitG

*)

(* type error slice
(4,6)-(5,24)
(4,7)-(4,22)
(4,64)-(4,66)
*)
