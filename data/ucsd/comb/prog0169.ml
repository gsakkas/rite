
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [((h * i) / 10) + (mulByDigit i t); (h * i) mod 10];;
