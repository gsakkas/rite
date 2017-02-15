
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length sl) > 1 then a ^ (sep ^ x) else a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ("; ", (List.map f l))) ^ "]");;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length sl) > 1 then a ^ (sep ^ x) else a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat "; " (List.map f l)) ^ "]");;

*)

(* changed spans
(9,30)-(9,64)
(9,41)-(9,63)
*)

(* type error slice
(2,3)-(7,60)
(2,18)-(7,58)
(6,51)-(6,60)
(6,52)-(6,55)
(6,56)-(6,57)
(9,30)-(9,64)
(9,31)-(9,40)
(9,41)-(9,63)
*)
