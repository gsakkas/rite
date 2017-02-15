
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
(4,63)-(4,65)
(6,9)-(6,12)
*)

(* type error slice
(4,5)-(5,23)
(4,6)-(4,21)
(4,63)-(4,65)
*)
