
let stringOfList f l =
  ("[" (fun x  -> fun acc  -> x ^ ("; " ^ acc)) List.fold_left (^) ""
     (List.map f l))
    ^ "]";;


(* fix

let stringOfList f l =
  "[" ^
    ((List.fold_left (fun x  -> fun acc  -> x ^ ("; " ^ acc)) ""
        (List.map f l))
       ^ "]");;

*)

(* changed spans
(3,4)-(4,19)
(3,9)-(3,46)
(3,49)-(3,63)
(3,64)-(3,67)
*)

(* type error slice
(3,4)-(3,7)
(3,4)-(4,19)
*)
