
let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      sqsum
        ((mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i]);;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      [sqsum
         ((mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i])];;

*)

(* changed spans
(9,6)-(10,77)
[sqsum (mulByDigit i
                   (List.rev (List.map (fun x ->
                                          x * 10)
                                       t)) @ [h * i])]
ListG (AppG [EmptyG]) Nothing

*)
