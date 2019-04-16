
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
(3,3)-(4,21)
"["
LitG

(5,7)-(5,10)
List.fold_left (fun x ->
                  fun acc -> x ^ ("; " ^ acc))
               "" (List.map f l) ^ "]"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(3,3)-(4,21)
(3,4)-(3,7)
*)
