
let rec retHead l = match l with | [] -> [] | h::t -> h;;

let rec mulByDigit i l =
  match l with
  | [] -> []
  | hd::tl ->
      [((hd * i) mod 10) + (((retHead tl) * i) / 10)] @ (mulByDigit i tl);;
