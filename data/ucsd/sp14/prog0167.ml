
let rec mulByDigit i l =
  match List.rev l with
  | [] -> 0
  | h::t -> [((h * i) / 10) + (mulByDigit i t); (h * i) mod 10];;
