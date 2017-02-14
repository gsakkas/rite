
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
(3,2)-(4,20)
(3,7)-(3,47)
(3,48)-(3,62)
(3,63)-(3,66)
*)

(* type error slice
(3,2)-(4,20)
(3,3)-(3,6)
*)
